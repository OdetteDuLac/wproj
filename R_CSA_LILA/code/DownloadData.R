### CSAs and LILA: Download Data

library(downloader)

##################
### Download Data
#################

# USDA's Food Environment Atlas
download.file("https://www.ers.usda.gov/webdocs/DataFiles/80526/FoodEnvironmentAtlas.xls?v=4984.6", "../data/food_environment_atlas.xls")

# National CSA Directory
download.file("http://search.ams.usda.gov/CSA/ExcelExport.aspx", "../data/national_csa_directory.csv")

# State Abbreviations and State Names, corresponding Data Set
download.file("https://worldpopulationreview.com/static/states/abbr-name-list.csv", "../data/state_names_abbr.csv")

# Shapefile of states as zip file
download("https://www2.census.gov/geo/tiger/GENZ2020/shp/cb_2020_us_state_500k.zip", dest="cb_2020_us_state_500k.zip", mode="wb")
# Unzip file and save
unzip("cb_2020_us_state_500k.zip", exdir = "../data")

# Shapefile of counties as zip file
download("https://www2.census.gov/geo/tiger/GENZ2020/shp/cb_2020_us_county_500k.zip", dest="cb_2020_us_county_500k.zip", mode="wb")
# Unzip file and save
unzip("cb_2020_us_county_500k.zip", exdir = "../data")