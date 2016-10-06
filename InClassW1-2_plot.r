library(ggplot2)
library(tibble)

library(gapminder)

data("gapminder")
print(gapminder)

# Life exp
ggplot(gapminder, aes(x = continent, y = lifeExp)) +
  geom_boxplot()
  
# GDP and Life exp
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  geom_smooth()