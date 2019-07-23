library(hflights)
library(dplyr)
summarize(hflights, min_dist = min(Distance), max_dist = max(Distance))
summarize(filter(hflights, Diverted == 1), max_div = max(Distance))
temp1 <- filter(hflights, !is.na(ArrDelay))
summarize(temp1, earliest = min(ArrDelay), average = mean(ArrDelay), latest = max(ArrDelay), sd = sd(ArrDelay))
temp2 <- filter(hflights, !is.na(TaxiIn & TaxiOut))
summarize(temp2, max_taxi_diff = max(abs(TaxiIn - TaxiOut)))
summarize(hflights,
          n_obs = n(),
          n_carrier = n_distinct(UniqueCarrier),
          n_dest = n_distinct(Dest))
aa <- filter(hflights, UniqueCarrier == "American")
summarize(aa, n_flights = n(), n_canc = sum(Cancelled == 1), avg_delay = mean(ArrDelay, na.rm = TRUE))
hflights %>% mutate(diff = TaxiOut - TaxiIn) %>% filter(!is.na(diff)) %>% summarize(avg = mean(diff))
hflights %>% mutate(RealTime = ActualElapsedTime + 100, mph = (60 * Distance) / RealTime) %>% filter(!is.na(mph), mph < 70) %>% summarize(n_less = n(), n_dest = n_distinct(Dest), min_dist = min(Distance), max_dist = max(Distance))
hflights %>%
  mutate(
    RealTime = ActualElapsedTime + 100, 
    mph = 60 * Distance / RealTime
  ) %>% filter(is.na(mph) | mph < 105 | Cancelled == 1 | Diverted == 1) %>% summarize(n_non = n(), n_dest = n_distinct(Dest), min_dist = min(Distance), max_dist = max(Distance))
hflights %>% filter(!is.na(DepTime), !is.na(ArrTime), DepTime > ArrTime) %>% summarize(num = n())
