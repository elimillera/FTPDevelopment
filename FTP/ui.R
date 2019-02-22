library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("FTP"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # File being transfered
       fileInput(
         "fileToSend",
         "Input Files",
         multiple = TRUE
       ),
       # Server recieving file(s)
       textInput(
         "serverAddress",
         "Server Location"
       ),
       #Send button
       actionButton(
         "transferAction",
         "Transfer"
       )
    ),
    
    mainPanel(

    )
  )
))
