
library(shiny)
library(bslib)


# Define UI for application
shinyUI(fluidPage(
    
    theme = bs_theme(version = 4, bootswatch = "minty"),
    
    
    # App title ----
    titlePanel("Developing Data Project: Sales vs Marketing Channel"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            h6( "The below allows you to select the spend by marketing channel to plot against sales generated from that channel", style = "font-size:12px;"),
            
            
            # Input: Selector for variable to plot against mpg ----
            selectInput("variable", "Variable:",
                        c("newspaper" = "newspaper",
                          "youtube" = "youtube",
                          "facebook" = "facebook")),
            
            h6( "The slider then selects a spend for the selected marketing channel and predicts the expected sales",  style = "font-size:12px;"),
            
                        
            sliderInput( "slidersales", "What Spend are you willing to pay?", min = 0, max = 350, value = 50),
            
                        
            
        ),
        
        # Main panel for displaying outputs ----
        mainPanel(  
            tabsetPanel(type = "tabs",
                        tabPanel("Analysis", 
            
            # Output: Formatted text for caption ----
            h5("The following computes the Sales Revenue required for a given spend by Sales Channel",  style = "font-size:12px;"),
        
            # Output: Plot of the requested variable against Sales ----
            plotOutput("salesPlot"),
            
            
            # Output: Formatted text for caption ----
            h5( "Regression Intercept and Regressed Beta: "),
            h6(textOutput("pred1")),
            h5("Predicted Sales Revenue: "),
            h6(textOutput("pred2"))
            
                        ),
            
            tabPanel("Documentation", 
                     
                     tags$div(h5("Documentation for What the App Shows and How it Works"),  
                              tags$br(),
                              h6("Data Sourcing"),
                              tags$ul( 
                                 tags$li("The data shows the impact of three advertising methods on sales for 200 companies"),
                                 tags$li("All data items are shown in thousands of dollars" )),
                              tags$br(),
                              h6("App Usage"),
                              tags$ul( 
                                 tags$li("Use the dropdown on the sidepanel to select a marketing channel from Facebook, Youtube or Newspaper" ),
                                 tags$li("This updates the plot on the right to show the Sales Revenue versus Marketing Spend on that channel"),
                                 tags$li("You can then adjust the Slider to select a spend amount on the given marketing channel"),
                                 tags$li("This will then compute a linear regression of revenue versus sales revenue to predict a value of sales generated for the given marketing spend at the bottom of the main panel"),
                                 tags$li("The regression coefficients (intercept and beta) are also shown for information purposes")
                                  )
                              
                              )
            
                    
                     
                     ))
            
        )
    )
))