# ansari.wheat.R
# Time-stamp: <21 Jan 2018 20:10:55 c:/x/rpack/agridat/data-done/ansari.wheat.R>

libs(dplyr,kw,lattice,readxl,readr,reshape2,tibble)

setwd("c:/x/rpack/agridat/data-done/")
dat1 <- read_excel("ansari.wheat.xlsx","Sheet1", col_names=FALSE)

# dat1 %<>% as.matrix %>% setNames(., 1:15) %>% melt %>% rename(col=Var1,row=Var2,yield=value)
dat1 %<>% as.matrix %>% `colnames<-`(1:96) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

ansari.wheat.uniformity <- dat1

# ----------------------------------------------------------------------------

dat <- ansari.wheat.uniformity

# match Ansari figure 3
if(require(desplot)){
  desplot(yield ~ col*row, dat,
          flip=TRUE, aspect=216/160,
          main="ansari.wheat.uniformity")
}
