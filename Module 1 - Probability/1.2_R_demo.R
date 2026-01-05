nlist = c(1,2,5,10,20,50,100,1000)
p = 0.1

for (n in nlist) {
  k = 0:n
  f = dbinom(k, size=n, prob=p)
  barplot(f, names=k, xlab = "Number of Successes", ylab = "Probability", 
          main = paste("Binomial Distribution (n =", n, ", p =", p, ")"))
  readline()
}