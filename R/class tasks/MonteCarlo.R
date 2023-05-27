MonteCarlo <- function(f,lower,upper){
  S <- c()
  for(i in 1:10000){
    x <- runif(1,lower,upper)
    y <- f(x)
    S <- c(S,y)
  }
  return(mean(S)*(upper-lower))
}


#example
#f is N(3,1)
#two point is 0,3

MonteCarlo(dnorm,0,3)
#0.493907

#actual area
pnorm(3,3,1)-pnorm(0,3,1)
#0.4986501

#development of estimator
#replicate 1000 times.

s_area <- c()
for(j in 1:1000){
  s <- MonteCarlo(dnorm,0,3)
  s_area <- c(s_area,s)
}

plot(s_area,type="l")
mean(s_area)
var(s_area)

#The variance is very small and the expection value is very closed to actual value.