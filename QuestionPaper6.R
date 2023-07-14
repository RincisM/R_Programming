x <- c(15, 25, 35, 45)
y <- c(5, 12, 8, 5)
m = mode(x)
as.integer(m)

max_freq <- max(y)
modal_group <- x[y==max_freq]
mode<-mean(modal_group)
print(mode)
