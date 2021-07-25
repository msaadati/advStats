library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(faraway)
library(performance)
library(DescTools)
library(dunn.test)


##########################################  one-way ANOVA ########################################## 

data(coagulation, package="faraway")
str(coagulation)
?coagulation

summary(coagulation)

coagulation %>% group_by(diet) %>% 
  summarise(n = n(), missing = sum(is.na(coag)), mean = mean(coag), SD = sqrt(var(coag)), 
            SE = sqrt(var(coag))/n())

ggplot(coagulation, aes(x = diet, y = coag, color = diet)) + geom_boxplot() + 
  geom_dotplot(binaxis='y', stackdir='center', position=position_dodge(1), aes(fill = diet),
               dotsize = .75)
