library(shiny)
ui <- fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("chooseVal",
                  "Select a value",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    mainPanel(
      fluidRow(textOutput("reactingA")),
      fluidRow(textOutput("sliderVal"))
    )
  )
)
server <- function(input, output, session){
  
  myReactiveList <- reactiveValues(a = 0)
  
  addOne <- function(list){
    list$a <- list$a + 1
  }
  
  observeEvent(input$chooseVal, {
    addOne(myReactiveList)
  })
  
  output$reactingA <- renderText(paste("times addOne has been activated: ", myReactiveList$a))
  output$sliderVal <- renderText(paste("slider value:", input$chooseVal))
  
}
shinyApp(ui, server, options = list(display.mode = "showcase"))