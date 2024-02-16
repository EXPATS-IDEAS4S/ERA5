import xarray as xr

# Define the path to your input GRIB file
file_path = '/home/daniele/Documenti/PhD_Cologne/Case_Studies/ERA5/'
#input_grib_file = 'download.grib'
grib_file = 'ERA5_NWC_NWP_2021-07-01T00:00:00Z_000.grib'


# Open the GRIB file with xarray and cfgrib engine
ds = xr.open_dataset(file_path+grib_file, engine='cfgrib')
print(ds)

# Close the dataset
ds.close()
