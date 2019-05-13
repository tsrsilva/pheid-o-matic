library(shiny)

# Define UI for app

ui <- fluidPage(
  
  # App title ----
  titlePanel("Pheid-o-matic"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of nums ----
      numericInput(inputId = "nums",
                  label = "maHW:",
                  min = 0,
                  max = 10,
                  value = 0.5)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  # Histogram ---
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$nums) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    nums <- seq(min(x), max(x), length.out = input$nums + 1)
    
    hist(x, breaks = nums, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times") 
    
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)