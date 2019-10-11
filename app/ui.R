###-----Shiny app template-----###
#This template is used to bootstrap the user interface (ui) of a shiny app 
#and doesn't have any integration with the pheid-o-matic.
#It is used only for testing.

#Install Shiny
library(shiny)

#Bootstrap the user interface (UI)
ui <- fluidPage("Pheid-o-matic",
                #Use different input types to suit your needs
                numericInput(inputId = "num1", 
                            label = "Insert a number", 
                            value = 25, min = 1, max = 100),
                numericInput(inputId = "num2",
                             label = "Insert a number",
                             value = 25, min = 1, max = 100),
                #Use different output types to suit your needs
                plotOutput("plot")
)
