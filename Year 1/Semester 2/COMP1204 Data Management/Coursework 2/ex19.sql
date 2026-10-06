SELECT CovidData.dateRep,SUM(deaths) OVER upToHere AS 'Cumulative UK Deaths',SUM(cases) OVER upToHere AS 'Cumulative UK Cases'
FROM CovidData
    JOIN Dates
        ON CovidData.dateRep = Dates.dateRep
    JOIN Countries
        ON CovidData.geoId = Countries.geoId
WHERE countriesAndTerritories='United_Kingdom'
WINDOW upToHere AS (ORDER BY year,month,day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
ORDER BY year,month,day;