fired <- c(34, 37, 37, 38, 41, 42, 43, 44, 44, 45, 45, 45, 46, 48, 49, 53, 53, 54, 54, 55, 56)
not.fired <- c(27, 33, 36, 37, 38, 38, 39, 42, 42, 43, 43, 44, 44, 44, 45, 45, 45, 45, 46, 46, 47, 47, 48, 48, 49, 49, 51, 51, 52, 54)
label1 <- rep('fired', 21)
label2 <- rep('not.fired', 30)
label.all <- as.factor(c(label1, label2))
samoa <- data.frame(status=label.all, age=c(fired, not.fired))

t.test(age ~ status, data=samoa, var.equal=TRUE)
## 
##  Two Sample t-test
## 
## data:  age by status
## t = 1.0991, df = 49, p-value = 0.2771
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -1.678993  5.526612
## sample estimates:
##     mean in group fired mean in group not.fired 
##                45.85714                43.93333
number_of_permutations <- 1000
xbarholder <- numeric(0)
counter <- 0
observed_diff <- mean(subset(samoa, status == "fired")$age)-mean(subset(samoa, status == "not.fired")$age)

set.seed(123)
for(i in 1:number_of_permutations)
{
  scramble <- sample(samoa$age, 51)
  fired.new <- scramble[1:21]
  not.fired.new <- scramble[22:51]
  diff <- mean(fired.new)-mean(not.fired.new)
  xbarholder[i] <- diff
  ## if doing a two-sided t-test, the following line should be (abs(diff) > abs(observed_diff))
  if(diff > observed_diff)
    counter <- counter + 1
}
hist(xbarholder, xlab='Permuted Fired - Not Fired', main='Histogram of Permuted Mean Differences')
box()
