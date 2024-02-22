import xarray as xr

# Define the path to your input GRIB file
file_path = '/home/daniele/Documenti/PhD_Cologne/Case_Studies/ERA5/Complete_ERA5_global_atmospheric_reanalysis/'
#input_grib_file = 'download.grib'
grib_file = '2021-07-14_merged.grib'


# Open the GRIB file with xarray and cfgrib engine
#ds = xr.open_dataset(file_path+grib_file, engine='cfgrib')
ds = xr.open_dataset(file_path + grib_file, engine='cfgrib', backend_kwargs={'filter_by_keys': {'typeOfLevel': 'surface'}})
print(ds)

# Close the dataset
ds.close()
