# baena.bean.uniformity.R

libs(dplyr,readxl,reshape2)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read.csv("baena.bean.uniformity.csv", header=FALSE)

# Convert to long format
dat <- dat |> as.matrix() |> `colnames<-`(1:ncol(dat)) |> melt() |>
  rename(row=Var1, col=Var2, yield=value)
head(dat)
baena.bean.uniformity <- dat


## ---------------------------------------------------------------------------

dat <- baena.bean.uniformity
kw::agex(baena.bean.uniformity)
# Data check
summary(dat$yield)
sum(dat$yield) # 
libs(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=1,
        at=c(0,seq(80,320,40), 500),
        main="baena.bean.uniformity")
