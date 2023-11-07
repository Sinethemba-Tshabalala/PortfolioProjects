-- DATA CLEANING WITH SQL (Microsoft SQL Server Management Studio)
-- Database `NashvilleHousing.dbo.Housing_data`

-- To start, we select the whole dataset to view

SELECT *
FROM
 NashvilleHousing.dbo.Housing_data

-- Changing SaleDate date format to exclude time as it is not necessary in context of the other data in the set

SELECT
 CAST(SaleDate as date) AS SaleDate_converted
FROM 
 NashvilleHousing.dbo.Housing_data

-- Updating 'SaleDateConverted' column into the dataset
--Selecting SaleDate to view
	
SELECT 
 SaleDate
FROM 
 NashvilleHousing.dbo.Housing_data

-- First we run the ALTER TABLE function to add the 'SaleDateConverted' column with the desired date format to the dataset

ALTER TABLE Housing_data
ADD 
 SaleDateConverted date;

-- Then we run the UPDATE function to insert converted SaleDate data into added 'SaleDateConverted' column

UPDATE 
 Housing_data
SET 
 SaleDateConverted = CAST(SaleDate as date)

-- Testing
SELECT 
 SaleDateConverted
FROM 
 NashvilleHousing.dbo.Housing_data

-- Populating PropertyAddress cells where PropertyAddress is 'null' using unique ParcelID as reference
-- Selecting all data where PropertyAddress is null to view

SELECT *
FROM 
 NashvilleHousing.dbo.Housing_data
WHERE 
 PropertyAddress IS NULL

-- Looking at ParcelID in context of the entire dataset
SELECT *
FROM 
 NashvilleHousing.dbo.Housing_data
ORDER BY
 ParcelID

-- Using 'self' JOIN function to join table to itself to be able to set logical conditions
-- JOINING tables on ParcelID, and using filter to find instances where ParcelIDs from both tables match, but PropertyAddress is null on either
-- Where PropertyAddress is null but ParcelIDs match, we will populate the PropertyAddress with the one in the matching table using ISNULL

SELECT 
 table_01.ParcelID, table_01.PropertyAddress, table_02.ParcelID, table_02.PropertyAddress, ISNULL(table_01.PropertyAddress, table_02.PropertyAddress)
 AS PropertyAddressFill
FROM 
 NashvilleHousing.dbo.Housing_data AS table_01
JOIN NashvilleHousing.dbo.Housing_data AS table_02
 ON table_01.ParcelID = table_02.ParcelID
   AND table_01.UniqueID <> table_02.UniqueID
WHERE 
 table_01.PropertyAddress IS NULL

-- Inserting populated PropertyAddress using UPDATE function

UPDATE table_01
SET PropertyAddress = ISNULL(table_01.PropertyAddress, table_02.PropertyAddress)
 FROM 
 NashvilleHousing.dbo.Housing_data AS table_01
JOIN NashvilleHousing.dbo.Housing_data AS table_02
 ON table_01.ParcelID = table_02.ParcelID
   AND table_01.UniqueID <> table_02.UniqueID
WHERE 
 table_01.PropertyAddress IS NULL

-- Checking if table was appropriately updated/altered
SELECT *
FROM
 NashvilleHousing.dbo.Housing_data
WHERE 
 PropertyAddress IS NULL

-- Changing format of PropertyAddress to have the address and city in separate columns using SUBSTRING and CHARINDEX functions
-- Selecting PropertyAddress to view
SELECT
 PropertyAddress
FROM 
 NashvilleHousing.dbo.Housing_data

-- Splitting PropertyAddress into 'Address' and 'CityAddress' columns using the delimiter ',' to mark point of separation

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) AS PropertySplitAddress,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) AS PropertySplitCity
FROM
NashvilleHousing.dbo.Housing_data

-- Creating two new columns in the dataset to add the two columns to hold the split address segments as specified above using ALTER TABLE
-- Updating the two new columns into the dataset using UPDATE

ALTER TABLE NashvilleHousing.dbo.Housing_data
ADD PropertySplitAddress nvarchar(255);
--
UPDATE NashvilleHousing.dbo.Housing_data
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)
FROM
 NashvilleHousing.dbo.Housing_data
--
ALTER TABLE NashvilleHousing.dbo.Housing_data
ADD PropertySplitCity nvarchar(255);
--
UPDATE NashvilleHousing.dbo.Housing_data
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress))
FROM  
NashvilleHousing.dbo.Housing_data

-- Splitting the OwnerAdress into three segments, 'OwnerSplitAddress', 'OwnerSplitCity', and 'OwnerSplitState' using PARSENAME

SELECT
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3) AS OwnerSplitAddress,
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2) AS OwnerSplitCity,
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1) AS OwnerSplitState
FROM
 NashvilleHousing.dbo.Housing_data
--
ALTER TABLE NashvilleHousing.dbo.Housing_data
ADD OwnerSplitAddress nvarchar(255);
--
UPDATE NashvilleHousing.dbo.Housing_data
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)
FROM 
 NashvilleHousing.dbo.Housing_data
--
ALTER TABLE NashvilleHousing.dbo.Housing_data
ADD OwnerSplitCity nvarchar(255);
--
UPDATE NashvilleHousing.dbo.Housing_data
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)
FROM 
 NashvilleHousing.dbo.Housing_data
--
ALTER TABLE NashvilleHousing.dbo.Housing_data
ADD OwnerSplitState nvarchar(255);
--
UPDATE NashvilleHousing.dbo.Housing_data
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM
 NashvilleHousing.dbo.Housing_data

-- Changing the formating to the 'SoldAsVacant' column to just 'Yes' and 'No' instead of 'Y' and 'N' as well for consistency
-- Using CASE statement

SELECT 
 SoldAsVacant,
 CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
     WHEN SoldAsVacant = 'N' THEN 'No'
	 ELSE SoldAsVacant
 END 
FROM 
 NashvilleHousing.dbo.Housing_data
--
-- Updating the formatted column to the dataset

UPDATE NashvilleHousing.dbo.Housing_data
SET SoldAsVacant = CASE WHEN SoldAsVacant = 'Y' THEN 'Yes'
                        WHEN SoldAsVacant = 'N' THEN 'No'
	                    ELSE SoldAsVacant
                        END

-- Removing duplicates
-- First we create a column 'RowNum' to count the identical rows in the dataset (where RowNum > 1 there is a duplicate)
-- We then create a CTE in order to filter the RowNum results to find instances where rows are duplicated, then delete the duplicate rows

WITH RowNumCTE AS (
SELECT *,
ROW_NUMBER() OVER (
 PARTITION BY ParcelID,
              PropertyAddress,
              SaleDate,
              SalePrice,
              LegalReference
 ORDER BY
              UniqueID
) AS RowNum
FROM
 NashvilleHousing.dbo.Housing_data
 )
DELETE * 
FROM RowNumCTE
WHERE
 RowNum > 1

-- Deleting unused columns

ALTER TABLE NashvilleHousing.dbo.Housing_data
DROP COLUMN PropertyAddress, OwnerAddress, TaxDistrict
--
ALTER TABLE NashvilleHousing.dbo.Housing_data
DROP COLUMN SaleDate

-- Now the data would be more useful for analysis to gain valuable insights
-- END
