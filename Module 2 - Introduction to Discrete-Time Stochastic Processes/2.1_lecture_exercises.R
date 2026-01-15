# Exercise 1.3: Generalized Random Walk

T = c(2, 4, 6, 8, 10)
mu = 2
sigma = 3

for (t in T) {
  E_XT = t * mu
  Var_XT = t * sigma^2
  r_T = E_XT / sqrt(Var_XT)
  
  print(paste(
    "For T =", t,
    ": E[X_T] =", E_XT,
    ", Var[X_T] =", Var_XT,
    ", r_T =", r_T
  ))
}

# Exercise 2.2: Solving AR(1) Model

mu = 0.1
lambda = 0.2
sigma = 0.3

k = 1

gamma_0 = sigma^2 / (1 - lambda^2)
gamma_1 = (-lambda)^k * gamma_0

print(paste("Gamma_1 for k =", k, "is", gamma_1))

# Exercise 3.2: Monte Carlo Simulation

p <- 0.5;q <- 1-p; # Set probability of "success" and "failure"
Nt <- 20; # Number of time steps
Np <- 1; # Number of sample paths
z <- matrix(runif(Nt*Np),nrow=Nt) # Generate a set of uniform random draws
x <- sign(p-z); # Transform to binomial random variable +/- 1
s <- matrix(0,Nt+1,Np) # Initial value for random walk.
# Note that R indices start with 1,not zero.
for (t in 1:Nt) {
  s[t+1,] <- s[t,]+x[t,] # New location equals previous plus a new random step
}
plot(s,type="b") # Plot resulting path

Nt <- 252; # Number of trading days in a year
Np <- 1e4; # Reasonably large number of simulations
z <- matrix(runif(Nt*Np),nrow=Nt) # Generate a set of uniform random draws
x <- sign(p-z); # Transform to binomial random variable +/- 1
s <- matrix(0,Nt+1,Np) # Initialize and reserve space for random paths.
for (t in 1:Nt) {
  s[t+1,] <- s[t,]+x[t,] # New location equals previous plus a new random step
}
matplot(s[,1:3],type="b") # Plot a few of the resulting paths