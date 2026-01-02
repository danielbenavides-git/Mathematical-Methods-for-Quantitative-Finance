# Exercise 1.3: Expectations and Moments

exercise1_3 = function(v1, v2, prob1, prob2) {
  ex1 = v1 * prob1
  ex2 = v2 * prob2
  EX = ex1 + ex2
  
  EX2 = (v1^2) * prob1 + (v2^2) * prob2
  
  VARX = EX2 - (EX^2)
  
  return(list(EX = EX, VARX = VARX))
}

# SOLUTION
exercise1_3(1, 10, 1/3, 2/3)

# Exercise 1.7 Poisson Distribution and Fat Tails

exercise1_7 = function(lambda, k) {
  poisson_prob = (exp(-lambda) * (lambda^k)) / factorial(k)
  return(poisson_prob)
}

# SOLUTION
exercise1_7(6, 5)
exercise1_7(6, 6)

# Exercise 1.8: Sums of Random Variables

N = 30
wi = 1/N
u = 0.1
sigma = 0.3

volatility = N * (wi^2) * (sigma^2)
volatility_sqrt = sqrt(volatility)
volatility_sqrt
volatility_sqrt * 100

# Exercise 1.9: Binomial Sums and Expectations
