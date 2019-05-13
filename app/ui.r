#Load Shiny
library(shiny)

#Generate default Shiny app
ui <- fluidPage("Pheid-O-Matic",
                sliderInput(inputId = "num",
                            label = "Add a value",
                            value = 5, min = 1, max = 100),
                plotOutput("hist"),

server <- function(input,output) {
                output$hist <- renderPlot({
                    title <- "5 random normal values"
                    hist(rnorm(input$num), main =title)
})
}
shinyApp(ui = ui, server = server)
                
)