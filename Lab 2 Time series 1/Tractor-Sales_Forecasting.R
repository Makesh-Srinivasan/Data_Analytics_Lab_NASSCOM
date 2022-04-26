rm(list=ls())
library(forecast)
library(tseries)
setwd("C:/Radha/VIT/Winter 2021_22/R_Programs")
data = read.csv("Tractor-Sales.csv")
class(data)

data = ts(data$Number.of.Tractor.Sold,start = c(2003,1),frequency = 12)
class(data)

plot(data, xlab='Years', ylab = 'Tractor Sales')
adf.test(data)

plot(diff(data),ylab='Differenced Tractor Sales')

ld<-log10(data)
plot(ld,ylab='Log (Tractor Sales)')

dld<-diff(ld)
plot(dld,ylab='Differenced Log (Tractor Sales)')

adf.test(dld)

par(mfrow = c(1,2)) # to analyze multiple graphs in a single window

acf(ts(dld),main='ACF Tractor Sales')
pacf(ts(dld),main='PACF Tractor Sales')

ARIMAfit = auto.arima(dld,ic="aic",trace=TRUE)
forecast(ARIMAfit,3)
summary(ARIMAfit)
par(mfrow = c(1,1))
fc=forecast(data,level=c(95),h=3*12)
plot(fc)
ftsales=predict(ARIMAfit,60)
summary(ftsales)
attributes(fc)
