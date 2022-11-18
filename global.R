library(dplyr)
library(lubridate)
library(tseries)
library(forecast)

mydata = read.csv("C:/Users/ragha/Music/shinyDashboard/R J component/Delhi_NCR_1990_2022_Safdarjung (1).csv")
mydata$time = dmy(mydata$time)
mydata1 = mydata[mydata$time >= "2019-01-01",]
mydata1[is.na(mydata1)]=0
mydata1

#Structure of the data
mydata1 %>% str()

#Summary of the data
mydata1 %>% summary()



#First few observations of the data
mydata1 %>% head()





#Weather Forecasting
class(mydata1)
mydataTs=ts(mydata1$tmin)
class(mydataTs)
plot(mydataTs)
acf(mydataTs)
pacf(mydataTs)
adf.test(mydataTs)
mydatamodel=auto.arima(mydataTs,ic="aic",trace=TRUE)
mydatamodel
acf(ts(mydatamodel$residuals))
pacf(ts(mydatamodel$residuals))
mydataforecast=forecast(mydatamodel,level=c(95),h=10^2)
mydataforecast
Box.test(et,lag = 10,type="Ljung-Box")

