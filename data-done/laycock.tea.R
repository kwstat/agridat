# laycock.tea.R

libs(dplyr,readxl,reshape2,tidyverse)

setwd("c:/x/rpack/agridat/data-done/")

dat <- read_csv("laycock.tea.csv", col_names=FALSE)

dat <- dat %>% as.matrix %>%
  `rownames<-`(1:nrow(dat)) %>% `colnames<-`(1:ncol(dat)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

laycock.tea <- dat

# ----------------------------------------------------------------------------

dat <- laycock.tea

if(require(desplot)){
  desplot(yield ~ col*row, dat,
          main="laycock.tea", flip=TRUE)
}
