# ui.R

library(shiny)
data(rock)

shinyUI(pageWithSidebar(
    headerPanel("US Arrests Based on Urban Population"),
    sidebarPanel(
        
        sliderInput("urbanPop", 
                    "Urban Population Percent:", 
                    min = 1,
                    max = 100, 
                    value = 50),
                
        helpText("This shiny application uses the 'USArrests' dataset in R ",
                 "and displays the results of a few linear models predicting arrests ",
                 "based on urban population percentage.")
    ),
    mainPanel(
        textOutput("percent"),
        textOutput("murderResult"),
        textOutput("assaultResult"),
        textOutput("rapeResult")
    )
))