-- DATA EXPLORATION WITH SQL (Microsoft SQL Server Management Studio)
-- Datasets `CovidProject.dbo.CovidDeaths` & `CovidProject.dbo.CovidVaccinations`

-- First we select the data from the two datasets to view

SELECT *
FROM
 CovidProject.dbo.CovidDeaths
--
SELECT *
FROM
 CovidProject.dbo.CovidVaccinations

-- We select columns we will be focusing on from the `dbo.CovidDeaths` dataset

SELECT
 location, date, total_cases, new_cases, total_deaths, population
FROM
 CovidProject.dbo.CovidDeaths

-- Comparing total cases vs. total deaths in location 'Africa'
-- Shows likelihood of death if you contracted Covid-19 in 'Africa'

SELECT
 location, date, total_cases, total_deaths,
 (total_deaths / total_cases)*100 AS total_deaths_percentage
FROM 
 CovidProject.dbo.CovidDeaths
WHERE
 total_deaths IS NOT NULL AND location = 'Africa'

-- Looking at total cases vs. population in location 'Africa'
-- Shows the percentage of the population that has contracted Covid-19

SELECT
 location, date, total_cases, population,
 (total_cases / population)*100 AS total_cases_percentage
FROM 
 CovidProject.dbo.CovidDeaths
WHERE 
 location = 'Africa'

-- Looking at max contraction rate vs. population for all locations in dataset

SELECT
 location, population, MAX(total_cases) AS max_total_cases,
 MAX((total_cases / population))*100 AS max_contraction_rate
FROM
 CovidProject.dbo.CovidDeaths
GROUP BY
 location, population
ORDER BY
 max_contraction_rate DESC

-- Looking at max deaths vs. population for all locations in dataset
-- We use CAST to convert the 'total_deaths' data type to a numerical value (int) instead of a character/string value 

SELECT
 location, population, MAX(CAST(total_deaths as int)) AS max_total_deaths,
 MAX((CAST(total_deaths as int) / population))*100 AS max_death_rate
FROM
 CovidProject.dbo.CovidDeaths
 
-- Removing instances where location is continent instead of country
 
WHERE 
 continent IS NOT NULL
GROUP BY 
 location, population
ORDER BY
 max_total_deaths DESC

-- Looking at max death rate by continent instead of location
-- due to discrapancies in original data format, filtering by continent requires that we select location where continent is 'null'

SELECT
location, MAX(CAST(total_deaths as int)) AS max_total_deaths
FROM 
 CovidProject.dbo.CovidDeaths
WHERE 
 continent IS NULL
GROUP BY
 location
ORDER BY
 max_total_deaths DESC

-- As the aim is ultimately prepare this data for analysis and visualization, we revert to filtering by continent where continent is 'null'

SELECT
continent, MAX(CAST(total_deaths as int))AS max_total_deaths
FROM 
 CovidProject.dbo.CovidDeaths
WHERE 
 continent IS NOT NULL
GROUP BY
 continent
ORDER BY
 max_total_deaths DESC

-- Aggregating by global numbers

SELECT
SUM(new_cases) AS total_cases, SUM(CAST(new_deaths as int)) AS total_deaths,
SUM(CAST(new_deaths as int))/SUM(new_cases)*100 AS death_rate_globe
FROM 
 CovidProject.dbo.CovidDeaths
WHERE 
 continent IS NOT NULL 
ORDER BY 
 death_rate_globe DESC

 -- Creating View for above death_rate_globe query for future reference if needed

CREATE VIEW death_rate_globe
AS
 SELECT
SUM(new_cases) AS total_cases, SUM(CAST(new_deaths as int)) AS total_deaths,
SUM(CAST(new_deaths as int))/SUM(new_cases)*100 AS death_rate_globe
FROM 
 CovidProject.dbo.CovidDeaths
WHERE 
 continent IS NOT NULL 

-- Joining 'CovidDeaths' table with 'CovidVaccinations' table
-- Looking at populations vs. vaccinations and number of vaccinations per date

