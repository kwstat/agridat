# buntaran.wheat.R

# Data retrieved from "inti" package, which has license GPL3
# https://github.com/Flavjack/inti

libs(dplyr)
load("c:/Users/wrightkevi/Downloads/met.rda")
head(met)
dim(met)
dat <- met
dat <- rename(dat, gen=cultivar)
dat <- mutate(dat,
              rep=paste0("R",rep),
              alpha=paste0("A",alpha),
              gen=paste0("G",gen))
dat$env <- dat$year <- NULL
head(dat)
buntaran.wheat <- dat

kw::agex(buntaran.wheat)

