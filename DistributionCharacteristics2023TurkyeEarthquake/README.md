# DistributionCharacteristics2023TurkyeEarthquake
Repository for Final Project on the 2023 distribution and characteristics of the 2023 Türkiye-Syria earthquakes. 

## Summary

This project uses data from the USGS catalog and the UN OCHA HDX portal to examine the distribution and characteristics of 2023 Türkiye-Syria earthquakes and their aftershocks within the borders of Türkiye to understand the relationship between earthquake magnitude and depth. It also visually compares compares the occurrence of building destruction with these earthquake variables as well as the human response to the destruction, as represented by twitter activity.

## Investigators
OdetteDuLac
Teammate 1
Teammate 2

## Keywords
spatial data analysis, GLM, Türkiye, earthquake, twitter data

## Database Information
  
**Administrative Boundary Layers**
  Source: geoBoundaries
  Description: created by the College of William and Mary's geoLab; administrative boundaries for levels 0 (country), 1 (province), and 2 (district)
  Format: shapefile
  File Name(s):
    TUR_ADM0
    TUR_ADM1
    TUR_ADM2
  Access Date: April 13, 2023

**Earthquake Data**
  Source: USGS Earthquake Catalog API
  Description: Point layer data of earthquakes from Feb. 5 to Mar. 5 2023; includes measures of depth, magnitude, time, latitude, longitude, and other statistics related to measuring error
  Format: .csv
  File Name(s):
    TUR_USGS_EQC_FebMar2023
  Access Date: April 13, 2023
  
**Destroyed Buildings Data**
  Source: UN Office of UN Office of Humanitarian Affairs' Humanitarian Data Exchange Portal
  Description: Point layer data collected using Open Street Map and Map Roulette; updated daily
  Format: .csv
  File Name(s):
    TUR_HDX_destroyedBuildings
  Access Date: April 13, 2023
  
**Twitter Activity Data**
  Source: UN Office of UN Office of Humanitarian Affairs, Humanitarian Data Exchange Portal
  Description: created from raw data points that were count aggregated to administrative boundary level 2 (district); updated monthly; separate files for missing people reports, help requests, shelter requests, and damage reports shared through images
  Format: .xlsx
  File Name(s):
    TUR_HDX_twitterHelp
    TUR_HDX_twitterShelter
    TUR_HDX_twitterMissingPeople
    TUR_HDX_twitterDamageImages
  Access Date: April 13, 2023
  
**Interpolated Rasters**
Source: Investigators
  Description: Rasters created by interpolating depth and magnitude values from earthquake data set using inverse distance weighting
  Format: .tif
  File Name(s):
    TUR_EQC_idw_depth
    TUR_EQC_idw_magnitude

## Folder structure, file formats, and naming conventions 
Repository Folder: Contains the R Project file, the README document, and the Data, Code, and Output files

Data: Contains all data used in project. Subfolders are Tabular, Shapefiles, and Rasters. Data in the form of .csv and .xlsx is stored in Tabular. Shapefiles of administrative boundaries are stored in Shapefiles. .tif files area stored in Rasters. File names include region, source, and information type.

Code: Contains all .Rmds. Files are named by contributor, project, and version.

Output: Contains .pdf and .html files of knitted .Rmds. Files are named by project and version.

## Metadata

### Administrative Boundary Layers

| Column Name | Description | Class | Units |
| :----------- | :----------- | :----- | :----- |
| shapeName | name of administrative unit | character |NA|
|shapeISO| ISO code of administrative unit| character |NA|
|shapeID|unique ID for polygon | character |NA|
|shapeGroup|3-letter ISO country code| character |NA|
|shapeType| administrative unit level | character | NA|
|geometry| geometry points for polygons | list of numeric |decimal degrees ESPG 4326|
|geom_type| geometry type (actually not polygons but points) | character |NA|

### Earthquake Data

