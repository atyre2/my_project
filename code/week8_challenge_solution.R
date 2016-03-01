## Answer for week 8 challenge
library(tidyr)
library(plyr)
library(dplyr)
library(ggplot2)

# read in the data
neCountyTemps <- read.csv("data/NE_county_30yr_avg_temp.csv",colClasses=c("character",rep("numeric",12)))
neCountyTemps <- read.table("data/NE_county_30yr_avg_temp.csv",sep=",",header=TRUE)

# convert to numeric
neCountyTemps[,2:13] <- lapply(neCountyTemps[,2:13],as.numeric)
# make a long format version
neCountyTempsLong <- gather(neCountyTemps,month,avgTemp,-County)
# or (much faster!)
neCountyTempsLong <- gather(neCountyTemps,month,avgTemp,2:13)

# with plyr functions
neCountyAnnualAvg <- ddply(.data = neCountyTempsLong,
      .variables = "County",
      .fun = function(x) mean(x$avgTemp))

# using dplyr -- gives the result column a nice name
neCountyAnnualAvg <- neCountyTempsLong %>% 
  group_by(County) %>%
  summarize(annualAvg = mean(avgTemp))

# Write it out
# I'm lazy so create output directory in code
if (!dir.exists('output')){
  dir.create('output')
}

write.csv(neCountyAnnualAvg,file="output/tyre_week8_avgtemp.csv")

# make a plot
p <- ggplot(neCountyTempsLong, aes(x = month, y = avgTemp))
p + geom_line() # cool, but not what I wanted!

# but it should work according to http://docs.ggplot2.org/current/aes_group_order.html
p + geom_boxplot() 
# that's REALLY cool. 
# need to use group aesthetic, not by
p + geom_line(aes(group = County)) + 
  xlab("Month") + ylab("Average Temperature [F]")

# here's a bad solution:
# problem is that geom_line wants a number on the x-axis
neCountyTempsLong$monthNumeric <- as.numeric(neCountyTempsLong$month)
p <- ggplot(neCountyTempsLong, aes(x = monthNumeric, y = avgTemp))
p + geom_line(aes(by=County)) # better 
# now fix up the axis labels, grid lines, etc
p + geom_line(aes(by = County)) + 
  scale_x_continuous(breaks = c(1,4,7,10),
                     minor_breaks = 1:12,
                     labels=c("Jan","April","July","Oct")) + 
  xlab("Month") + ylab("Average Temperature [F]")

# save it
ggsave("graphs/Monthly_avgtemp_county.png")
