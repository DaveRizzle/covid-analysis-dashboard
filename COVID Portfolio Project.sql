--SELECT location, date, total_cases, new_cases, total_deaths, population
--FROM [Portfolio Project Database]..CovidDeaths;


-- Total Cases Vs Total Deaths
-- Likelihood of death from contracting Covid-19 in the United States.
--SELECT location, date, total_cases, new_cases, total_deaths, (total_deaths/total_cases) * 100 AS DeathPercentage
--FROM [Portfolio Project Database]..CovidDeaths
--WHERE location LIKE '%states%'
--ORDER BY 1,2;

--Total Cases vs Population
--Shows what percentage of the population contracted Covid
--SELECT location, date, population, total_cases, (total_cases/population) * 100 AS DeathPercentage
--FROM [Portfolio Project Database]..CovidDeaths
--WHERE location LIKE '%south africa%'
--ORDER BY 1,2;

-- Looking at countries with highest infection rate compared to population

--SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population)) * 100 AS PercentPopulationInfected
--FROM [Portfolio Project Database]..CovidDeaths
--GROUP BY location, population
--ORDER BY PercentPopulationInfected DESC;

-- Countries with highest death count per population

--SELECT location, MAX(cast(total_deaths as int)) AS TotalDeathCount
--FROM [Portfolio Project Database]..CovidDeaths
--WHERE continent IS NOT NULL
--GROUP BY location
--ORDER BY TotalDeathCount DESC;


--Showing continents with the highest death count per population

--SELECT continent, MAX(cast(total_deaths as int)) AS TotalDeathCount
--FROM [Portfolio Project Database]..CovidDeaths
--WHERE continent IS NOT NULL
--GROUP BY continent
--ORDER BY TotalDeathCount DESC;

--Global Numbers

--SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS int)) AS total_deaths, SUM(CAST(new_deaths AS int)) / SUM(new_cases)* 100 AS DeathPercentage 
--FROM [Portfolio Project Database]..CovidDeaths
--WHERE continent IS NOT NULL
--ORDER BY 1,2;

--Look at Total Population vs Vaccinations

-- USE CTE

--WITH PopvsVac (continent, location, Date, Population, new_vaccinations, RollingPeopleVaccinated)
--AS
--(
--SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
--SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, CONVERT(date, dea.date)) AS RollingPeopleVaccinated
-- --(RollingPeopleVaccinated/population)*100
--FROM CovidDeaths AS dea
--JOIN CovidVaccinations$ AS vac
--	ON dea.location = vac.location
--	and dea.date = vac.date
--WHERE dea.continent IS NOT NULL

--)

--SELECT *, (RollingPeopleVaccinated/Population) * 100
--FROM PopvsVac

-- TEMP TABLE

DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, CONVERT(date, dea.date)) AS RollingPeopleVaccinated
 --(RollingPeopleVaccinated/population)*100
FROM CovidDeaths AS dea
JOIN CovidVaccinations$ AS vac
	ON dea.location = vac.location
	and dea.date = vac.date
--WHERE dea.continent IS NOT NULL

SELECT *, (RollingPeopleVaccinated/Population) * 100
FROM #PercentPopulationVaccinated


--CREATING VIEW TO STORE DATA FOR LATER VISUALISATIONS

CREATE VIEW PercentPopulationVaccinated AS 
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(bigint, vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, CONVERT(date, dea.date)) AS RollingPeopleVaccinated
 --(RollingPeopleVaccinated/population)*100
FROM CovidDeaths AS dea
JOIN CovidVaccinations$ AS vac
	ON dea.location = vac.location
	and dea.date = vac.date
WHERE dea.continent IS NOT NULL
--ORDER BY 2,3

SELECT * 
FROM PercentPopulationVaccinated