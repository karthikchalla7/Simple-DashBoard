#creating a dashboard
#user interface
library(shiny)
library(shinydashboard)
shinyServer(
  pageWithSidebar(
    headerPanel ('My First App 20BDS0281'),
    sidebarPanel(
      
      #first input
      selectInput("Distribution",
                  'Please Select Distribution Type',
                  choices=c('Normal','Exponential')),
      
      #second input
      sliderInput("sampleSize",
                  'Please Select Sample Size',
                  min=100,max=5000,
                  value = 1000,step = 100),
      
      #conditional panel
      conditionalPanel(condition = "input.Distribution=='Normal'",
                       textInput("mean","Please Select Mean: ",10),
                       textInput("sd","Please Select SD: ",3)),
      conditionalPanel(condition = "input.Distribution=='Exponential'",
                       textInput("lambda","Please Select Exp lambda: ",1))
      
    ),
    
    #main panel
    mainPanel(plotOutput('myPlot'))
  )
)