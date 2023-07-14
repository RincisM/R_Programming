x <- c(1.7, 1.5, 2.8, 5, 1.3, 2.2, 1.3)
y <- c(368, 340, 665, 954, 331, 556, 376)
resultmodel <- lm(y~x)
print(resultmodel)
summary(resultmodel)


predict.lm(resultmodel, data.frame(x=c(4.8)))
plot(x, y) abline(resultmodel)
           