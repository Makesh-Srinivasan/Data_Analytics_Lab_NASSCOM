rm(list=ls()) # clearing the environment
#install.packages('forecast')
#install.packages('tseries')

class(Palmoil) # check foe the type of dataset (dataframe has shown)
potime=ts(Palmoil$Dollar,start = 1,end = 128,frequency = 4)
class(potime)
library('forecast')
library('tseries')
plot(potime)
acf(potime)
pacf(potime)
adf.test(potime)
#myfc=forecast(potime,level=c(95),h=10*4)
#myfc
#plot(myfc)
mypo=auto.arima(potime,ic="aic",trace=TRUE) # trace - list all models 
#Akaike Information Critera
#The Akaike Information Critera (AIC) is a widely used measure of a statistical model. 
#It basically quantifies 1) the goodness of fit, 
# and 2) the simplicity/parsimony, of the model into a single statistic.
mypo
acf(ts(mypo$residuals))
myfc=forecast(mypo,level=c(95),h=10*4)
myfc
plot(myfc)
