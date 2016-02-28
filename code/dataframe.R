# data frames
df <- data.frame(id = c("a", "b", "c","d", "e", "f"),
                 x = 1:6,
                 y = 214:219)

df[,"y"]

# add a new column
df <- cbind(df, sixToOne = 6:1)

# add a new level to df$id
levels(df$id) <- c(levels(df$id), "g")

# add a new row
df <- rbind(df, c("g",7,220,0))

df$id <- as.character(df$id)
is.factor(df$id)

df$id <- factor(df$id)

# read in gapminder
gapminder <- read.table("data/gapminder-FiveYearData.csv",
                        header = TRUE,
                        sep = ",")

gapminder <- read.csv("data/gapminder-FiveYearData.csv",
                      stringsAsFactors = FALSE)

typeof(gapminder)
class(gapminder)
typeof(gapminder$country)
class(gapminder$country)

gapminder[gapminder$country=="Australia",]
