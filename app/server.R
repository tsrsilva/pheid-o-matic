###-----Shiny app template-----###
#This template is used to bootstrap the server of a shiny app 
#and doesn't have any integration with the pheid-o-matic.
#It is used only for testing.

#Install Shiny
library(shiny)

#Tell server how to assemble input/output
server <- function(input, output) {
  #Tell server how to render your output. output$type_of_output
  output$hist<-renderPlot({
    #Acess input values via input$
    title <- "100 random normal values"
    hist(rnorm(input$num), main = title)
  })
}
