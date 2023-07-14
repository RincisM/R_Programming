library(tidyverse)
library(e1071)
setwd("D:/MCA (SS)/Semester 2/Data Analytics/Lab/R Program/R Exercise/data")
datairis <- read.csv("iris.csv")
head(datairis)

datairis$species <- as.factor(datairis$species)
ggplot(datairis, aes(x=sepal_length, y=sepal_width, colour=species))+geom_point()+labs(title="Sepal Length vs Sepal Width")
ggplot(datairis, aes(x=petal_length, y=petal_width, colour=species))+geom_point()+labs(title="Petal Length vs Petal Width")

#Splitting into Training and Testing Dataset
index <- c(1:nrow(datairis))
test.index <- sample(index, size = (length(index)/3))
train <- datairis[-test.index, ]
test <- datairis[test.index, ]


#Using the training set to create the model
svm.model.linear <- svm(species ~ ., data=train, kernel = 'linear')
svm.model.linear
