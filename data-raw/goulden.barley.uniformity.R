# Time-stamp: <19 Jul 2022 14:20:41 c:/one/rpack/agridat/data-raw/goulden.barley.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/one/rpack/agridat/data-raw/")
dat <- read_excel("goulden.barley.uniformity.xlsx","Sheet1", col_names=FALSE)
dat <- dat[2:49,2:49]
dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)

desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=1,
        main="goulden.barley.uniformity")

goulden.barley.uniformity <- dat

# Overwrite the previous 20x20 data with this new data
write.table(goulden.barley.uniformity,
            file = "c:/one/rpack/agridat/data/goulden.barley.uniformity.txt", 
            sep = "\t", row.names = FALSE)

