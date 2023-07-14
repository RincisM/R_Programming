fact <- function(x) {
	if((x==0) | (x==1)) {
		print("The Factorial is 1")
	}
	if(x>1) {
		factorial = 1
		for(i in 1:x) {
		factorial <- factorial* i
		}
 		print(factorial)
 	}
}