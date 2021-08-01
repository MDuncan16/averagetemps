
library(shiny)


shinyUI(fluidPage(
  
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = 'year_min', label = 'Starting Year', choices = 1850:2015,1850),
      selectInput(inputId = 'year_max', label = 'Ending Year', choice = 1850:2015,2015),
      selectInput(inputId = "dataset", label = "Data", choice = c("Global Average Land Temperature", "Global Average Land and Ocean Temperature")),
      checkboxInput(inputId = 'linanderror', labe = 'Show Line of Best Fit and Error Bars')
      
    ),
    
 
    mainPanel(
      titlePanel('Berkeley Earth Temperature Data'),
      plotOutput("plot")
    )
  )
))
