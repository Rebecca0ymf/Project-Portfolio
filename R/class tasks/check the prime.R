is.prime <- function(n){
  count=0
  for(i in ceiling(2:n)){
    if(n %% i == 0){
      count=count+1
    }
  }
  p=c(n)
  if(count>1){
    print(paste(n, "is not a prime"))
  }
  else{print(paste(n,"is a prime"))}
}

is.prime(1006)
is.prime(13)
is.prime(2)
is.prime(27)
is.prime(169) 
