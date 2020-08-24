# 0_template.R
# Time-stamp: <31 Jul 2020 16:24:59 c:/x/rpack/agridat/data-raw/nair.turmeric.uniformity.R>

# Audibly dictated into Excel. Visual verification of values.
# Checked desplot heatmap vs contour plot.

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("nair.tumeric.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>%
  `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(yield ~ col*row, dat,
        flip=TRUE, aspect=13.6/68, tick=TRUE,
        main="nair.turmeric.uniformity")

nair.turmeric.uniformity <- dat

kw::agex(nair.turmeric.uniformity)
