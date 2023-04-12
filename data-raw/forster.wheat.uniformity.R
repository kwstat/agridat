
# 0_template.R
# Time-stamp: <12 Apr 2023 17:03:29 c:/drop/rpack/agridat/data-raw/forster.wheat.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("forster.wheat.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)


require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(16*20)/(10*30), # true aspect
        main="forster.wheat.uniformity")


forster.wheat.uniformity <- dat

agex(forster.wheat.uniformity)


## ---------------------------------------------------------------------------

range(dat$yield, na.rm=TRUE)

mean(dat$yield)
# 135.97 # Forster says 136.5
sd(dat$yield)
# 10.68  # Forster says 10.9

# Compare to Forster table 3.  Slight differences.
table( cut(dat$yield, breaks = c(106,111,116,121,126,131,136,141,146,151,156,161,166)+.5) )
# Forster has 5 plots in the 157-161 bin.
# I filtered the data for this bin and verified the data matches the layout.
filter(dat, yield>156.5, yield<161.5)
