setwd("~/GitHub/upper_wolf_river_SWE")

# imports
require(lubridate)
require(magrittr)
require(dplyr)
require(ggplot2)

# read in data
sh <- read.csv("~/GitHub/upper_wolf_river_SWE/data/3B17P.csv", T, ",")
sr <- read.csv("~/GitHub/upper_wolf_river_SWE/data/3B17P_recent.csv", T, ",")

shbak <- sh
srbak <- sr

# start here
sh <- shbak
sr <- srbak

# parse date
sh$Date <- ymd(sh$Date)


# july as month of interest
sh <- sh[month(sh$Date) == 7,]
sh$YDAY <- yday(sh$Date)
julyAvg <- sh %>%
  group_by(YDAY) %>%
  summarise(mean(Snow.Water.Equivalent, na.rm = T))

ggplot(sh, aes(sh$Snow.Water.Equivalent, factor(mday(sh$Date)), colour = year(sh$Date))) +
  geom_line() +
  geom_point()
