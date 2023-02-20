library(shiny)
library(ggplot2)
library(shinythemes)
library(tidyverse)
library(babynames)


# create the ui
ui <- fluidPage(
  titlePanel("BMI Calculator"),
  theme = shinythemes::shinytheme('darkly'),
  
  sidebarLayout(
    sidebarPanel(
      numericInput('height','Enter your Height (in metres) : ',1.5),
      numericInput('weight', 'Enter your weight (in kgs) :', 60)
    ),
    mainPanel(
      textOutput('bmi'),
      textOutput('bmi_range')
    )
  )
)

server <- function(input, output, session){
  
 rval_bmi <- reactive({
   input$weight/(input$height^2)
   })
 
 output$bmi <- renderText({
   bmi <- rval_bmi(
     
   )
   paste("Your current BMI is : ", round(bmi, 1))
 }) 
 
 output$bmi_range <- renderText({
   bmi <- rval_bmi()
   bmi_status <- cut(rval_bmi(),
                     breaks = c(0, 18.5, 24.9, 29.9,40),
                     labels = c('underweight','healthy','overweight','obese')
                     )
   paste("You are", bmi_status)
 })
}

shinyApp(ui = ui, server = server)