# 0_template.R
# Time-stamp: <05 Jun 2020 15:07:01 c:/x/rpack/agridat/data-raw/loesell.bean.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

Method:
PDF opened in PDF-XChange viewer and converted to OCR. Text copied into Emacs and cleaned, then copied into Excel and checked by hand with PDF original.  Missing values were entered as 999 in Excel, then replaced with NA in R.

setwd("c:/x/rpack/agridat/data-raw/")
dat <- read_excel("loesell.bean.uniformity.xlsx","Sheet1", col_names=FALSE)

dat %<>% as.matrix %>% `colnames<-`(1:ncol(dat)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

dat <- mutate(dat, yield=ifelse(yield > 998, NA, yield))

require(desplot)
desplot(yield ~ col*row, dat,
        flip=TRUE, aspect=1, tick=TRUE,
        main="loesell.bean.uniformity")

loesell.bean.uniformity <- dat

agex(loesell.bean.uniformity)


