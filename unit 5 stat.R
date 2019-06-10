#Unit 5 stats problem 6c
#Import incomes by education level
incomes <- read.csv(file="ex0525.csv",head=TRUE)
anova_results <- aov(Income2005 ~ Educ, data = incomes)
summary(anova_results)
