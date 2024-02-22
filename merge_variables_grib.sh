#!/bin/bash

# Define the input GRIB files path
path_to_files="/home/daniele/Documenti/PhD_Cologne/Case_Studies/ERA5/"
grib_file1="${path_to_files}2021-07-14_1.grib"
grib_file2="${path_to_files}2021-07-14_2.grib"
grib_file3="${path_to_files}2021-07-14_3.grib"

# Define the output merged file
merged_grib_file="${path_to_files}2021-07-14_merged.grib"

# Use cdo to merge the files
cdo -O merge "$grib_file1" "$grib_file2" "$grib_file3" "$merged_grib_file"

echo "Merge completed: $merged_grib_file"

