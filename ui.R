# ui.R

library(shiny)
data(rock)

shinyUI(pageWithSidebar(
    headerPanel("Rock Data"),
    sidebarPanel(
        numericInput("obs", "Number of observations to view:", 10),        
        
        selectInput(inputId = "n_breaks",
                    label = "Number of bins in histogram (approximate):",
                    choices = c(10, 20, 35, 50),
                    selected = 20),
        
        helpText("Note: while the data view will show only the specified",
                 "number of observations, the summary will still be based",
                 "on the full dataset."),
        
        helpText("Twelve core samples from petroleum reservoirs were sampled",
                 "by 4 cross-sections. Each core sample was measured for ",
                 "permeability, and each cross-section has total area of pores,",
                 "total perimeter of pores, and shape."),
        
        submitButton("Update View")
    ),
    mainPanel(
        plotOutput(outputId = "main_plot", height = "300px"),
        
#        plotOutput('myHist')
        h4("Summary"),
        verbatimTextOutput("summary"),
        
        h4("Observations"),
        tableOutput("view")
    )
))