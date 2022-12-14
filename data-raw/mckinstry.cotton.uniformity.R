# mckinstry.cotton.uniformity.R



libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)
dat <- read_excel("mckinstry.cotton.uniformity.xlsx", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

mckinstry.cotton.uniformity <- dat

agex(mckinstry.cotton.uniformity)

## ---------------------------------------------------------------------------

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, tick=TRUE, aspect=(20*25)/(24*3.5),
        main="mckinstry.cotton.uniformity")


