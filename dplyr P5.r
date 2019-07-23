library(hflights)
library(dplyr)
hflights %>%
  group_by(UniqueCarrier) %>%
  summarize(
    p_canc = 100 * mean(Cancelled == 1),
    avg_delay = mean(ArrDelay, na.rm = TRUE)
  ) %>%
  arrange(avg_delay, p_canc)
hflights %>% filter(ArrDelay > 0, !is.na(ArrDelay)) %>% group_by(UniqueCarrier) %>% summarize(avg = mean(ArrDelay)) %>% mutate(rank = rank(avg)) %>% arrange(rank)
hflights %>%
  group_by(TailNum) %>%
  summarize(ndest = n_distinct(Dest)) %>%
  filter(ndest == 1) %>%
  summarize(nplanes = n())
hflights %>%
  group_by(UniqueCarrier, Dest) %>%
  summarize(n = n()) %>%
  mutate(rank = rank(desc(n))) %>%
  filter(rank == 1)
library(data.table)
hflights2 <- as.data.table(hflights)
hflights2 %>% summarize(n_carrier = n_distinct(UniqueCarrier))
install.packages("RMySQL")
library(RMySQL)
my_db <- src_mysql(dbname = "dplyr", 
                   host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                   port = 3306, 
                   user = "student",
                   password = "datacamp")
nycflights <- tbl(my_db, "dplyr")
glimpse(nycflights)
nycflights %>% group_by(carrier) %>% summarize(n_flights = n(), avg_delay = mean(arr_delay)) %>% arrange(avg_delay)
