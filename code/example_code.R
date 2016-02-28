# vectorizing examples

x
x * 2
x + 2
x + y[1,1:5]

# recycling fail!
x * 2:3

# calculate GDP of each country
head(gapminder)

gapminder$GDP <- gapminder$pop * gapminder$gdpPercap

ggplot(gapminder,aes(x = year, y = GDP, color = continent)) + 
  geom_line(aes(by=country)) + 
  scale_y_log10() + 
  scale_color_discrete(name="Continent")

m <- matrix(1:12,nrow=3)
m
x <- c(1, 0, -1, 2)
X <- matrix(x,nrow=3,ncol=4)

all.equal(m * x, m * X)
matrix(x,nrow=3,ncol=4,byrow=TRUE)

peeps <- data.frame(FirstName = "Sleeping", LastName = "Beauty", age = 16)
  levels(peeps$FirstName) <- "Prince"
  peeps <- rbind(peeps, list("Prince","Charming",17))
