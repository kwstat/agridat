# laycock.tea.R

libs(dplyr,readxl,reshape2,tidyverse)

setwd("c:/x/rpack/agridat/data-done/")

dat1 <- read_excel("laycock.tea.xlsx", sheet=1, col_names=FALSE)
dat2 <- read_excel("laycock.tea.xlsx", sheet=2, col_names=FALSE)

dat1 <- dat1 %>% as.matrix %>%
  `rownames<-`(1:nrow(dat1)) %>% `colnames<-`(1:ncol(dat1)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)
dat2 <- dat2 %>% as.matrix %>%
  `rownames<-`(1:nrow(dat2)) %>% `colnames<-`(1:ncol(dat2)) %>%
  melt %>% rename(row=Var1,col=Var2,yield=value)

dat1 <- cbind(loc="L1", dat1)
dat2 <- cbind(loc="L2", dat2)

laycock.tea.uniformity <- rbind(dat1,dat2)

# ----------------------------------------------------------------------------

dat <- laycock.tea.uniformity

if(require(desplot)){
  desplot(yield ~ col*row, dat,
          main="laycock.tea.uniformity", flip=TRUE)
}
