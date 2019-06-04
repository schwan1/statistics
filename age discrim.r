library(ggplot2)
library(dplyr)
ggplot(samoa, aes(x=age, fill=status))+geom_histogram(binwidth = 3, alpha=.3, position = 'identity')
samoa%>%group_by(status)%>%summarise(v=var(age))