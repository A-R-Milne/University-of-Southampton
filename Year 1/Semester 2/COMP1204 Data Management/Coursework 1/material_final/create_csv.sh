#!/bin/bash

#Set up input and output paths as variables
kml_input_path=$1
csv_output_path=$2

echo "Converting "${kml_input_path}" -> "${csv_output_path}"..."

#Create CSV file from the input using awk
awk -F '[<>]' 'BEGIN{string=""} #Start by designating < and > as delimiters, allowing us to search by command, and create a string to put information in
{if($2=="/Placemark"){print string; string=""}} #If we reach a /Placemark command, this is the end of a piece of data, so we can print and reset the string to prepare it for the next piece of information
{if($2=="lat"){ #lat = latitude command
	string = string $3; #$3 contains the data, so we append it to the string
	if(($3+0)<0){string = string " S,"} #Append south and delimiter if negative number
	else{string = string " N,"} #Append north and delimiter if positive number
}}
{if($2=="lon"){ #lon = longitude command
        string = string $3; #Append data
	if(($3+0)<0){string = string " W,"} #Append west and delimiter if negative number
        else{string = string " E,"} #Append east and delimiter if positive number
}}
{if($2=="intensity"){ #intensity = intensity command
	string = string $3; #Append data
	string = string " knots," #Append unit and delimiter
}}
{if($2=="minSeaLevelPres"){ #minSeaLevelPres = minimum sea level pressure command
	string = string $3; #Append data
	string = string " mb," #Append unit and delimiter
}}
{if($2=="dtg"){
	string = string $3; #Append data
	string = string ","; #Append delimiter
}}' ${kml_input_path} | sed "s/\n//g" | sed "s/)/\n/g" | awk -F '[,]' 'BEGIN{print "Timestamp,Latitude,Longitude,MinSeaLevelPressure,MaxIntensity"} #We now have a csv file, but we need to put the columns in the correct order.
{string="";
string = string $5;
string = string ",";
string = string $1;
string = string ",";
string = string $2;
string = string ",";
string = string $4;
string = string ",";
string = string $3;
print string}' > ${csv_output_path} #And finally, put the result into the output.

echo "Done!"
