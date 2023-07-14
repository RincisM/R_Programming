setwd("D:/MCA (SS)/Semester 2/Data Analytics/Lab/R Program/R Exercise/data")
data <- read.csv("diamonds.csv")
View(data)
library(ggplot2)
ggplot(data, aes(x='carat', y='depth'))+geom_point()

