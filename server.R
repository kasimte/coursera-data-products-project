# server.R

library(shiny)
library(datasets)

shinyServer(
    function(input, output) {
        
        dataset <- rock
        
        output$main_plot <- renderPlot({
            hist(rock$area,
                 probability = TRUE,
                 breaks = as.numeric(input$n_breaks),
                 xlab = "area of pores space, in pixels out of 256 by 256",
                 main = "Rock cross-section sample pore area")
        })
        
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