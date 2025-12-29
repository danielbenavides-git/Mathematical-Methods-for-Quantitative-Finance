# Code sample: scaling the binomial distribution

# Binomial distribution - sequence of increasing n
nlist <- c(1,2,5,10,20,50,100,1000)
p <- 0.1
for (n in nlist) {
  k <- 0:n
  f <- dbinom(k,n,p)
  barplot(f,names=k,xlab="Number of Successes",ylab="Probability",
          main=paste("Binomial Distribution, p=",p," n=",n))
  readline()
}


# Rescaled sequence
nlist <- c(1,2,5,10,20,50,100,1000)
p     <- 0.1 
zmax  <- 5

for (n in nlist) {
  k  <- 0:n
  z  <- (k - n*p)/sqrt(n*p*(1-p))
  zi <- (abs(z)<=zmax)
  f  <- dbinom(k,n,p)
  barplot(f[zi], xlab="Scaling Variable z", ylab="Probability",
          main=paste("Binomial Distribution, p=",p," n=",n))
  readline()
}

