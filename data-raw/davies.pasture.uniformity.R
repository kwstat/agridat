# 0_template.R
# Time-stamp: <10 May 2018 20:09:09 c:/x/rpack/agridat/data-raw/davies.pasture.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("davies.pasture.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(lattice)
qqmath( ~ yield, dat) # clearly non-normal, skewed right

require(desplot)
desplot(yield ~ col*row, dat,
        flip=TRUE, aspect=(40*5)/(19*10), # true aspect
        main="davies.pasture.uniformity") # 

davies.pasture.uniformity <- dat





