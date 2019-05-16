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
                
                ),
  
  #reading all Pheidole dataset
  original<-read.csv(file="/home/tsrsilva/Documents/repos/pheid-o-matic/pheidole.csv", header=T, sep = ";", na.strings = "na"),
  original<-rbind(original,ant),
  row.names(original)[dim(original)[1]]="unknown ant",
  data    <-log(original),
  
  #calculating PCA
  PCA <- princomp(~ maHW + maHL + maSL + maEL + maPW + miHW + miHL + miSL + miEL + miPW,
                  data = data, na.action=na.exclude, cor = TRUE),
  PCAplot     <- cbind(PCA$scores[,1], PCA$scores[,2]), colnames(PCAplot)=c("PC1", "PC2")
  
)

server <- function(input, output) {
  output$plot <- renderPlot({
    title <- "100 random normal values"
    hist(rnorm(input$num), main = title)
  })
}

shinyApp(ui = ui, server = server)