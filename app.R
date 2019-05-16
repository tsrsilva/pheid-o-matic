library(shiny)
library(ggplot2)
library(gridExtra)


ui <- fluidPage(
  
  #Application title
  titlePanel("Pheid-o-matic"),
  sidebarLayout(position = "left",
                sidebarPanel("sidebar panel",
                             numericInput(inputId = "num1",
                                          label = "Add a value",
                                          value = 25, min = 1, max = 100),
                             numericInput(inputId = "num2",
                                          label = "Add a value",
                                          value = 25, min = 1, max = 100),
                             numericInput(inputId = "num3",
                                          label = "Add a value",
                                          value = 25, min = 1, max = 100)
                             ),
                
                mainPanel("main panel",
                          column(6, plotOutput(outputId = "plot", width = "500px", height = "400px"))
                          
                          )
                
                )
  
)

server <- function(input, output) {
  output$plot <- renderPlot({
    title <- "100 random normal values"
    plot(rnorm(input$num), main = title)
  })
}

shinyApp(ui = ui, server = server)