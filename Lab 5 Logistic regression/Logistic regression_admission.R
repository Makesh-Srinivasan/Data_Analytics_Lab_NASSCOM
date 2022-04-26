# Logistic Regression
# Read data file

rm(list=ls())
mydata <- read.csv(file.choose(), header = T)
str(mydata)
head(mydata)
summary(mydata)
hist(mydata$admit,col="blue")
mydata$admit <- as.factor(mydata$admit)
summary(mydata)
#install.packages("caret")
library(caret) #classification and regression training
train_ind = createDataPartition(mydata$admit,p=0.80,list=F)
train_ds=mydata[train_ind,]
test_ds=mydata[-train_ind,]
my_model=glm(admit~.,data=train_ds,family="binomial")
summary(my_model)
#null deviance = prediction using only intercept excluding all other factors on
#320 dof = n-k-1 =321-0-1=320
#residual deviance - prediction by considering all factors on 
# 317 dof = n-k-1 = 321-3-1=317
pred_train=predict(my_model,train_ds,type="response")
pred_train

pred_train=ifelse(pred_train>0.5,1,0)
tab1 <- table(Predicted = pred_train, Actual = train_ds$admit)
tab1
1 - sum(diag(tab1))/sum(tab1) #Misclassification error


pred_test <- predict(my_model, test_ds, type = 'response')
pred_test
pred_test <- ifelse(pred_test>0.5, 1, 0)
tab2 <- table(Predicted = pred_test, Actual = test_ds$admit)
tab2
1 - sum(diag(tab2))/sum(tab2)


  