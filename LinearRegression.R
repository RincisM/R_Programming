setwd("D:/MCA (SS)/Semester 2/Big Data With R")

install.packages("ggplot2")
install.packages("dplyr") 
install.packages("broom")
install.packages("ggpubr")

library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

x <- c(0,1,2,3,4)
y <- c(2,3,5,4,6)

linearReg <- lm(y~x)
print(linearReg)
print(summary(linearReg))
c <- data.frame(x=10)
result <- predict(linearReg, c)
print(result)

sumx <- sum(x)
sumy <- sum(y)
productxy <- x*y
squarex <- x*x

sumProdxy <- sum(productxy)
sumSquarex <- sum(squarex)

n <- length(x)

a <- (n*sumProdxy - sumx*sumy) / (n*sumSquarex - (sumx)*(sumx))
print(a)

b <- (1/n)*(sumy - (a*sumx))
print(b)

final <- (a*x + b)
print(final)

final <- a*10 + b
print(final)