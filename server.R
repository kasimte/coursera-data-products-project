# server.R

library(shiny)
library(datasets)

shinyServer(
    function(input, output) {
        
        dataset <- data(rock)
        
        # Generate a summary of the dataset
        output$summary <- renderPrint({
            summary(dataset)
        })
        
        # Show the first "n" observations
        output$view <- renderTable({
            head(dataset, n = input$obs)
        })
    }
)