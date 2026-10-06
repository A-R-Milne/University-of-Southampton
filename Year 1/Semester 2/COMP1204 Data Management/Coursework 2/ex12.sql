BEGIN TRANSACTION;
INSERT INTO Dates SELECT DISTINCT dateRep,day,month,year FROM "dataset";
INSERT INTO Countries SELECT DISTINCT geoId,countriesAndTerritories,countryterritoryCode,continentExp FROM "dataset";
INSERT INTO CovidData SELECT DISTINCT dateRep,geoId,NULLIF(cases,''),NULLIF(deaths,'') FROM "dataset";
INSERT INTO CountryPopulationByYear SELECT DISTINCT geoId,popData2020 FROM "dataset";
COMMIT;