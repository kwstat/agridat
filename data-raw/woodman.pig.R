# woodman.pig.R
# Time-stamp: <01 Mar 2021 10:42:12 c:/x/rpack/agridat/data-raw/woodman.pig.R>


library(pacman)
p_load(asreml,dplyr,fs,janitor,kw,lattice,readxl,readr,reshape2,tibble)
asreml.options(colourise=FALSE)

setwd("c:/x/rpack/agridat/data-raw/")
dat0 <- read_csv("woodman.pig.csv")
dat <- janitor::clean_names(dat0)
woodman.pig <- dat
#dat <- mutate_at(dat, vars(), factor)
head(dat)
kw::agex(woodman.pig)

dat <- woodman.pig
dat <- transform(dat, date1=36, date2=148)
  plot(NA, xlim=c(31,153), ylim=c(28,214),
       xlab="day of year", ylab="weight")
  segments(dat$date1, dat$weight1, dat$date2, dat$weight2)
  title("woodamn.pig")


segments(dat$date1, dat$weight1, dat$date2, dat$weight2)

dat <- transform(dat, gain=(weight2-weight1)/16)
dat <- transform(dat, pen=factor(pen), treatment=factor(treatment),
                 sex=factor(sex))
m1 <- lm(gain ~ -1 + pen + treatment +sex + treatment:sex + weight1, data=dat)
anova(m1)
# Results similar to Westfall 8.13
libs(emmeans)
pairs(emmeans(m1, "treatment"))
# NOTE: Results may be misleading due to involvement in interactions
#  contrast estimate    SE df t.ratio p.value
#  A - B      0.4283 0.288 19 1.490   0.3179 
#  A - C      0.5200 0.284 19 1.834   0.1857 
#  B - C      0.0918 0.288 19 0.319   0.9456 

