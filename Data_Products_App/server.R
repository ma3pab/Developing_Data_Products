
library(datarium)
data("marketing", package = "datarium")


server <- function(input, output) {

    formulaText <- reactive({(paste("sales ~", input$variable))})
    modelText <- reactive({as.formula(paste("sales ~", input$variable))})
        
    linear_model <- reactive({lm( modelText() , data = marketing )})
    output$pred1 <- renderPrint( coefficients( linear_model() ) )
        
    model1pred <- reactive({ 
        coefficients(linear_model())[1] + (coefficients(linear_model())[2] * input$slidersales)  })
    
    output$pred2 <- renderText({ model1pred()  })
    
    # Return the formula text for printing as a caption ----
    output$caption <- renderText({
        formulaText()
    })
    
    output$salesPlot <- renderPlot({
        plot(as.formula(formulaText()), main = "Plot of Sales Revenue versus Marketing Spend",
                data = marketing)
        abline(linear_model(), col = "red", lwd = 2 )
    })
 
       
}