#!/bin/bash

# Date
year="2021"
month="07"
day="16"

# Path
path_file="/work/NWC_GEO/import/NWP_data/"

# Input GRIB file
#input_grib="/home/daniele/Documenti/PhD_Cologne/Case_Studies/ERA5/Complete_ERA5_global_atmospheric_reanalysis/2021-07-14_merged.grib"
input_grib="${path_file}${year}-${month}-${day}_merged.grib"

# Output directory
#output_dir="/home/daniele/Documenti/PhD_Cologne/Case_Studies/ERA5/Complete_ERA5_global_atmospheric_reanalysis/"
output_dir="${path_file}"

# Ensure output directory exists
mkdir -p "$output_dir"

# Temporary directory for hourly splits
temp_dir="${output_dir}/temp"
mkdir -p "$temp_dir"

# Split GRIB file into hourly files
cdo splithour "$input_grib" "${temp_dir}/output"

# Process each hourly file
for hourly_file in ${temp_dir}/output*; do
    # Extract hour from the file name
    hour=$(basename $hourly_file | sed -r 's/output([0-9]{2}).*/\1/')

    # Split into daily files
    cdo splitday "$hourly_file" "${temp_dir}/day_${hour}_"

    # Rename and move each daily file
    for daily_file in ${temp_dir}/day_${hour}_*; do
        # Extract day from the file name
        day=$(basename $daily_file | sed -r 's/day_[0-9]{2}_([0-9]{2}).*/\1/')

        # Construct the new file name
        new_filename="${output_dir}S_NWC_NWP_${year}-${month}-${day}T${hour}:00:00Z_000.grib"

        # Move and rename the daily file to the output directory
        mv "$daily_file" "$new_filename"
    done

    # Remove the processed hourly file
    rm "$hourly_file"
done

# Remove the temporary directory
rmdir "$temp_dir"

echo "Splitting completed."




