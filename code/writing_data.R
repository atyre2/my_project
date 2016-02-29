# write out a subset of a data.frame
source("code/functions_lesson.R")

gapminder <- read.csv("data/gapminder-FiveYearData.csv")

gapAus <- calcGDP(gapminder[gapminder$country=="Australia", ])

write.table(gapAus, "data/gapminder-Australia.txt", sep="\t", row.names = FALSE)
