#There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length'
#for the species virginica? 
#Please round your answer to the nearest whole number

#Kike a la "brava"
k<-split(iris, iris$Species)
k2<-k$virginica
k3<-k2[[1]]
mean(k3)

#Optimizando versión anterior
z<-sapply(split(iris, iris$Species)$virginica[1], mean)

#Versión pros
library(data.table)
iris_dt <- as.data.table(iris)
iris_dt[Species == "virginica",round(mean(Sepal.Length)) ]



#Continuing with the 'mtcars' dataset from the previous Question, what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
#(Please round your final answer to the nearest whole number. Only enter the numeric result and nothing else.)

#version Kike
l<-tapply(mtcars$hp,mtcars$cyl,mean)
abs(l["8"] - l["4"])

#version Pros
install.packages("data.table", type="source", dependencies=TRUE)
library(datasets)
data(mtcars)
mtcars_dt <- as.data.table(mtcars)
mtcars_dt <- mtcars_dt[,  .(mean_cols = mean(hp)), by = cyl]
round(abs(mtcars_dt[cyl == 4, mean_cols] - mtcars_dt[cyl == 8, mean_cols]))