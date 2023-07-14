setwd("D:/MCA (SS)/Semester 2/Data Analytics/Lab/R Program/R Exercise/data")

library(ggplot2)
install.packages("C50")
library(C50)
library(e1071)
install.packages("klaR")
library(klaR) #For Plotting

set.seed(1) #To get the same random number every time when using rnorm()
train <- read.csv("train.csv", stringsAsFactors = FALSE)
test <- read.csv("test.csv", stringsAsFactors = FALSE)

extractFeatures <- function(data) {
  features <- c("Pclass", "Age", "Sex", "Parch", "SibSp", "Fare", "Embarked")
  feat <- data[, features]
  feat$Age[is.na(feat$Age)] <- -1
  feat$Fare[is.na(feat$Fare)] <- median(feat$Fare, na.rm=TRUE)
  feat$Embarked[feat$Embarked==""] = "S"
  feat$Sex <- as.factor(feat$Sex)
  feat$Embarked <- as.factor(feat$Embarked)
  return(feat)
}

extract_train <- extractFeatures(train)
extract_test <- extractFeatures(test)

naiveBa <- naiveBayes(extract_train, as.factor(train$Survived))
naiveBa
library(ggplot2)

# Bar plot of class distribution
ggplot(train, aes(x = factor(Survived))) +
  geom_bar(fill = "steelblue") +
  labs(x = "Survived", y = "Count") +
  ggtitle("Class Distribution")



submission <- data.frame(PassengerId = test$PassengerId)
submission$Survived <- predict(naiveBa, as.data.frame((extract_test)))

write.csv(submission, file="Prediction_Titanic_2.csv", row.names=FALSE)

extract_train <- extract_train[-7]

naiveBayS <- NaiveBayes(Sex ~ ., data = extract_train)
pdf("SampleTrainData1.pdf", width=7, height=5)
x = rnorm(100)
y = rnorm(100, 5, 1)
p <- plot(naiveBayS)
dev.off()

extract_test <- extract_test[-7]
naiveBayS <- NaiveBayes(Sex ~ ., data= extract_test)
pdf("SampleTest.pdf", width=7, height=5)
x = rnorm(100)
y = rnorm(100, 5, 1)
p<- plot(naiveBayS)
dev.off()
