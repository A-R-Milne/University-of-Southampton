SELECT CovidData.dateRep,cases
FROM CovidData
    JOIN Dates
        ON CovidData.dateRep = Dates.dateRep
    JOIN Countries
        ON CovidData.geoId = Countries.geoId
WHERE countriesAndTerritories='United_Kingdom'
ORDER BY year,month,day;