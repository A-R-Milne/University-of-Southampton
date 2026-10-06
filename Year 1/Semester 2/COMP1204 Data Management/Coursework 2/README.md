# COMP1204 Data Management Coursework 2
This repository contains the second coursework I completed for my module COMP1204 *Data Management*. The following is contained within:

## coronavirus.db
A database file populated by running `dataset.sql`, `ex11.sql` and `ex12.sql` through exercise 13. It contains the following relations:

### Dates
- dateRep (TEXT) [Key Attribute]
- day (INTEGER)
- month (INTEGER)
- year (INTEGER)

Super Key: {dateRep}

### Countries
- geoId (TEXT) [Key Attribute]
- countriesAndTerritories (TEXT)
- countryTerritoryCode (TEXT)
- continentExp (TEXT)

Super Key: {geoId}

### CovidData
- dateRep (TEXT) [Key Attribute]
- geoId (TEXT) [Key Attribute]
- cases (INTEGER)
- deaths (INTEGER)

Super Key: {dateRep, gepId}

### CountryPopulationByYear
- geoId (TEXT) [Key Attribute]
- popData2020 (INTEGER)

Super Key: {geoId}

## CovidData[NUM].csv
A CSV file produced by `plot.sh`, containing a filter of `result.csv` for a specific country. The corresponding countries are:
1. Bulgaria
2. Czechia
3. France
4. Germany
5. Hungary
6. Italy
7. Poland
8. Romania
9. Spain
10. United Kingdom

## dataset.csv
The original CSV provided, which is a snapshot of the COVID-19 information present on the EU Open Data Portal.

## dataset.sql
An SQL dump of the initial database, as set up by exercise 10.

## dataset2.sql
An SQL dump of the normalised representation of the initial database, as set up by exercises 10 and 11.

## dataset3.sql
An SQL dump of the normalised representation of the initial database after being populated, as set up by exercises 10-12.

## ex11.sql
The SQL statement for exercise 11, which creates the full normalised representation of the database.

## ex12.sql
The SQL statement for exercise 12, which populates the full normalised representation of the database.

## ex14.sql
The SQL statement for exercise 14, which queries the worldwide total number of cases and deaths (with total cases and total deaths as columns).

## ex15.sql
The SQL statement for exercise 15, which queries the number of cases by date, in increasing date order, for the United Kingdom (with the date reported and number of cases as columns).

## ex16.sql
The SQL statement for exercise 16, which queries the number of cases and deaths by date, in increasing date order, for each country (with country name, date, number of cases and number of deaths as columns).

## ex17.sql
The SQL statement for exercise 17, which queries the total number of cases and deaths as a percentage (to 2 decimal places) of the population, for each country (with country name, cases as % of population and deaths as % of population as columns).

## ex18.sql
The SQL statement for exercise 18, which queries a descending list of the the top 10 countries by name, by percentage (to 2 decimal places) total deaths out of total cases in that country (with country name and deaths as % of country cases as columns).

## ex19.sql
The SQL statement for exercise 19, which queries the date against a cumulative running total of the number of deaths by day and cases by day for the united kingdom (with date, cumulative UK deaths and cumulative UK cases as columns).

## graph.png
A chart created by `plot.sh`, which shows the cumulative deaths for each of the top ten countries in terms of COVID deaths.

## plot.sh
The shell script for exercise 20, which creates `graph.png`, a chart containing the cumulative deaths for each of the top ten countries in terms of COVID deaths.

## report.pdf and report.tex
PDF and LaTeX forms of the final report used to describe how I completed this coursework.

## result.csv
A CSV file produced by the SQLite3 portion of `plot.sh` (as shown in `test.sql`), containing the cumulative deaths from COVID by day for each of the top 10 countries by total COVID deaths.

## test.sql
The SQLite3 portion of `plot.sh`, which creates `result.csv`.