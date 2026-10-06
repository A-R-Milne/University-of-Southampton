SELECT countriesAndTerritories,CovidData.dateRep,cases,deaths
FROM CovidData
    JOIN Dates
        ON CovidData.dateRep = Dates.dateRep
    JOIN Countries
        ON CovidData.geoId = Countries.geoId
ORDER BY continentExp,Countries.geoId,year,month,day;