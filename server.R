
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#


require(quantmod)

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({  
    validate(
      need(input$symbol != "", "Please select a company"),
      need(input$dates[1] + days(5) <= input$dates[2] , "Please select a range of 5 or more days")
    )
    
    sym <- getSymbols(input$symbol, src='yahoo')
    
    data <- get(sym) 
    data$dates <- data$index
    
    range <- paste(input$dates[1],input$dates[2], sep="::")
    
    chartSeries(data, subset=range, name=sym, type=input$type)
  })
  
})
