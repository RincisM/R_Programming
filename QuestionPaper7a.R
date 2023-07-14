x <- c(5, 15, 25, 35, 45, 55, 65, 75)
y <- c(10, 40, 20, 0, 10, 40, 16, 14)
mean_value <- sum(x * y) / sum(y)
sum_x <- sum((x - mean_value)^2)
variance <- sum_x/(length(y)-1)
standard_deviation <- sqrt(variance)
median_x <- median(x)
mode <- (3*median_x) - (2*mean_value)

skewness <- (mean_value - mode)/standard_deviation
print(skewness)
