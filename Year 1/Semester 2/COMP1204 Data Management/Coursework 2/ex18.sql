SELECT countriesAndTerritories AS 'Country Name',ROUND((CAST(SUM(deaths) AS REAL)/NULLIF(CAST(SUM(cases) AS REAL),0))*100,2) AS '% Deaths of Country Cases'
FROM CovidData
    JOIN Countries
        ON CovidData.geoId = Countries.geoId
GROUP BY Countries.geoId
ORDER BY 2 DESC
LIMIT 10;