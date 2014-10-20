# server.R

library(shiny)
library(datasets)

shinyServer(
    function(input, output) {
        
        data <- USArrests
        
        dataInput <- reactive({
            input$urbanPop
        })
        
        output$percent <- renderText({
            paste("For an urban population of", 
                  dataInput(),
                  "percent, our model predicts...")
        })
        
        murderModel <- lm(Murder ~ UrbanPop, data=data)                
        
        output$murderResult <- renderText({
            murder <- predict(murderModel, 
                               data.frame(UrbanPop = c(dataInput()))) 
            paste(murder, "murders,")
        })
        
        assaultModel <- lm(Assault ~ UrbanPop, data=data)                

        output$assaultResult <- renderText({
            assault <- predict(assaultModel, 
                               data.frame(UrbanPop = c(dataInput()))) 
            paste(assault, "assaults, and")
        })
        
        rapeModel <- lm(Rape ~ UrbanPop, data=data)
        
        output$rapeResult <- renderText({
            rape <- predict(rapeModel, 
                            data.frame(UrbanPop = c(dataInput()))) 
            paste(rape, "rapes per 100,000 people per year.")
        })
        
    }
)