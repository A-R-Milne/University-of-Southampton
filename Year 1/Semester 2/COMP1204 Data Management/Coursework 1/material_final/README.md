# material_final
This directory contains the final version of my submission for this coursework. The following files are contained within:

## al[NUM]2020.kml
The kml files representing five hurricanes from 2020. Unchanged from the original `material` directory.

## al_[NUM]2020.csv
The same files representing hurricanes from 2020, converted to csv files by `create_csv.sh`.

## al_2020_[NUM].png
png files representing the same five hurricanes from 2020, created by `create_map_plot.sh` using data from the csv files.

## conflict-script.sh, create_map_plot.sh, plot-locations-on-map.gpi and world-50m.txt
Also unchanged from the original `material` directory.

## create_csv.sh
A shell script I developed for this coursework, which creates csv files (as shown in the above csv files) from the kml files present.

## python-plot-script.py
The file created from `conflict-script.sh`; I subsequently resolved the conflicts deliberately created as a result of said creation.

## report.tex, report.pdf
The final report I created, detailing the actions I took and the results of said actions, in both tex and pdf formats. It contains the following sections:
- Introduction
- Create CSV Script
- Storm Plots
- Git Usage