setwd("D:/MCA (SS)/Semester 2/Data Analytics/Lab/R Program/R Exercise/data")

data <- read.csv("diabetes.csv")

mean_age <- mean(data$Age)
median_age <- median(data$Age)

var(data$Age)
sqrt(var(data$Age))


for(x in data$Age) {
  Age_sub_mean<- (x - mean_age)
  Age_diff <- c(Age_diff, Age_sub_mean)
  Age_sub_median <-(x - median_age)
  Age_meddiff <- c(Age_meddiff, Age_sub_median)
}
Age_diff
Age_meddiff

negative_diff_mean <- c()
positive_diff_mean <- c()
negative_diff_median <- c()
positive_diff_median <- c()
for(y in Age_diff) {
  if(y<0.0) {
    negative_diff_mean <- c(negative_diff_mean, y)
  }
  else{positive_diff_mean <- c(positive_diff_mean, y)}
}
for(z in Age_meddiff) {
  if(z<0.0) {
    negative_diff_median <- c(negative_diff_median, z)
  }
  else{positive_diff_median <- c(positive_diff_median, z)}
}
summary(negative_diff_mean)
summary(positive_diff_mean)
summary(negative_diff_median)
summary(positive_diff_median)
