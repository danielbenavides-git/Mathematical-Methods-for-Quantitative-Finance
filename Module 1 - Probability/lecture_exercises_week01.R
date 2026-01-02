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

