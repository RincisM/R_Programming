a = matrix(c(2,1,2,1,3,1,2,1,-6), 3, 3, byrow=TRUE)
print(a)
print(sum(eigen(a)$values))
print(prod(eigen(a)$values))


b = matrix(c(6,-2,2,-2,3,-1,2,-1,3),3,3,byrow=TRUE)
print(b)
productThree <- prod(eigen(b)$values)
print(productThree)
productTwo <- 16
thirdValue <- productThree/productTwo
print(thirdValue)


c = matrix(c(8,-6,2,-6,7,-4,2,-4,3),3,3,byrow = TRUE)
print(c)
sumOfDiagonals <- sum(diag(c))
print(sumOfDiagonals)
first <- 3
second <- 0
third <- sumOfDiagonals - (first+second)
print(third)
print(prod(eigen(c)$values)|>as.integer())


d = matrix(c(8,-6,2,-6,7,-4,2,-4,3),3,3,byrow = TRUE)
print(d)
sumOfDiagonals <- sum(diag(d))
print(sumOfDiagonals)
first <- 3
second <- 15
third <- sumOfDiagonals - (first+second)
print(third)
print(det(d))


#Non-Symmetric Matrix With Non-Repeated Eigenvalues

# Install and load the pracma library
install.packages("pracma")
library(pracma)

A <- matrix(c(1, -1, 4, 3, 2, -1, 2, 1, -1), 3, 3, byrow = TRUE)
print(A)

eigen_A <- eigen(A)
print(eigen_A$values)

eigenvector1 <- eigen_A$vectors[, 1]
eigenvector2 <- eigen_A$vectors[, 2]
eigenvector3 <- eigen_A$vectors[, 3]

print(eigenvector1)
print(eigenvector2)
print(eigenvector3)


stabe_stage <- eigen_A$vectors[, 1]/sum(eigen_A$vectors[,1])
stabe_stage

tran <- eigen(t(A))$vectors[, 1]
tran1 <- eigen(t(A))$vectors[1, 1]
repro_value <- tran/tran1
repro_value


print(eigen_A$values)
print(eigen_A$vectors)

Lambda1 = eigen_A$values[1]
Lambda2 = eigen_A$values[2]
Lambda3 = eigen_A$values[3]

e1 = eigen_A$vectors[, 1]
e2 = eigen_A$vectors[, 2]
e3 = eigen_A$vectors[, 3]
print(e1)

print(Lambda1*e1)
spectral = Lambda1*matrix(e1)*e1+Lambda2*matrix(e2)*e2+Lambda3*matrix(e3)*e3
spectral

e1
matrix(e1)

#Non-Symmetric Matrix with Repeated Eigenvalues

B = matrix(c(-2, 2, -3, 2, 1, -6, -1, -2, 0), 3, 3, byrow=TRUE)
print(B)
print(eigen(B))


#Symmetric Matrix with Non-Repeated Eigenvalues

C = matrix(c(1,1,3,1,5,1,3,1,1), 3,3,byrow = TRUE)
print(C)
print(eigen(C))


#Symmetric Matrix with Repeated Eigenvalues

D = matrix(c(6,-2,2,-2,3,-1,2,-1,3), 3, 3, byrow = TRUE)
print(D)
print(eigen(D))
