library(shiny)

shinyServer(function(input, output) {
 
  inputFile <- reactive({
    req(input$fileToSend)
    if(input$fileToSend$size > 1000) stop(
      "That file is too big, please try a smaller one. (>1000 bytes)"
    )
    print(input$fileToSend$datapath)
    file(input$fileToSend$datapath,
         open = "r")
  })
  
  observeEvent(input$transferAction, {
    ftpUpload(inputFile(),
              input$serverAddress)
  })
  
  output$status <- renderTable({
    data.frame(
      File=input$fileToSend$name,
      Size=input$fileToSend$size
    )
  })
})