## cm004_tidy_tutorial.R
## Benjamin Soltoff
## Practice tidying data

# load libraries
library(dplyr)
library(tidyr)
library(tibble)

# Practice 1 - racial data
race <- read.table(header = TRUE, check.names = FALSE, text = "
                   Name    50  100  150  200  250  300  350
                   Carla  1.2  1.8  2.2  2.3  3.0  2.5  1.8
                   Mace   1.5  1.1  1.9  2.0  3.6  3.0  2.5
                   Lea    1.7  1.6  2.3  2.7  2.6  2.2  2.6
                   Karen  1.3  1.7  1.9  2.2  3.2  1.5  1.9
                   ") %>%
  tbl_df()

race %>% 
  gather(key = "racetype", value = "result", -Name)

race %>% 
  gather(key = "racetype", value = "result", `50` : `350`)

#  Practice 2 - competition results
results <- data_frame(
  Ind = rep(paste0("Ind", 1:10), times = 2),
  Treatment = rep(c("Treat", "Cont"), each = 10),
  value = 1:20
)

results %>%
  spread(key = Treatment, value = value) %>%
  arrange(Ind)

#  Practice 3 - experiment
set.seed(10)
activities <- data_frame(
  id = paste("x", 1:10, sep = ""),
  trt = sample(c('cnt', 'tr'), 10, T),
  work.T1 = runif(10),
  play.T1 = runif(10),
  talk.T1 = runif(10),
  work.T2 = runif(10),
  play.T2 = runif(10),
  talk.T2 = runif(10)
)

activities %>%
  gather(key = type, value = result, work.T1:talk.T2)

#  Practice 4 - grades
grades <- read.table(header = TRUE, text = "
                     ID   Test Year   Fall Spring Winter
                     1   1   2008    15      16      19
                     1   1   2009    12      13      27
                     1   2   2008    22      22      24
                     1   2   2009    10      14      20
                     2   1   2008    12      13      25
                     2   1   2009    16      14      21
                     2   2   2008    13      11      29
                     2   2   2009    23      20      26
                     3   1   2008    11      12      22
                     3   1   2009    13      11      27
                     3   2   2008    17      12      23
                     3   2   2009    14      9       31
                     ") %>%
  tbl_df()

grades %>% 
  gather(key = "Season", value = "Result", Fall:Winter)
