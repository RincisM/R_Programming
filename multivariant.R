setwd("D:/MCA (SS)/Semester 2/Data Analytics/Lab/R Program/R Exercise/data")
install.packages("ggplot2")
library(ggplot2)

diabetes_df = read.csv('diabetes.csv')
head(diabetes_df)
linearReg <- lm(diabetes_df$Pregnancies ~ diabetes_df$Outcome)
print(linearReg)
summary(linearReg)

plot(diabetes_df$Pregnancies ~ diabetes_df$Outcome)
abline(linearReg)

mullm <- lm(BloodPressure ~ BMI+Age, data=diabetes_df)
print(mullm)
summary(mullm)

par(mar = rep(2,4))

plot(diabetes_df$BMI, diabetes_df$BloodPressure, main = "Linear Regression", xlab = "BMI", ylab = "BloodPressure")
abline(mullm, col = "red")

plot(diabetes_df$Age, diabetes_df$BloodPressure, main = "Linear Regression", xlab = "Age", ylab = "BloodPressure")
abline(mullm, col = "red")

plot(diabetes_df$Insulin, diabetes_df$BMI, main = "Linear Regression", xlab = "Insulin", ylab = "BMI")
abline(mullm, col = "red")

plot(diabetes_df$Age, diabetes_df$BMI, main = "Linear Regression", xlab = "Age", ylab = "BMI")
abline(mullm, col = "red")


