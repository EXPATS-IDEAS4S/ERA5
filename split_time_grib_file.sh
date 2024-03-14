#!/bin/bash

# Date range
start_date="2023-07-01"
end_date="2023-07-31"

# Convert start and end dates to seconds since 1970-01-01 00:00:00 UTC
start_sec=$(date -d "$start_date" +%s)
end_sec=$(date -d "$end_date" +%s)

# Path
path_file="/work/NWC_GEO/import/NWP_data/"

# Output directory
output_dir="${path_file}"
mkdir -p "$output_dir"  # Ensure output directory exists

# Loop over each day in the range
while [ "$start_sec" -le "$end_sec" ]; do
    # Convert seconds back to date for current iteration
    year=$(date -d @"$start_sec" +"%Y")
    month=$(date -d @"$start_sec" +"%m")
    day=$(date -d @"$start_sec" +"%d")

    # Input GRIB file for the current day
    input_grib="${path_file}${year}-${month}-${day}_merged.grib"

    # Temporary directory for hourly splits
    temp_dir="${output_dir}/temp_${year}${month}${day}"
    mkdir -p "$temp_dir"  # Ensure temp directory exists

    # Check if the input GRIB file exists
    if [ -f "$input_grib" ]; then
        # Split GRIB file into hourly files
        cdo splithour "$input_grib" "${temp_dir}/output"

        # Process each hourly file
        for hourly_file in ${temp_dir}/output*; do
            # Extract hour from the file name
            hour=$(basename $hourly_file | sed -r 's/output([0-9]{2}).*/\1/')

            # Construct the new file name according to the desired format
            new_filename="${output_dir}S_NWC_NWP_${year}-${month}-${day}T${hour}:00:00Z_000.grib"

            # Move and rename the hourly file to the output directory with the new format
            mv "$hourly_file" "$new_filename"
        done

        # Remove the original merged file after processing
        rm "$input_grib"
        echo "Removed original merged file: $input_grib"
    else
        echo "File not found: $input_grib"
    fi

    # Clean up by removing the temporary directory
    rmdir "$temp_dir"

    # Move to the next day by adding one day in seconds
    start_sec=$(($start_sec + 86400))
done

echo "Splitting completed for the range $start_date to $end_date."




