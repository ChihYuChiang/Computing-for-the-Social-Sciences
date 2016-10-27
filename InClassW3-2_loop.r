# ncol() is used to calculate column number of df.
system.time({
  output <- vector("numeric", length(x))
  for(i in seq_along(x)){
    output[[i]] <- x[[i]] + 1
  }
})

y <- list("a", 1L, 1.5, TRUE)
str(y)

# Output - a numeric vector of length 30
# Sequence - i in seq_along(x)
# Body - square the ith element of the vector x, store the new value as the 
# ith element of the vector output
library(purrr)

x <- 1:30
output <- vector("numeric", length(x))
for(i in seq_along(x)){
  output[[i]] <- x[[i]]^2
}
output

x <- 1:30
a <- function(k){
  k = k^2
}
map_dbl(x, a) 

library(ggplot2)
diamonds
output <- vector("list", ncol(diamonds))
for(i in seq_along(x)){
  output[[i]] <- max(diamonds[[i]])
}
output
