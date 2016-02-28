## solutions to challenges on Vectorization page with ggplot()
gapminder$pop_millions <- gapminder$pop / 1e6

ggplot(gapminder, aes(x = year, y = pop_millions)) + 
  geom_point()
ggsave("fig/09-vectorisation-ch2-sol-1.png")
countryset <- c("China","India","Indonesia")
ggplot(gapminder[gapminder$country %in% countryset,],
       aes(x = year, y = pop_millions)) + 
  geom_point()
ggsave("fig/09-vectorisation-ch2-sol-1.png")
