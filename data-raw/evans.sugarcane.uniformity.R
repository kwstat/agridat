# evans.sugarcane.uniformity.R
# Time-stamp: <18 Aug 2022 08:29:17 c:/one/rpack/agridat/data-raw/evans.sugarcane.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

setwd("c:/one/rpack/agridat/data-raw/")
dat <- read_excel("evans.sugarcane.uniformity.xlsx","Sheet1", col_names=FALSE)

dat <- dat %>% as.matrix %>% t
dat <- dat %>% `colnames<-`(1:ncol(dat)) %>% `rownames<-`(1:nrow(dat)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

evans.sugarcane.uniformity=dat
agex(evans.sugarcane.uniformity)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(5*50)/(142*5),
        main="evans.sugarcane.uniformity")

substring(dat$yield,3) %>% table # yields ending in 0,5 are much more common

Field length: 5 plots x 50 feet (20 stools per plot; 30 in between stools) = 250 feet

Field width: 142 plots x 5 feet = 710 feet

