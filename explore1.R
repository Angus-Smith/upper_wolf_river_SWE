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

ggplot(sh, aes(x = yday(sh$Date), y = sh$Snow.Water.Equivalent)) +
  geom_point()
ggplot(sh, aes(x = yday(sh$Date))) +
  geom_point(aes(y = sh$Temp..Min.), colour = "blue") +
  geom_point(aes(y = sh$Temp..Max.), colour = "red") +
  geom_smooth(aes(y = sh$Temp..Min.), colour = "blue") +
  geom_smooth(aes(y = sh$Temp..Max.), colour = "red") +
  geom_vline(xintercept = 205) +
  geom_vline(xintercept = 210)

ggplot(sh, aes(x = yday(sh$Date))) +
  geom_smooth(aes(y = sh$Temp..Min., colour = "blue")) +
  geom_smooth(aes(y = sh$Temp..Max., colour = "red"), level = 0.999)
  geom_pointrange(aes(ymin = sh$Temp..Min., ymax = sh$Temp..Max.))

  yday(dmy("24/07/2017"))
  