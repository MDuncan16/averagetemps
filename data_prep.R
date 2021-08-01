library(tidyverse)
library(readr)
library(lubridate)

data <- readr::read_csv("GlobalTemperatures.csv")
since_1850 <- function(df) {
  df %>% mutate(Year = year(dt)) %>% select(Year,everything()) %>% filter(Year >= 1850)
}

land_average_temp_by_year <- function(df) {
  df %>% group_by(Year) %>% summarize(LandAverageTemp = mean(LandAverageTemperature,na.rm = TRUE),LandAverageTempUncertainty = mean(LandAverageTemperatureUncertainty,na.rm= TRUE))
}


land_and_ocean_average_temp_by_year <- function(df){
  df %>% group_by(Year) %>% summarize(LandAndOceanAverageTemp = mean(as.numeric(LandAndOceanAverageTemperature),na.rm = TRUE),LandAndOceanAverageTempUncertainty = mean(as.numeric(LandAndOceanAverageTemperatureUncertainty),na.rm= TRUE))
}



landtemperature <- since_1850(data)
landtemperature <- land_average_temp_by_year(landtemperature)

landandoceantemperature <- since_1850(data)
landandoceantemperature <- land_and_ocean_average_temp_by_year(landandoceantemperature)
write.csv(landtemperature,'landtemperature.csv')
write.csv(landandoceantemperature,'landandoceantemperature.csv')

landtemp.df <- read.csv("~/Desktop/climate-change-shiny-app-master/landtemperature.csv")
landoceantemp.df <- read.csv("~/Desktop/climate-change-shiny-app-master/landandoceantemperature.csv")

landtemp.df <- mutate(landtemp.df, 
             `Land Average Temperature (F)` = round(LandAverageTemp * 1.8 + 32, 2),
             `Land Temp Relative Uncertainty` = round((LandAverageTempUncertainty / LandAverageTemp) * 100, 2))

landoceantemp.df <- mutate(landoceantemp.df, 
                           `Land and Ocean Average Temperature (F)` = round(LandAndOceanAverageTemp * 1.8 + 32, 2),
                           `Land and Ocean Temp Relative Uncertainty` = round((LandAndOceanAverageTempUncertainty / LandAndOceanAverageTemp) * 100, 2))

write.csv(landtemp.df,'landtemperatureF.csv')
write.csv(landoceantemp.df,'landandoceantemperatureF.csv')









