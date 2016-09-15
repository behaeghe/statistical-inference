##Quiz 1
##Question 5
x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
tempp
## The estimated value is the mean so calculating E[X]
est <- sum(temp[1,]*temp[2,])
est

## Question 6: Bayesian Problem
## Sensitivity ~ true positives -> P(event)
## Specificty ~ true negative   -> P(NO event)
## 
## in this 

preallypreg <- (0.3*0.72)/((.72*.3)+((1-0.52) * (1-0.3)))
preallypreg