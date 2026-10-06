SELECT countriesAndTerritories AS 'Country Name',ROUND((CAST(SUM(cases) AS REAL)/NULLIF(popData2020,0))*100,2) AS '% Cases of Population',ROUND((CAST(SUM(deaths) AS REAL)/NULLIF(popData2020))*100,2) AS '% Deaths of Population'
FROM CovidData
    JOIN Countries
        ON Countries.geoId = CovidData.geoId
    JOIN CountryPopulationByYear
        ON Countries.geoId = CountryPopulationByYear.geoId
GROUP BY Countries.geoId;