SELECT 
Deaths.continent, Deaths.location, Deaths.date, population, Vaccinations.new_vaccinations,
SUM(CAST(Vaccinations.new_vaccinations as int)) OVER (PARTITION BY Deaths.location ORDER BY Deaths.location, Deaths.date) AS live_vaccinations_count
FROM 
 CovidProject.dbo.CovidDeaths AS Deaths
JOIN CovidProject.dbo.CovidVaccinations AS Vaccinations
 ON Deaths.location = Vaccinations.location
  AND Deaths.date = Vaccinations.date
WHERE 
 Deaths.continent IS NOT NULL
ORDER BY 
 location, date

 -- Creating View for above query

CREATE VIEW live_vaccinations_count
AS
 SELECT 
Deaths.continent, Deaths.location, Deaths.date, population, Vaccinations.new_vaccinations,
SUM(CAST(Vaccinations.new_vaccinations as int)) OVER (PARTITION BY Deaths.location ORDER BY Deaths.location, Deaths.date) AS live_vaccinations_count
FROM 
 CovidProject.dbo.CovidDeaths AS Deaths
JOIN CovidProject.dbo.CovidVaccinations AS Vaccinations
 ON Deaths.location = Vaccinations.location
  AND Deaths.date = Vaccinations.date
WHERE 
 Deaths.continent IS NOT NULL

-- inserting CTE to be able to execute additional aggregation that normal query will not allow
-- CTE name 'PopvsVac'

WITH PopvsVac (continent, location, date, population, new_vaccinations, live_vaccinations_count)
AS
(
 SELECT 
Deaths.continent, Deaths.location, Deaths.date, population, Vaccinations.new_vaccinations,
SUM(CAST(Vaccinations.new_vaccinations as int)) OVER (PARTITION BY Deaths.location ORDER BY Deaths.location, Deaths.date) AS live_vaccinations_count
FROM 
 CovidProject.dbo.CovidDeaths AS Deaths
JOIN CovidProject.dbo.CovidVaccinations AS Vaccinations
 ON Deaths.location = Vaccinations.location
  AND Deaths.date = Vaccinations.date
WHERE 
 Deaths.continent IS NOT NULL
 )
SELECT *,
 (live_vaccinations_count / population)*100 AS percentage_of_population_vaccinated
FROM
 PopvsVac

-- Instead of a CTE, we could use a TEMP TABLE to achieve the above
-- TEMP TABLE
 
DROP TABLE IF EXISTS #temp_PopvsVac
CREATE TABLE #temp_PopvsVac
(continent nvarchar(255), location nvarchar(255), date datetime, population numeric, new_vaccinations numeric, live_vaccinations_count numeric)
--
INSERT INTO #temp_PopvsVac 
SELECT 
Deaths.continent, Deaths.location, Deaths.date, population, Vaccinations.new_vaccinations,
SUM(CAST(Vaccinations.new_vaccinations as int)) OVER (PARTITION BY Deaths.location ORDER BY Deaths.location, Deaths.date) AS live_vaccinations_count
FROM 
 CovidProject.dbo.CovidDeaths AS Deaths
JOIN CovidProject.dbo.CovidVaccinations AS Vaccinations
 ON Deaths.location = Vaccinations.location
  AND Deaths.date = Vaccinations.date
WHERE 
 Deaths.continent IS NOT NULL

SELECT *,
(live_vaccinations_count / population)*100 AS percentage_of_population_vaccinated
FROM
 #temp_PopvsVac

-- Creating View to store data for future visualization of analysis
-- View function useful for storing segments of queried data for future us

CREATE VIEW PopvsVac 
 AS
 SELECT 
Deaths.continent, Deaths.location, Deaths.date, population, Vaccinations.new_vaccinations,
SUM(CAST(Vaccinations.new_vaccinations as int)) OVER (PARTITION BY Deaths.location ORDER BY Deaths.location, Deaths.date) AS live_vaccinations_count
FROM 
 CovidProject.dbo.CovidDeaths AS Deaths
JOIN CovidProject.dbo.CovidVaccinations AS Vaccinations
 ON Deaths.location = Vaccinations.location
  AND Deaths.date = Vaccinations.date
WHERE 
 Deaths.continent IS NOT NULL

-- The extent of data exploration is dependent on the business case and objective, the steps taken above are the most common, but not all there is to the process
-- END

