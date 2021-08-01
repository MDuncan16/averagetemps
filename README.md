## Climate Change Global Average Temperature Data, Shiny App

author: Mary Duncan
date: 30 July 2021

### The App
This app allows viewers to choose any range of years between 
1850 and 2015 and displays the global average temperatures in
a line graph over that time period. Additionally, viewers have
the option of displaying data for land temperatures, alone, or
combined land and ocean temperatures. There is also an option
to display a line of best fit for the selected range, as well
as the 95% confidence interval for each average yearly temp.

### The Data
Raw data used for this app is from 'The Berkeley Earth' project
and can be found here: 
https://www.kaggle.com/berkeleyearth/climate-change-earth-surface-temperature-data.
    
Data for global daily termperatures for land and ocean from 
the years 1750 through 2015 can be found here:
https://github.com/DRosenman/climate-change-shiny-app/blob/master/GlobalTemperatures.csv
and here:
https://github.com/maryduncan16/averagetemps/blob/main/GlobalTemperatures.csv.
    
### Data Prep
The original .csv was processed by filtering out everything
before 1850 and all other missing values. Additionally, averages
were calculated from daily temperatures. The Celsius values
were converted into degrees Farenheit and the uncertainty was 
converted into relative uncertainty. The following two datasets
contain this information:
https://github.com/maryduncan16/averagetemps/blob/main/landtemperatureF.csv
https://github.com/maryduncan16/averagetemps/blob/main/landandoceantemperatureF.csv









