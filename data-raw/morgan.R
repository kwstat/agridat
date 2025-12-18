
setwd("c:/drop/rpack/agridat/data-raw")
libs(readxl)
dat <- read_excel("morgan.xlsx")
head(dat)
# Re-scale the corn to the range 35.7 to 192.4
dat$cornabs <- 35.7 + (dat$corn - min(dat$corn)) / (max(dat$corn) - min(dat$corn)) * (192.4 - 35.7)
# Re-scale the wheat to the range 65 to 130
dat$wheatabs <- 65 + (dat$wheat - min(dat$wheat)) / (max(dat$wheat) - min(dat$wheat)) * (130 - 65)

# check
libs(dplyr)
dat <- mutate(dat,
              cornpom = (cornabs) / mean(cornabs) * 100,
              wheatpom = (wheatabs) / mean(wheatabs) * 100)
head(dat)
plot(dat$wheat, dat$wheatpom)
plot(dat$corn, dat$cornpom)
dat$wheatpom <- dat$cornpom <- NULL
dat <- select(dat, plot, wheat=wheatabs, cornfodder=cornabs)
head(dat)


morgan.multi.uniformity <- dat

dat <- morgan.multi.uniformity
dat$col = 1
libs(desplot)
desplot(dat, wheat ~ col*plot,
        aspect=945/112.5,
        main="morgan.multi.uniformity: wheat yield")
desplot(dat, cornfodder ~ col*plot,
        aspect=945/112.5,
        main="morgan.multi.uniformity: corn fodder yield")
plot(dat$wheat, dat$cornfodder,
     xlab="Wheat yield (bu/a)",
     ylab="Corn fodder yield (bu/a)",
     main="morgan.multi.uniformity")