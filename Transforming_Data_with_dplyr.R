install.packages("dplyr")
library(dplyr)

counties <- readRDS("counties.rds")
glimpse(counties)

# What is the first value in the income variable?
# 51281

# Select the columns 
counties %>% select(state, county, population, poverty)

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

# Add a verb to sort in descending order of public_work
counties_selected %>% arrange(desc(public_work))

counties_selected <- counties %>%
  select(state, county, population)

# Filter for counties with a population above 1000000
counties_selected %>%
  filter(population > 1e6)

counties_selected <- counties %>%
  select(state, county, population)

# Filter for counties in the state of California that have a population above 1000000
counties_selected %>%
  filter(state == "California", population > 1e6)

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

# Filter for Texas and more than 10000 people; sort in descending order of private_work
counties_selected %>%
  filter(state == "Texas", population > 1e4) %>%
  arrange(desc(private_work))

counties_selected <- counties %>%
  select(state, county, population, public_work)

# Sort in descending order of the public_workers column
# Add a new column public_workers with the number of people employed in public work
counties_selected %>%
  mutate(public_workers = public_work * population / 100) %>%
  arrange(desc(public_workers))

# Select the columns state, county, population, men, and women
counties_selected <- counties %>%
  select(state, county, population, men, women)


# Calculate proportion_women as the fraction of the population made up of women
counties_selected %>%
  mutate(proportion_women = women / population)

counties %>%
  # Select the five columns 
  select(state, county, population, men, women) %>%  
  # Add the proportion_men variable
  mutate(proportion_men = men / population) %>%
  # Filter for population of at least 10,000
  filter(population >= 1e4) %>%
  # Arrange proportion of men in descending order 
  arrange(desc(proportion_men))

