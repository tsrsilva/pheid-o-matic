#Load Shiny
library(shiny)

server <- function(input,output) {
  output$hist <- renderPlot({
    title <- "5 random normal values"
    hist(rnorm(input$num), main =title)
  })
}
shinyApp(ui = ui, server = server)