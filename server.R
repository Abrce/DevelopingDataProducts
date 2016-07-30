library(shiny)

  fit <- function( cyl, disp, wt, wtunits, am, hp) { 42.099244 - 1.807710 * cyl - 0.056428 * disp - 2.354254 * wt * wtunits + 6.510337 * am - 0.018469 * hp + 0.007357 * cyl * disp - 2.135062 * wt * wtunits * am}


shinyServer(function(input, output) {
  
  output$Results <- renderPrint({
    print("The predicted miles per gallon is")
    print(fit (as.numeric(input$cyl),input$disp, input$wt, as.numeric(input$wtunits), as.numeric(input$am),input$hp))  
    print("The car in the database that has the closest mpg to this prediction is")
    print(mtcars[which.min(abs(mtcars$mpg - fit (as.numeric(input$cyl),input$disp, input$wt, as.numeric(input$wtunits), as.numeric(input$am),input$hp))),])
    })
  
  output$table <- renderTable({
    mtcars
  })
  
})