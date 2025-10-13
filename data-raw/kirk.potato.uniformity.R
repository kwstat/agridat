# kirk.potato.uniformity.R

dat <- matrix(c(94.9, 94.2, 112, 98.8, 100.5, 106.8,
                108.7, 119.1, 113.7, 122.0, 109, 105.8,
                116.4, 120.2, 123.5, 122.3, 117.8, 109.6,
                115.5, 130.2, 130.5, 132.8, 126.3, 111.6,
                108.1, 106.9, 128.2, 125.8, 107.5, 111.3,
                110.4, 116.8, 108.4, 105.9, 101.6, 111.3), byrow=TRUE, ncol=6)
              
libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

# one matrix, no column names

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(6*12)/(6*22),
        main="kirk.potato.uniformity")
mean(dat$yield) # matches Kirk

kirk.potato.uniformity <- dat

agex(kirk.potato.uniformity)
