#!/bin/bash

# Define the input GRIB files path
path_to_files="/work/NWC_GEO/import/NWP_data/"

# Specify the month and year
month="07"
year="2023"

# Define start and end day for the loop
start_day=1
end_day=31

# Loop over the days
for day in $(seq -f "%02g" $start_day $end_day); do
    grib_file1="${path_to_files}${year}-${month}-${day}_1.grib"
    grib_file2="${path_to_files}${year}-${month}-${day}_2.grib"
    # Uncomment and adjust if a third file is needed
    # grib_file3="${path_to_files}${year}-${month}-${day}_3.grib"
    
    # Define the output merged file
    merged_grib_file="${path_to_files}${year}-${month}-${day}_merged.grib"
    
    # Use cdo to merge the files and check if the merge was successful
    if cdo -O merge "$grib_file1" "$grib_file2" "$merged_grib_file"; then
        echo "Merge completed: $merged_grib_file"
        # Remove the original files after successful merge
        rm -f "$grib_file1" "$grib_file2"
        # Uncomment if grib_file3 is used
        # rm -f "$grib_file3"
        echo "Original files removed."
    else
        echo "Error during merge, original files kept."
    fi
done

echo "All merges completed for the period."