| Column Name | Description | Class | Units |
| :----------- | :----------- | :----- | :----- |
|time|date and time of earthquake | character | YMD UTC|
|longitude|longitude | numeric | decimal degrees ESPG 4326|
|latitude|latitude | numeric |decimal degrees ESPG 4326|
|depth| depth of earthquake | numeric| kilometers|
|mag| magnitude | numeric |Moment Magnitude Scale|
|magType|type of eathquake magnitude | character |NA|
|nst|total number of seismic stations used to determine earthquake location | integer |count|
|gap|largest azimuthal gap between azimuthally adjacent stations (in degrees)| integer |decimal degrees|
|dmin|horizontal distance from the epicenter to the nearest station (in degrees). 1 degree is approximately 111.2 kilometers | numeric |decimal degrees|
|rms|root-mean-square (RMS) travel time residual, in sec, using all weights | numeric |NA|
|net|ID of a data contributor | character |NA|
|id|unique event ID | character |NA|
|updated|when was entry updated in catalog | character |YMD UTC|
|place|description of location | character |NA|
|type|event type | character |NA|
|horizontalError|uncertainty of reported location of the event in kilometers | numeric |kilometers|
|depthError|uncertainty of reported depth of the event in kilometers | numeric |kilometers|
|magError|uncertainty of reported magnitude of the event | numeric |Moment Magnitude Scale|
|magNST|total number of seismic stations used to calculate the magnitude for this earthquake | integer |count|
|status|was entry reviewed or not | character |NA|
|locationSource|who recorded the location | character |NA|
|magSource| network that originally authored the reported magnitude for this event | character |NA|

Explanation of USGS [Moment Magnitude Scale Types](https://www.usgs.gov/programs/earthquake-hazards/magnitude-types)

### Destroyed Buildings Data

| Column Name | Description | Class | Units |
| :----------- | :----------- | :----- | :----- |
|osm_id|ID number in OSM | integer |NA|
|source| satellite source | character |NA|
|damage_event| how was building destroyed | character |NA|
|damage_date|date building was damaged | character |NA|
|longitude|longitude | numeric | decimal degrees ESPG 4326|
|latitude|latitude | numeric |decimal degrees ESPG 4326|
|geom_type| geometry type (actually not polygons but points) | character |NA|

### Twitter Help Requests

| Column Name | Description | Class | Units |
| :----------- | :----------- | :----- | :----- |
|district|name of district | character |NA|
|population| number of people in district | numeric | individuals|
|district_tweets| raw number of tweets shared in district related to help requests | numeric | count|
|district_images| raw number of images shared in district related to help requests | numeric |count|
|help_request_reports| number of help requests when removing duplicates | numeric | character |NA|
|help_request_impact_score|latitude | impact score based on raw tweets and population |numeric |out of 100|
|help_request_impact_category| category of impact based on score | character |NA|

### Twitter Shelter Requests

| Column Name | Description | Class | Units |
| :----------- | :----------- | :----- | :----- |
|district|name of district | character |NA|
|population| number of people in district | numeric | individuals|
|district_tweets| raw number of tweets shared in district related to shelter requests | numeric | count|
|district_images| raw number of images shared in district related to shelter requests | numeric |count|
|shelter_request_reports| number of shelter requests when removing duplicates | numeric | character |NA|
|shelter_request_impact_score|latitude | impact score based on raw tweets and population |numeric |out of 100|
|shelter_request_impact_category| category of impact based on score | character |NA|

### Twitter Missing People Reports

| Column Name | Description | Class | Units |
| :----------- | :----------- | :----- | :----- |
|district|name of district | character |NA|
|population| number of people in district | numeric | individuals|
|district_tweets| raw number of tweets shared in district related to missing people reports | numeric | count|
|district_images| raw number of images shared in district related to missing people reports | numeric |count|
|missing_people_reports| number of missing people reports when removing duplicates | numeric | character |NA|
|missing_people_reports_impact_score|latitude | impact score based on raw tweets and population |numeric |out of 100|
|missing_people_reports_impact_category| category of impact based on score | character |NA|

### Damage Reports

| Column Name | Description | Class | Units |
| :----------- | :----------- | :----- | :----- |
|district|name of district | character |NA|
|population| number of people in district | numeric | individuals|
|district_tweets| raw number of tweets shared in district related to damage | numeric | count|
|district_images| raw number of images shared in district related to damage | numeric |count|
|damage_reports| number of damage reports when removing duplicates | numeric | numeric count|
|damage_impact_score|latitude | impact score based on raw tweets and population |numeric |out of 100|
|damage_impact_category| category of impact based on score | character |NA|

### Interpolated Depth Raster

| Column Name | Description | Class | Units |
| :----------- | :----------- | :----- | :----- |
|var1.pred|predicted depth | numeric |kilometers|


### Interpolated Magnitude Raster

| Column Name | Description | Class | Units |
| :----------- | :----------- | :----- | :----- |
|var1.pred|predicted magnitude | numeric |Moment Magnitude Scale|

## Scripts and Code
Code files in the Code folder, include .Rmd files from each contributor to assure proper version control as well as a final .Rmd file with all relevant code to the final outputs of the project. 

## Quality Assurance/Quality Control
Conducted early exploratory analysis of the data to assure that data relevant to analysis was included and that there were no null or confounding values. 
