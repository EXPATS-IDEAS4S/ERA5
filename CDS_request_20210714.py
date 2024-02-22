#!/usr/bin/env python
import cdsapi

c = cdsapi.Client()


c.retrieve("reanalysis-era5-complete", {
    "date": "2021-07-14",
    "levtype" : "sfc",
    "param": "172.128/129.128",
    "stream": "oper",
    "time": ["00:00","06:00","12:00","18:00"],
    "type": "an",
    "grid" : "0.2/0.2",
    "format" : "grib",
    "area" : "52/5/42/16"                 # North, West, South, East.
    },"2021-07-14_1.grib")

c.retrieve("reanalysis-era5-complete", {
     "date": "2021-07-14",
     "levelist": "10/30/50/70/100/150/200/250/300/400/500/700/850/925/1000",
     "levtype": "pl",
     "param": "130.128/157.128/129.128/203.128/131.128/132.128",
     "stream": "oper",
     "time": ["00:00","06:00","12:00","18:00"],
     "type": "an",
     "grid" : "0.2/0.2",
     "format" : "grib",
     "area" : "52/5/42/16"                 # North, West, South, East.
    },"2021-07-14_2.grib")


c.retrieve("reanalysis-era5-complete", {
     "date": "2021-07-14",
     "levelist": "off",
     "levtype" : "sfc",
     "param": "167.128/139.128/235.128/134.128/137.128/168.128/164.128/206.128/165.128/166.128",
     "stream": "oper",
     "time": ["00:00","06:00","12:00","18:00"],
     "type": "an",
     "grid" : "0.2/0.2",
     "format" : "grib",
     "area" : "52/5/42/16"                 # North, West, South, East.
    },"2021-07-14_3.grib")
