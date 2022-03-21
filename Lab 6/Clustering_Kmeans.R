rm(list=ls())
#install.packages("factoextra")
#install.packages("cluster")
library(factoextra)
library(cluster)

#**************
#Load and preparing the data
#**************

df <- USArrests
df <- na.omit(df)
head(df) 
df <- scale(df) # scale = (0 to 1) >>>> x-xbar/SD
head(df)

#********************
#Determine the optimal no.of clusters=K
#********************

#plot number of clusters vs. total within sum of squares (Elbow method) 
fviz_nbclust(df, kmeans, method = "wss")


#***********************
#PERFORM K-MEANS CLUSTERING WITH OPTIMAL K
#***********************

#make this example reproducible
#randomly generated seed to determine the starting centroids of the clusters.
set.seed(1) 

#perform k-means clustering with k = 4 clusters
km <- kmeans(df, centers = 4, nstart = 25)

#view results
km

#plot results of final k-means model
fviz_cluster(km, data = df)

#add cluster assigment to original data
final_data <- cbind(USArrests, cluster = km$cluster)

#view final data
head(final_data)

