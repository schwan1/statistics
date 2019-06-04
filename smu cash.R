SMU = c(34, 23, 50, 60, 50, 0, 0, 30, 89, 0, 300, 400, 20, 10, 0)
Seattle = c(20, 10, 5, 0, 30, 50, 0, 100, 110, 0, 40, 10, 3, 0)
school1 <- rep('SMU', 16)
school2 <- rep('Seattle', 14)
school <- as.factor(c(school1, school2))
all.money <- data.frame(name=school, money=c(SMU, Seattle))

t.test(money ~ name, data=all.money, var.equal=T, alternative='two.sided')

## 
##  Two Sample t-test
## 
##data:  money by name
## t = -1.3976, df = 28, p-value = 0.1732
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -282.62112   53.37112
## sample estimates:
## mean in group Seattle     mean in group SMU 
##                27.000               141.625

