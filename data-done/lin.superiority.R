# lin.superiority.R
# Time-stamp: <13 May 2017 16:38:36 c:/x/rpack/agridat/data-raw/lin.superiority.R>

library(asreml)
library(dplyr)
library(kw)
library(Hmisc)
library(lattice)
library(reshape2)
library(readxl)
library(rio)

setwd("c:/x/rpack/agridat/data-raw/")

dat <- read_excel("lin.superiority.xlsx",sheet=1)

lin.superiority <- dat


# dat %>% group_by(gen) %>% summarize(gen=mean(gen))

# Match means in Table 4
aggregate(yield ~ gen, data=dat, mean)

# ----------------------------------------------------------------------------


library(reshape2)
dat2 <- acast(dat, gen ~ loc, value.var="yield")
locmean <- apply(dat2, 2, mean)
locmax <- apply(dat2, 2, max)
P <- apply(dat2, 1, function(x) {
 sum((x-locmax)^2)/(2*length(x))
})/1000
round(sort(P)) # Lin & Binns 1988, match table 2, column Pi
