#Write a script that allows the user to enter any integer N.That integer works as an upper bound. Your program will give all the prime number between 2 and N by means of Sieve of Eratosthenes.

eratosthenes <- function(n){
  if(n==1) return(NULL)
  if(n==2 | n==3) return(2:n)
  numbers <- 2:n
  primes <- rep(TRUE, n-1)
  for(i in 2:floor(sqrt(n))){
    if(primes[i-1]){
      for (j in seq(i * 2, n, i))
        primes[j-1] <- FALSE
    }
  }
  return(numbers[primes])
}

#test
eratosthenes(1)
eratosthenes(3)
eratosthenes(19)
eratosthenes(160)
eratosthenes(179)
eratosthenes(1890)
