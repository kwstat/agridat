# cargneluttifilho.chickpea.R

libs(dplyr,desplot)
setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read.csv("cargneluttifilho.chickpea.csv")
dat <- rename(dat, trial=trial)
cargneluttifilho.chickpea <- dat

## ---------------------------------------------------------------------------

dat <- cargneluttifilho.chickpea
kw::agex(cargneluttifilho.chickpea)

# Data check
summary(dat$yield)
dat |> group_by(trial) |> summarize(mn=mean(yield), n=n())

libs(desplot)
desplot(dat, yield ~ col*row|trial,
        flip=TRUE, tick=TRUE, aspect=1,
        main="cargneluttifilho.chickpea")
