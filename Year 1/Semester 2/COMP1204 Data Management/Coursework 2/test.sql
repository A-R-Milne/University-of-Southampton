--sqlite3 coronavirus.db <<ENDOF-SQL
SELECT DISTINCT Countries.countriesAndTerritories,CovidData.dateRep,TOTAL(CovidData.deaths) OVER upToHere AS 'CumulativeDeaths'
FROM CovidData
        JOIN Dates
                ON CovidData.dateRep = Dates.dateRep
        JOIN Countries
                ON CovidData.geoId = Countries.geoId
WHERE CovidData.geoId IN (SELECT geoId
        FROM CovidData
        GROUP BY geoId
        ORDER BY SUM(deaths) DESC
        LIMIT 10)
WINDOW upToHere AS (PARTITION BY CovidData.geoId ORDER BY year,month,day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
ORDER BY CovidData.geoId,year,month,day;
--ENDOF-SQL