# cm003_scorecard_practice.R
# Benjamin Soltoff
# Practice transforming and exploring data using the Department
# of Education's College Scorecard data set for 2013

# load necessary libraries
# get dataset from rcfss library
install.packages("dplyr")
install.packages("devtools")      # install package to install
# other packages from Github
install_github("uc-cfss/rcfss")   # install package from Github
library(tibble)
library(devtools)
library(dplyr)
library(ggplot2)

library(rcfss)
data("scorecard")
scorecard

# Which were the 10 most expensive colleges in 2013?
mostExpensive <- scorecard %>%
  arrange(desc(cost))
mostExpensive

# What percent of private, nonprofit schools are cheaper
# than the University of Chicago?
cheaperPercentage <- scorecard %>%
  filter(type == "Private, nonprofit") %>%
  mutate(costPercentRank = percent_rank(cost)) %>%
  filter(name == "University of Chicago") %>%
  select(costPercentRank)
cheaperPercentage
  
# Which type of college has the highest average SAT score?
satScore <- scorecard %>%
  group_by(type) %>%
  summarize(typeAvgSat = mean(satavg, na.rm = TRUE)) %>%
  arrange(desc(typeAvgSat))
satScore

# What is the relationship between cost and faculty salaries?
ggplot(scorecard, aes(x = avgfacsal, y = cost)) +
  geom_point(alpha = 0.4) +
  geom_smooth()

# How does a college's Pell Grant recipients effect the average
# student's education debt?
ggplot(scorecard, aes(x = pctpell, y = debt)) +
  geom_point(alpha = 0.4) +
  geom_smooth()