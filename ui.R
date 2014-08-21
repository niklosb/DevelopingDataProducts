
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

require(shiny)
require(lubridate)
require(TTR)

SYMs<-read.csv("NYSE.csv", skip=3)
SYMs<-SYMs[with(SYMs, order(Symbol)), ]
row.names(SYMs)<-SYMs$Symbol
SYMs$Symbol <- as.character(SYMs$Symbol)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("NYSE Analysis Tool"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    
    selectizeInput("symbol", label = h3("Company"), 
                choices=#list("A"="A"),
                  setNames(SYMs$Symbol, SYMs$Name),
                selected = "A"),
    
    dateRangeInput("dates", label = h3("Date range"), max = Sys.Date(), start=Sys.Date()-months(1)),
    
    selectInput("type", label = h3("Chart Type"), 
                choices = list("Candle" = "candlesticks", "Bar" = "bars", "Line"= "line",  "Match" = "matchsticks"), 
                selected = "candlesticks")
    ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))
