# kharitonenko.sugarbeet.uniformity.R

  Note: The name Haritonenko is sometimes translated into English as:
  Pavel Kharitonenko. The original name in Russian is: Павел Иванович
  Харитоненко .


libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

setwd("c:/drop/rpack/agridat/data-raw/")
dat <- read_excel("haritonenko.sugarbeet.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

require(desplot)
desplot(dat, yield ~ col*row,
        flip=TRUE, aspect=(104*1.33*7)/(4*22.5*7), ticks=TRUE,
        main="haritonenko.sugarbeet.uniformity")

haritonenko.sugarbeet.uniformity <- dat

agex(haritonenko.sugarbeet.uniformity)
