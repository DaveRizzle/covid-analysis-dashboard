#MySQL | Tableau

#Link to Dashboard: https://public.tableau.com/app/profile/dave.robertson/viz/CovidPortfolioProject_16595426291610/Dashboard1?publish=yes

# COVID-19 Data Analysis Using SQL

This project encompasses an in-depth analysis of COVID-19 data, focusing on various metrics such as total cases, deaths, and vaccination rates across different regions and countries. By leveraging SQL techniques, this analysis aims to provide insights into the impact of the pandemic and the global response to it.

## Analysis Overview

The analysis is structured around several key queries that explore different aspects of the COVID-19 pandemic:

1. **Total Cases vs. Total Deaths:**
   - Analysis of the likelihood of death from contracting COVID-19 in the United States, showcasing the death percentage in relation to total cases.

2. **Total Cases vs. Population:**
   - Examination of what percentage of the population contracted COVID-19, with a specific look at South Africa.

3. **Infection Rate Compared to Population:**
   - Identification of countries with the highest infection rate relative to their population.

4. **Death Count per Population:**
   - Analysis of countries with the highest death count per population.

5. **Continent-Wise Death Count:**
   - Aggregation of data to show continents with the highest death count per population.

6. **Global Numbers:**
   - A global overview of total cases, total deaths, and the death percentage.

7. **Population vs. Vaccinations:**
   - Analysis of vaccination rates using both Common Table Expressions (CTEs) and temporary tables to calculate the percentage of the population vaccinated in different locations.

8. **Creation of a View for Vaccination Data:**
   - Establishment of a view to store vaccination data for later visualizations and analyses.

## SQL Techniques Employed

- **Aggregate Functions:** Used to compute total cases, deaths, and vaccination counts.
- **Window Functions:** Employed for calculating rolling sums, particularly in the context of vaccination data.
- **Common Table Expressions (CTEs) and Temporary Tables:** Utilized for intermediate data manipulation and to facilitate complex calculations.
- **Views:** Created for storing and easily accessing calculated metrics for future analyses.
- **Data Filtering and Partitioning:** Applied to segment data by location, date, and other relevant dimensions.

## Key Insights

- The project highlights significant disparities in infection rates and death tolls across different countries and continents.
- Vaccination rates vary widely, with some countries achieving high levels of vaccination coverage, while others lag behind.
- The creation of views and the use of temporary tables and CTEs streamline the process of analyzing large datasets and performing longitudinal studies.

## Conclusion

This SQL-based analysis of COVID-19 data offers a comprehensive look at the pandemic's trajectory, the effectiveness of response measures, and the progress of vaccination campaigns worldwide. The insights derived from this project can inform public health strategies and contribute to a better understanding of the pandemic's global impact.
