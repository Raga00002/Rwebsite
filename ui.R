library(shiny)
library(shinydashboard)
library(shinyBS)
library(plotly)

title = tags$a(
  href = "https://www.rstudio.com/",
  tags$img(src = "https://cdn.jim-nielsen.com/ios/512/weather-pro-2019-02-07.png",height = "50",width = "50"),
  "Weather Prediction In R",
  target = "_blank"
)

shinyUI(
  dashboardPage(
    
    
    
    dashboardHeader(
      title = title,
      titleWidth = 950,
      tags$li(
        class = "dropdown",tags$a(href = "https://www.google.com/",icon("google"),"Google",target = "_blank")
      ),
      tags$li(
        class = "dropdown",tags$a(href = "https://github.com/",icon("github"),"Github",target = "_blank")
      )
    ),
    
    
    
    
    
    dashboardSidebar(
      sidebarMenu(
        
        menuItem(
          "Dashboard",tabName = "dashboard",icon = icon("dashboard")
        ),
        
        menuItem(
          "Visualisation",tabName = "visual",icon = icon("chart-line")
        ),
        
        menuItem(
          "Link to Data Files",href = "https://www.kaggle.com/datasets/vanvalkenberg/historicalweatherdataforindiancities",icon = icon("code")
        ),
        
        menuItem(
          "Prediction",icon = icon("map"),tabName = "predict"
        )
        
        
      )
    ),
    
    
    
    
    
    
    
    
    dashboardBody(
      tabItems(
        
        tabItem(
          tabName = "dashboard",
          tabBox(
            id = "tab1",
            width = 12,
            tabPanel("About",icon = icon("address-card"),fluidRow(
              column(
                width = 8,
                tags$img(src = "https://newsonair.com/wp-content/uploads/2021/06/WEATHER-5.jpg",width =600 ,height = 400 ),
                tags$br(),
                tags$a("Photo from Google",align = "center")
              ),
              column(
                width = 4,
                tags$br(),
                tags$p("I am Raghav Goel 20BEC1162 has made this site with R to predict the weather data and also observe the weather pattern by showing data with different plots.")
              )
            )),
            tabPanel("Data", icon = icon("database"), dataTableOutput("dataT") ),
            tabPanel("Structure",icon = icon("bars"),verbatimTextOutput("structure")),
            tabPanel("Summary",icon = icon("list-alt"),verbatimTextOutput("summary")),
            
          ),
          ),
        
        
        tabItem(
          tabName = "visual",
          tabBox(
            id = "viz",
            width = 12,
            tabPanel("Prediction",value = "trends",plotOutput("Mydata1")),
            tabPanel("Minimum Temperature",value = "distro",dateRangeInput(
              inputId = "daterange",
              label = "select the date range",
              start = min(mydata1$time),
              end = max(mydata1$time),
              min = min(mydata1$time),
              max = max(mydata1$time),
              format = "yyyy-mm-dd",
              separator = "-"
            ),
            plotOutput("mintimeseriesplot")
            ),
            tabPanel("Maximum Temperature",dateRangeInput(
              inputId = "daterange2",
              label = "select the date range",
              start = min(mydata1$time),
              end = max(mydata1$time),
              min = min(mydata1$time),
              max = max(mydata1$time),
              format = "yyyy-mm-dd",
              separator = "-"
            ),
            plotOutput("maxtimeseriesplot")
            ),
            tabPanel("Average Temperature",dateRangeInput(
              inputId = "daterange3",
              label = "select the date range",
              start = min(mydata1$time),
              end = max(mydata1$time),
              min = min(mydata1$time),
              max = max(mydata1$time),
              format = "yyyy-mm-dd",
              separator = "-"
            ),
            plotOutput("avgtimeseriesplot")
            ),
            
          )
        ),



        
        tabItem(
          tabName = "predict",
            tabBox(
              id = "forecast",
              width = 12,
              tabPanel("Prediction",value = "trends",plotOutput("weatherprediction"))
            )
          
        )
        
      )
    )
  )
)