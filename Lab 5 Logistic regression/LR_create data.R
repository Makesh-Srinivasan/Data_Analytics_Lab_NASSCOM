setwd("C:/Radha/VIT/Winter 2021_22/R_Programs") # set working directory for R programming
x<-1:5  # <- called as gets in R (assigning values to x in the range 1 to 5)
y<-c(3,5,7,9,11) # to create a vector/combine/collect - c
data_set=data.frame(x,y)# to create a table of data 
data_set # get the values of x,y
View(data_set) # view the data in table format
str(data_set) # structure of data
names(data_set)  # to know the variable/object names of data
plot(x,y) # plotting x and Y values (scatter plot)
LR_result<-lm(y~x) # linear regression model
LR_result # display coefficients
summary(LR_result) # gives the complete regression analysis results
abline(LR_result, col="blue") # to construct a linear line on the data points

# assigning new values of x for prediction (approach 1)
x=data.frame(x=6:8) 
R<-predict(LR_result,x) # predicting y for given x
R # display the predicted output y
summary(R)

# assigning new values of x for prediction (approach 2)
x=data.frame(x=c(6,7,8))
R1<-predict(LR_result,x)
R1
summary(R1)

