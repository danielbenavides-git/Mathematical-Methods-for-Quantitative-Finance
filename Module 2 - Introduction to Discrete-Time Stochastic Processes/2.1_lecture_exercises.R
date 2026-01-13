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
