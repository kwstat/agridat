# gartner.corn.r
# Time-stamp: c:/x/rpack/agridat/data-done/gartner.corn.r

library(rio)
setwd("c:/x/rpack/agridat/data-done/gartner/")
dat0 <- import("gartner.corn.csv")
library(dplyr)
dat0 <- filter(dat0, Swath > 330)
dat0$Field <- dat0$Load_id <- dat0$Load_name <- dat0$Crop <- NULL
dat0$Swath <- dat0$Gps <- dat0$Serial <- NULL
dat0 <- dplyr::rename(dat0, long=Longitude, lat=Latitude, mass=Flow, time=Time, seconds=Cycles, dist=Distance, moist=Moisture, altitude=Altitude)
dat0 <- mutate(dat0, time=time-min(time))

gartner.corn <- dat0
agex(gartner.corn)
