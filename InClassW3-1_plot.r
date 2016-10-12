diamonds %>%
  select(carat) %>%
  # breaks = 5 means make 5 groups with equal number
  mutate(carat_autobin = cut(carat, breaks = 5),
    carat_manbin = cut(carat,
      breaks = c(0, 1, 2, 3, 6),
      labels = c("Small", "Medium", "Large", "Huge")))

# Calculate the sum of squares of two variables
sum_of_squares <- function(x, y){
  sum <- (x^2 + y^2)
  return(sum)
}
sum_of_squares (c(1, 2), c(2, 3))

# It takes a single number as input. If the number is divisible by three, it returns “fizz”. If it’s divisible by five it returns “buzz”. If it’s divisible by three and five, it returns “fizzbuzz”. Otherwise, it returns the number.
fizz_buzz <- function(x) {
  if(x %% 3 == 0 & x %% 5 == 0) "fizzbuzz"
  else if(x %% 3 == 0) "fizz"
  else if(x %% 5 == 0) "buzz"
}
fizz_buzz(3)

x <- c(c(1, 2), c(3, 4))
x[2, 1]= 1

output <- vector("double", ncol(df))  # 1. output
for (i in seq_along(df)) {            # 2. sequence
  output[[i]] <- median(df[[i]])      # 3. body
}
output