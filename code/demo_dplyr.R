# demonstrate dplyr
library(dplyr)
gapminder <- read.csv("data/gapminder-FiveYearData.csv")

gapminder[,"pop"] * gapminder[,"gdpPercap"]
gapminder[ , c("pop", "gdpPercap")]
select(gapminder, pop, gdpPercap)

filter(gapminder, country == "Australia")

filter(gapminder, continent == "Europe", 
       year < 1980)

Auspop <- gapminder %>%
  filter(country == "Australia") %>%
  select(pop,gdpPercap) %>%
  mutate(GDP = pop * gdpPercap,
         loggdpPercap = log10(gdpPercap))

temp1 <- filter(gapminder, country=="Australia")
temp2 <- select(temp1,pop,gdpPercap)
Auspop <- mutate(temp2,...)

grouped.df <- iris %>% 
  group_by(Species) %>% 
  summarise(mean_Petal.Length = mean(Petal.Length),
            sd_Petal.Length = sd(Petal.Length),
            n_Species = n(),
            se_mean = sd_Petal.Length / sqrt(n_Species))

long.df <- gapminder %>% 
  group_by(continent, year) %>% 
  summarize(n_countries = n())

library(tidyr)
wide.df <- spread(long.df,continent,n_countries)
long2.df <- gather(wide.df, continent, n_countries, 2:6)
head(long.df)
dim(long.df)
all.equal(long.df, long2.df[,c(2,1,3)])




iris %>% 
  group_by(Species) %>% 
  gather(flower_att, value = measurement, -Species)
  
  spread(Species,Petal.Length)
  
irisLong <- iris  %>% gather(flower_att, measurement, -Species)
irisLong %>% 
  group_by(Species, flower_att) %>%
  summarize(mean=mean(measurement),
            sd=sd(measurement),
            n=n()) %>%
  spread(Species,mean)




# make gap_wide
# first make gap_long!
gap_long <- gapminder %>% 
  gather(obstype,obs_value,-continent,-country,-year) %>% 
  unite(obstype_year,obstype,year,sep="_") %>% 
  select(continent,country,obstype_year,obs_value) %>% 
  arrange(continent,country,obstype_year)

# now spread into wide format
gap_wide <- spread(gap_long,obstype_year,obs_value)
write.csv(gap_wide,file="data/gap-wide.csv")  
## advanced challenge:
## continent names in reverse order
gapminder %>%
  count(continent) %>%
  select(continent) %>%
  arrange(desc(continent))

## sample 2 countries from each continent
## ?sample_n is the hint
gapminder %>%
  filter(year==2002) %>% 
  group_by(continent) %>%
  sample_n(size=2) %>% 
  summarize(meanlifeExp = mean(lifeExp)) %>% 
  arrange(desc(continent))
  
