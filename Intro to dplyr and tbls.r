install.packages('hflights')
library(dplyr)
library(hflights)
head(hflights)
summary(hflights)
hflights <- as_tibble(hflights)
print(hflights)
carriers <- hflights$UniqueCarrier
class(hflights)
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")
hflights$Carrier <- lut[hflights$UniqueCarrier]
glimpse(hflights)
lut2 <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")
hflights$Code <- lut[hflights$CancellationCode]
glimpse(hflights)
