library(shiny)
library(shinydashboard)
library(shinyBS)
library(lubridate)
library(DT)


shinyServer(
  function(input,output){
    
    #Structure
    output$structure = renderPrint({
      #Structure of the data
      mydata1 %>% str()
    })
    
    
    #Summary
    output$summary = renderPrint({
      #Summary of the data
      mydata1 %>% summary()
    })

    #DataTable
    output$dataT = renderDataTable(
      mydata1
    )
    
    output$mintimeseriesplot = renderPlot({
      #s= subset(mydata1,mydata1$time >= input$daterange[1] & mydata1$time <= input$daterange[1])
      #plot(s$tmin ~ s$time,type='l',col='red')
      timer = mydata1[mydata1$time >= as.character(input$daterange[1]) & mydata1$time <= as.character(input$daterange[2]), ]
      
      x=plot(timer$tmin ~timer$time,type='l',col='red')
      
    })
    output$maxtimeseriesplot = renderPlot({
      #s= subset(mydata1,mydata1$time >= input$daterange[1] & mydata1$time <= input$daterange[1])
      #plot(s$tmin ~ s$time,type='l',col='red')
      timer = mydata1[mydata1$time >= as.character(input$daterange2[1]) & mydata1$time <= as.character(input$daterange2[2]), ]
      
      x=plot(timer$tmax ~timer$time,type='l',col='red')
      
    })
    output$avgtimeseriesplot = renderPlot({
      #s= subset(mydata1,mydata1$time >= input$daterange[1] & mydata1$time <= input$daterange[1])
      #plot(s$tmin ~ s$time,type='l',col='red')
      timer = mydata1[mydata1$time >= as.character(input$daterange3[1]) & mydata1$time <= as.character(input$daterange3[2]), ]
      
      x=plot(timer$tavg ~timer$time,type='l',col='red')
      
    })
    
    output$weatherprediction = renderPlot({
     y=plot(mydataforecast)
    })
    
    output$Mydata1 = renderPlot({
      y=plot(mydata1)
    })
  }
)

















































