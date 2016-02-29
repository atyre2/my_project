# split-apply-combine
head(iris)

table(iris$Species)

library(plyr)

ddply(iris,
      .variables = "Species",
      .fun = function(x) mean(x$Petal.Length))

ddply(iris,
      .variables = "Species",
      .fun = function(x) c(meanPetalL=mean(x$Petal.Length),
                           sdPetalL = sd(x$Petal.Length),
                           meanSepalL = mean(x$Sepal.Length),
                           sdPetalL = sd(x$Sepal.Length)
                           )
      )

d_ply(calcGDP(gapminder),
      .variables = c("continent"),
      .fun = function(x) {
        print(paste(
          "The mean GDP per capita for", unique(x$continent),
          "is", format(mean(x$gdpPercap), big.mark = ",")
        ))
      }
)
