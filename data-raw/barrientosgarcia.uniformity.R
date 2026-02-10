# 0_template.R
# Time-stamp: <2026-02-09 21:00:34 wrightkevi>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")

# ----------------------------------------------------------------------------

dat <- read_excel("barrientosgarcia.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

mean(dat$yield) # thesis has 258.211 on page 63
# 258.1875
var(dat$yield) # thesis has 3680.533
# 3680.283

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(24*2)/(18*1.5),
        main="barrientosgarcia.sesame.uniformity")

barrientosgarcia.sesame.uniformity <- dat

agex(barrientosgarcia.sesame.uniformity)

## ---------------------------------------------------------------------------

dat <- read_excel("barrientosgarcia.uniformity.xlsx","Sheet2", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

mean(dat$yield) # thesis has 1.4819 page 65
# 1.4804
var(dat$yield) # thesis has 0.1858
# 0.1862

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(25*2)/(20*2),
        main="barrientosgarcia.maize.uniformity")

barrientosgarcia.maize.uniformity <- dat

agex(barrientosgarcia.maize.uniformity, prompt=FALSE)

# ----------------------------------------------------------------------------
