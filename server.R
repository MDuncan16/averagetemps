
library(shiny)
library(tidyverse)
library(readr)
library(lubridate)

landtemp.df <- readr::read_csv("~/Desktop/climate-change-shiny-app-master/landtemperatureF.csv")
landoceantemp.df <- readr::read_csv("~/Desktop/climate-change-shiny-app-master/landandoceantemperatureF.csv")


 
  
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plot <- renderPlot({
    if(input$dataset == "Global Average Land Temperature"){
      data <- landtemp.df %>% filter((Year >= input$year_min) & (Year <= input$year_max)) 
      if(input$linanderror) {
          ggplot(data = data,
                 aes(x = Year, y = `Land Average Temperature (F)`)) +
            geom_point() +
            geom_line() +
            geom_smooth(col = 'red',method = 'lm') +
            geom_errorbar(aes(ymin = `Land Average Temperature (F)` - `Land Temp Relative Uncertainty`,
                              ymax = `Land Average Temperature (F)` + `Land Temp Relative Uncertainty`),
                          width = 0.2,
                          position = position_dodge(0.05),
                          color = 'black') +
            ylab('Farenheit') +
            ggtitle("Global Average Land Temperature")
        }
      else {
        ggplot(data = data,
               aes(x = Year, y = `Land Average Temperature (F)`)) +
          geom_point() +
          geom_line() +
          ylab('Farenheit') +
          ggtitle("Global Average Land Temperature")
        
      }
    } else {
      data <- landoceantemp.df %>% filter((Year >= input$year_min) & (Year <= input$year_max)) 
      if(input$linanderror) {
        ggplot(data = data,
               aes(x = Year, y = `Land and Ocean Average Temperature (F)`)) +
          geom_point() +
          geom_line() +
          geom_smooth(col = 'red',method = 'lm') +
          geom_errorbar(aes(ymin = `Land and Ocean Average Temperature (F)` - `Land and Ocean Temp Relative Uncertainty`,
                            ymax = `Land and Ocean Average Temperature (F)` + `Land and Ocean Temp Relative Uncertainty`),
                        width = 0.2,
                        position = position_dodge(0.05),
                        color = 'black') +
          ylab('Farenheit') +
          ggtitle("Global Average Land Temperature")
      } else {
        ggplot(data = data,
               aes(x = Year, y = `Land and Ocean Average Temperature (F)`)) +
          geom_point() +
          geom_line() +
          ylab('Farenheit') +
          ggtitle("Global Average Land and Ocean Temperature")
      }
    }
    

  })     
      
})







