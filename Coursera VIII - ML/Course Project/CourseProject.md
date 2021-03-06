---
title: "Practical Machine Learning course Project"
output: html_document
author: Kike Sedes
---

\fontfamily{cmr}
\fontsize{8}{12}
\selectfont

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Background
Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement – a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this project, your goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways. More information is available from the website here: http://groupware.les.inf.puc-rio.br/har (see the section on the Weight Lifting Exercise Dataset).

## Data
* The training data for this project are available here:https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv
* The test data are available here:https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv
* The data for this project come from this source: http://groupware.les.inf.puc-rio.br/har

## Goal
The goal of your project is to predict the manner in which they did the exercise. This is the "classe" variable in the training set. You may use any of the other variables to predict with. You should create a report describing how you built your model, how you used cross validation, what you think the expected out of sample error is, and why you made the choices you did. You will also use your prediction model to predict 20 different test cases.

## Data loading and exploring.
```{r message=FALSE, results='hide', echo=FALSE}
library(knitr)
library(caret)
library(rpart)
library(rpart.plot)
library(rattle)
library(randomForest)
library(corrplot)
library(reshape2)
library(gridExtra)
library(dplyr)
set.seed(141414)
``` 

```{r message=FALSE,results='hide', echo=TRUE}
# Urls mentioned above
urlForTraining <- "http://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
urlForTesting  <- "http://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

# download datasets
training <- read.csv(url(urlForTraining))
validation  <- read.csv(url(urlForTesting))
str(training)
dim(training)
```
As we can see with "str", there are some variables with only NA's that we may exclude for our analysis. Let's create one plot with some significant factor variables identified in the str output

```{r fig.width=9, fig.height=5}
theme_set(theme_bw(base_size = 12))
plot1 <- qplot(classe, cvtd_timestamp, data=training, color=user_name,xlab = "Fashion (A correct execution)",
        ylab = "time")
plot1
```

It seems as if the participants in this study all performed these trials in temporal order. Moreover they started with exercice A (correct one)


## Cleaning data & Cross Validation
As we saw in the lectures during the specialization, we will focus in cleaning our data in three different points:

* Variables with variance close to 0
* Variables with too many NA's in the validation dataset

Regarding Cross Validation, tet's rebember the key factor in Cross Validation:

* Use the trainingSet
* Split into training/test sets.
* Build the model on the training set.
* Evaluate on the test set.
* Repeate and average errors.

So, for this task, I am going to split the training dataset into "training" and "testing" sets. Moreover, I will only use "pml-testing.csv" at the end of the exercice,as a validation sample. 

```{r}
inTrain<- createDataPartition(training$classe, p=0.7, list=FALSE)
trainSet<- training[inTrain, ]
testSet<- training[-inTrain, ]

#remove variables with Nearly Zero Variance
zeroSigma_vars <- nearZeroVar(trainSet)
trainSet <- trainSet[, -zeroSigma_vars]
dim(trainSet)

#In order to predict classes in the validation sample, I will have to use features that are non-NA in the validation data set
all_zero_colnames <- sapply(names(validation), function(x) all(is.na(validation[,x])==TRUE))
nz_names <- names(all_zero_colnames)[all_zero_colnames==FALSE]

#remove ids & times
nz_names <- nz_names[-(1:7)] 
nz_names <- nz_names[1:(length(nz_names)-1)]
trainSet <- trainSet[,c('classe', nz_names)]
dim(trainSet)


#I will set cross validation for each model with K = 3
fitControl <- trainControl(method='cv', number = 3)

```
## ML model selection
I will try 3 differnt model algorithms and then I will check which provides the best accuracy:

* Decision trees with CART (rpart)
* Boosting(gbm)
* Random forest (rf)

Let's create or different models:
```{r message=FALSE,results='hide', echo=TRUE}
ml_model_cart <- train(classe ~ ., data=trainSet, trControl=fitControl,method='rpart')
save(ml_model_cart, file='./ModelFitCART.RData')

ml_model_gbm<- train(classe ~ ., data=trainSet, trControl=fitControl,method='gbm')
save(ml_model_gbm, file='./ModelFitGBM.RData')

ml_model_rf<-train(classe ~ ., data=trainSet,method='rf',ntree=100)
save(ml_model_rf, file='./ModelFitRF.RData')

testPredictionCART <- predict(ml_model_cart, newdata=testSet)
cMatrixCART <- confusionMatrix(testPredictionCART, testSet$classe)

testPredictionGBM <- predict(ml_model_gbm, newdata=testSet)
cMatrixGBM <- confusionMatrix(testPredictionGBM, testSet$classe)

testPredictionRF <- predict(ml_model_rf, newdata=testSet)
cMatrixRF <- confusionMatrix(testPredictionRF, testSet$classe)

AccuracyResults <- data.frame(Model = c('CART', 'GBM', 'RF'),Accuracy = rbind(cMatrixCART$overall[1], cMatrixGBM$overall[1], cMatrixRF$overall[1]))
print(AccuracyResults)
```

Looking at the results, it is clear that the CART model does not work as well as boosting and random forest. As RF is the model with highest accuracy, I am going to 
select it for prediction with our validation dataset. Here are the complete results for the ramdom forest model:
```{r}
cMatrixRF
```

## Prediction
Finally, it is time to work with our validation data sample (‘pml-testing.csv’) to predict a classe for each of the 20 observations.

```{r}
testPredictionValidation <- predict(ml_model_rf, newdata=validation)
validationPredictionResults <- data.frame(problem_id=validation$problem_id,predicted=testPredictionValidation)
print(validationPredictionResults)
```
