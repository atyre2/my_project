library(ggplot2)
gapminder <- read.csv("data/gapminder-FiveYearData.csv")
ggplot(gapminder, 
       aes(x = lifeExp, y = gdpPercap)) +
  geom_point()

ggplot(gapminder, 
       aes(x = year, y = gdpPercap, color = year)) +
  geom_point(alpha = 0.6, size = 2)

ggplot(gapminder, 
       aes(x = year, y = gdpPercap, by = country, color = continent)) +
  geom_point(color="black") + 
  geom_line()
  
ggplot(gapminder, 
       aes(x = year, y = gdpPercap, by = country, color = continent)) +
  geom_line() +
  scale_y_log10()

ggplot(gapminder, 
       aes(x = lifeExp, y = gdpPercap)) +
  geom_point(aes(color = continent)) +
  scale_y_log10() + 
  geom_smooth(method="lm", size = 2, color = "black", se = FALSE)

ggplot(gapminder, 
       aes(x = lifeExp, y = gdpPercap)) +
  geom_point(aes(color = continent)) +
  scale_y_log10() + 
  geom_smooth()

ggplot(gapminder,
       aes(x = year, y = lifeExp)) + 
  geom_line(aes(colour = continent)) + 
  facet_wrap(~country) + 
  xlab("Year") + 
  ylab("Life Expectancy") + 
  guides(color=guide_legend(title="Continent")) +
  theme(axis.text.x = element_blank(), 
        axis.ticks.x = element_blank())

ggplot(gapminder,
       aes(x = year, y = lifeExp)) + 
  geom_line(aes(color = continent)) + 
  facet_wrap(~country) + 
  xlab("Year") + 
  ylab("Life Expectancy") + 
  scale_colour_discrete(name="Continent") +
  theme(axis.text.x = element_blank(), 
        axis.ticks.x = element_blank())
ggsave("graphs/lifebyyearbycountry.png")
# this version directly from web page
ggplot(data = gapminder, aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  xlab("Year") + ylab("Life expectancy") + ggtitle("Figure 1") +
  scale_fill_discrete(name="Continent") +
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())
# These examples from http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/
bp <- ggplot(data=PlantGrowth, aes(x=group, y=weight, fill=group)) + geom_boxplot()
bp
bp + scale_fill_discrete(name="Experimental\nCondition")
# works

library(reshape2)
sp <- ggplot(tips, aes(x=total_bill, y=tip/total_bill)) 
sp + geom_point(shape=1)
sp + geom_point(shape=1) + facet_wrap(~sex) 
sp + geom_point(aes(shape=day)) + 
  scale_shape_discrete(name="Day")
sp + geom_point(aes(shape=day)) + 
  facet_wrap(~sex) + 
  scale_fill_discrete(name="Day")

sp2 <- ggplot(tips, 
              aes(x=total_bill, 
                  y=tip/total_bill,
                  shape=day)) 
sp2 + geom_point() + 
  scale_fill_discrete(name="Day")
sp2 + geom_point() + 
guides(shape=guide_legend(title="Day"))

