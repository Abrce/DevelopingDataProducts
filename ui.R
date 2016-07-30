library(shiny)


shinyUI(fluidPage(
  
  titlePanel("Fuel consumption calculator"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("cyl", label= h4("Number of cylinders"),
                   c("4" =  c(4),
                     "6" = c(6),
                     "8" = c(8))),
      numericInput('disp',label = h4('Displacement (71-472 cu.in.)'),100, min = 71.1 , max = 472.0, step = 0.1),
      numericInput('wt',label = h4('Weight'),1,min = 1, max = 6, step = 0.001),
      radioButtons("wtunits", label = h5("Weight units (1000-6000 lbs)"),
                   c("metric tons" =  c(2.20462262),
                     "1000 lbs" = c(1))),      
      radioButtons("am", label = h4("Transmission"),
                   c("automatic" =  c(0),
                     "manual" = c(1))),      
      numericInput('hp', label= h4('Gross horsepower(52-335 hp)'), 100, min = 52, max = 335, step = 1),
      submitButton('Submit')),
      
 
    mainPanel(
      tabsetPanel(type = "tabs",  
                  tabPanel("Results", verbatimTextOutput("Results")), 
                  tabPanel("Table", tableOutput("table"))
      )
    )
  )
))