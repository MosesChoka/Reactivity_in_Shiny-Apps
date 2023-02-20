library(shiny)
library(ggplot2)
library(shinythemes)
library(tidyverse)
library(babynames)


# create the ui
ui <- fluidPage(
  titlePanel("BMI Calculator"),
  shinythemes::themeSelector(),
  
  sidebarLayout(
    sidebarPanel(
      numericInput('height','Enter your Height (in metres) : ',1.5),
      numericInput('weight', 'Enter your weight (in kgs) :', 60)
    ),
    mainPanel(
      textOutput('bmi'),
      textOutput('bmi_range'),
      textOutput("comment")
    )
  )
)

server <- function(input, output, session){
  output$comment <- renderText({
    paste("Your current weight is" ,input$weight , "and height is", input$height)
  })
}

shinyApp(ui = ui, server = server)