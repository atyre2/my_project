# Week 7 challenge -- Drew Tyre

gapminder <- read.csv("data/gapminder-FiveYearData.csv")

library(ggplot2)

ggplot(gapminder[gapminder$continent == "Asia",],
       aes(x=year, y=gdpPercap, color=country)) + 
  geom_line()

ggsave("graphs/tyre_week7.png")
