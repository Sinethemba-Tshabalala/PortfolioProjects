-- Inspecting and analyzing sales data to gain insights to present to the relevant stakeholders

-- Selecting all the data to view
SELECT 
 *
FROM
 Sales.dbo.sales_data_sample

-- Checking unique values within data
-- Distinct 'STATUS'
SELECT
 DISTINCT STATUS
FROM 
 Sales.dbo.sales_data_sample
-- Distinct 'YEAR_ID'
SELECT
 DISTINCT YEAR_ID
FROM 
 Sales.dbo.sales_data_sample
ORDER BY
 YEAR_ID
-- Distinct 'PRODUCTLINE'
SELECT
 DISTINCT PRODUCTLINE
FROM 
 Sales.dbo.sales_data_sample
-- Distinct 'COUNTRY'
SELECT
 DISTINCT COUNTRY
FROM 
 Sales.dbo.sales_data_sample
-- Distinct 'TERRITORY'
SELECT
 DISTINCT TERRITORY
FROM 
 Sales.dbo.sales_data_sample
-- Distinct 'DEALSIZE'
SELECT
 DISTINCT DEALSIZE
FROM 
 Sales.dbo.sales_data_sample

-- Analysis
-- Start by grouping sales by 'PRODUCTLINE'
SELECT
 PRODUCTLINE,
 SUM(SALES) AS REVENUE
FROM
 Sales.dbo.sales_data_sample
GROUP BY
 PRODUCTLINE
ORDER BY
 REVENUE DESC -- PRODUCTLINE 'Classic Cars' is the top selling item
-- Checking sales across the years
SELECT 
 YEAR_ID,
 SUM(SALES) AS REVENUE
FROM
 Sales.dbo.sales_data_sample
GROUP BY 
 YEAR_ID 
ORDER BY
 REVENUE DESC -- 2004 was the company's most lucrative year, while sales were unsually low in 2005
-- To understand the low sales in 2005, we check the number of months the company was operational for in 2005
SELECT
 DISTINCT MONTH_ID
FROM 
 Sales.dbo.sales_data_sample
WHERE 
 YEAR_ID = '2005' -- The company was only operational for 5 months in 2005
-- Checking sales by 'DEALSIZE'
SELECT
 DEALSIZE,
 SUM(SALES) AS REVENUE
FROM
 Sales.dbo.sales_data_sample
GROUP BY
 DEALSIZE
ORDER BY 
 REVENUE DESC -- DEALSIZE Medium was the most lucrative
-- Checking what the best month for sales was in each year
SELECT
 MONTH_ID,
 SUM(SALES) AS REVENUE,
 COUNT(ORDERNUMBER) AS FREQUENCY
FROM
 Sales.dbo.sales_data_sample
WHERE YEAR_ID = '2003' -- Change year for corresponding results
GROUP BY
 MONTH_ID
ORDER BY
 REVENUE DESC -- November (Month 11) seems to be the company's most lucrative month across the years (2003 and 2004)
-- Checking which products the company sells most in November
SELECT
PRODUCTLINE,
 MONTH_ID,
 SUM(SALES) AS REVENUE,
 COUNT(ORDERNUMBER) AS FREQUENCY
FROM
 Sales.dbo.sales_data_sample
WHERE YEAR_ID = '2003' AND MONTH_ID = '11' -- Change year for corresponding results
GROUP BY
 MONTH_ID, 
 PRODUCTLINE
ORDER BY
 REVENUE DESC -- 'Classic Cars' is the product that generates the most revenue in November, the most lucrative month 

-- Checking who the best customer is (Recency-Frequency-Monetary(RFM) Analysis)
-- Here we create a temp table for the CTEs and buckets we create (NTILES) to group data for more effective analysis

DROP TABLE IF EXISTS #RFM_TEMP
;WITH RFM AS
	(SELECT
		 DISTINCT CUSTOMERNAME,
		 SUM(SALES) AS MONETARY_VALUE,
		 AVG(SALES) AS AVERAGE_MONETARY_VALUE,
		 COUNT(ORDERNUMBER) AS FREQUENCY,
		 MAX(ORDERDATE) AS LAST_ORDER_DATE,
		  (SELECT MAX(ORDERDATE) FROM Sales.dbo.sales_data_sample) AS MAX_ORDER_DATE,
		  DATEDIFF(DD, MAX(ORDERDATE), (SELECT MAX(ORDERDATE) FROM Sales.dbo.sales_data_sample)) AS RECENCY
	FROM
	 Sales.dbo.sales_data_sample
	GROUP BY
	 CUSTOMERNAME
),
RFM_CALC AS
(
	SELECT *,
		NTILE(4) OVER (ORDER BY RECENCY DESC) AS RFM_RECENCY,
		NTILE(4) OVER (ORDER BY FREQUENCY) AS RFM_FREQUENCY,
		NTILE(4) OVER (ORDER BY AVERAGE_MONETARY_VALUE) AS RFM_MONETARY
	FROM 
	 RFM
) 
SELECT *,
	(RFM_RECENCY + RFM_FREQUENCY + RFM_MONETARY) AS RFM_CELL,
	CAST(RFM_RECENCY AS varchar) + CAST(RFM_FREQUENCY AS varchar) + CAST(RFM_MONETARY As varchar) AS RFM_CELL_STR
INTO #RFM_TEMP
FROM
 RFM_CALC

SELECT *
FROM
 #RFM_TEMP
-- Creating CASE statements to classify Customers according to RFM_CELL score
SELECT 
 CUSTOMERNAME,
 RFM_RECENCY,
 RFM_FREQUENCY,
 RFM_MONETARY,
 RFM_CELL,
 CASE
  WHEN RFM_CELL <= 3 THEN 'low value customer'
  WHEN RFM_CELL <= 6 THEN 'upper-low value customer'
  WHEN RFM_CELL <=9 THEN 'mid value customer'
  WHEN RFM_CELL <= 12 THEN 'high value customer'
   END AS RFM_SEGMENT
FROM
 #RFM_TEMP
ORDER BY 
 RFM_CELL DESC -- According to the RFM_CELL score, 'The Sharp Gifts Warehouse' and 'Danish Wholesale Imports' are the best customers


-- We have used SQL to gain valuable insights to present to the relevant stakeholders to make data-driven decisions
-- The next step would be to use a BI tool (such as Tableau) to visualize the insights gained
-- END