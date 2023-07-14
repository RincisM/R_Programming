# create an array
arr <- c(4, 2, 8, 1, 3, 5)

# sort the array using loops
n <- length(arr)
for (i in 1:(n-1)) {
  for (j in (i+1):n) {
    if (arr[i] > arr[j]) {
      temp <- arr[i]
      arr[i] <- arr[j]
      arr[j] <- temp
    }
  }
}

# print the sorted array
print(arr)