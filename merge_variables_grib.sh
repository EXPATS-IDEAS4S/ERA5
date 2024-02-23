#!/bin/bash

# Define the input GRIB files path
#path_to_files="/home/daniele/Documenti/PhD_Cologne/Case_Studies/ERA5/"
path_to_files="/work/NWC_GEO/import/NWP_data/"

day="16"
month="07"
year="2021"

grib_file1="${path_to_files}${year}-${month}-${day}_1.grib"
grib_file2="${path_to_files}${year}-${month}-${day}_2.grib"
grib_file3="${path_to_files}${year}-${month}-${day}_3.grib"

# Define the output merged file
merged_grib_file="${path_to_files}${year}-${month}-${day}_merged.grib"

# Use cdo to merge the files
cdo -O merge "$grib_file1" "$grib_file2" "$grib_file3" "$merged_grib_file"

echo "Merge completed: $merged_grib_file"

