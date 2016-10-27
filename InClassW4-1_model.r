# summarize model
coef(model) == coefficients(model)
summary(model)
str(model)
modelr::data_grid(var)

# from broom, use tidy than plus the functions before
# augment add prediction and residual
# glance summarize too
broom::tidy(model)
augment(model)
glance(model)

# test if normal
ggplot(sim1, aes(resid)) + 
  geom_freqpoly(binwidth = 0.5)

# memo
aes(year, group = country)

# Stepwise regression
# Generalized linear models (GLM)
# Generalized additive models (GAM)
# Decision trees/random forests
# Neural networks
# Support vector machines

install.packages("hexbin")

# Practice with scorecard
library(tidyverse)
library(modelr)
library(rcfss)

scorecard

# What is the relationship between admission rate and cost?
ggplot(data = scorecard, mapping = aes(y = cost, x = admrate)) +
  geom_hex() +
  geom_smooth(method = "lm", se = FALSE, color = "red")

# Estimate a linear regression model for admission rate and cost
practiceModel <- lm(data = scorecard, formula = cost ~ admrate)
coef(practiceModel)
coefficients(practiceModel)
summary(practiceModel)
str(practiceModel)

broom::tidy(practiceModel)

# Does the type of college make a difference?
ggplot(data = scorecard) +
  geom_line(mapping = aes(y = cost, x = admrate, group = type, color = type))
ggplot(data = scorecard) +
  geom_smooth(mapping = aes(y = cost, x = admrate, group = type, color = type))

# Separate models for each type of college
testData <- scorecard %>% 
  group_by(type) %>% 
  nest()
testData

testModelss <- map2("cost ~ admrate", testData$data, lm)
testModelss

# Compare separate models’ residuals to original model
testData <- mutate(testData, resi = map2(testData$data, testModelss, add_residuals))
testData

testData <- map2(testData$data, testModelss, add_residuals)
testData

ggplot(mapping = aes(resid)) +
  geom_freqpoly(data = testData[[1]], color = "red") +
  geom_freqpoly(data = testData[[2]], color = "green") +
  geom_freqpoly(data = testData[[3]], color = "yellow")