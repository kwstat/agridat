# borden.sugarcane.R




setwd("c:/drop/rpack/agridat/data-raw")
dat <- read.csv("borden.sugarcane.csv")
head(dat)
borden.sugarcane.uniformity <- dat
kw::agex(borden.sugarcane.uniformity)

mean(dat$yield) # 83.127 # Borden has 83.1

