#!/bin/sh

#Note: This has been tested using SQLite 3.45.2, gnuplot 6.0 patchlevel 0 and GNU bash 4.2.46(2)-release. Running this on earlier versions of these software may cause unintended errors.

#SQLite3 Commands
sqlOutput=$(mktemp --suffix=.csv)
sqlite3 coronavirus.db "SELECT DISTINCT Countries.countriesAndTerritories,CovidData.dateRep,TOTAL(CovidData.deaths) OVER upToHere AS 'CumulativeDeaths' \
FROM CovidData \
        JOIN Dates \
                ON CovidData.dateRep = Dates.dateRep \
        JOIN Countries \
                ON CovidData.geoId = Countries.geoId \
WHERE CovidData.geoId IN (SELECT geoId \
        FROM CovidData \
        GROUP BY geoId \
        ORDER BY SUM(deaths) DESC \
        LIMIT 10) \
WINDOW upToHere AS (PARTITION BY CovidData.geoId ORDER BY year,month,day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) \
ORDER BY CovidData.geoId,year,month,day; > $sqlOutput

#Set up for GnuPlot
countries=$(cat $sqlOutput | awk -F, '{print $1}' | sort | uniq)
CovidData=()
for i in $(seq 1 10)
do
	relevantCountry=$(echo "$countries" | tail -n+$i | head -1)
	CovidData[$i]=$(awk -F, -v nation="$relevantCountry" '{if ($1 == nation) {print $2 "," $3}}' $sqlOutput)
	eval "CovidData$i=()"
	arraylength=1;
	for group in ${CovidData[$i]}
	do
		eval "CovidData$i[$arraylength]=$group";
		let arraylength=arraylength+1;
	done
done

#GnuPlot Commands
gnuplot<<ENDOF-GNUPLOT
set terminal png truecolor
set output "graph.png"
set datafile separator ","
set xdata time
set timefmt '%d/%m/%Y'
set xrange ["31/12/2019":"04/05/2022"]
set yrange [0:180000]
set format x "%m/%y"
unset x2tics
unset y2tics

size1 = system("echo ${#CovidData1[*]}")
array data1[size1]
do for [i=1:size1] {data1[i] = ${CovidData1[i]}}

size2 = system("echo ${#CovidData2[*]}")
array data2[size2]
do for [i=1:size2] {data2[i] = ${CovidData2[i]}}

size3 = system("echo ${#CovidData3[*]}")
array data3[size3]
do for [i=1:size3] {data3[i] = ${CovidData3[i]}}

size4 = system("echo ${#CovidData4[*]}")
array data4[size4]
do for [i=1:size4] {data4[i] = ${CovidData4[i]}}

size5 = system("echo ${#CovidData5[*]}")
array data5[size5]
do for [i=1:size5] {data5[i] = ${CovidData5[i]}}

size6 = system("echo ${#CovidData6[*]}")
array data6[size6]
do for [i=1:size6] {data6[i] = ${CovidData6[i]}}

size7 = system("echo ${#CovidData7[*]}")
array data7[size7]
do for [i=1:size7] {data7[i] = ${CovidData7[i]}}

size8 = system("echo ${#CovidData8[*]}")
array data8[size8]
do for [i=1:size8] {data8[i] = ${CovidData8[i]}}

size9 = system("echo ${#CovidData9[*]}")
array data9[size9]
do for [i=1:size9] {data9[i] = ${CovidData9[i]}}

size10 = system("echo ${#CovidData10[*]}")
array data10[size10]
do for [i=1:size10] {data10[i] = ${CovidData10[i]}}

plot data1 using 1:2 t system("echo $countries | tail -n+1 | head -1") with lines, \
data2 using 1:2 t system("echo $countries | tail -n+2 | head -1") with lines, \
data3 using 1:2 t system("echo $countries | tail -n+3 | head -1") with lines, \
data4 using 1:2 t system("echo $countries | tail -n+4 | head -1") with lines, \
data5 using 1:2 t system("echo $countries | tail -n+5 | head -1") with lines, \
data6 using 1:2 t system("echo $countries | tail -n+6 | head -1") with lines, \
data7 using 1:2 t system("echo $countries | tail -n+7 | head -1") with lines, \
data8 using 1:2 t system("echo $countries | tail -n+8 | head -1") with lines, \
data9 using 1:2 t system("echo $countries | tail -n+9 | head -1") with lines, \
data10 using 1:2 t system("echo $countries | tail -n+10 | head -1") with lines
ENDOF-GNUPLOT