# wehner.cucumber.uniformity.R

# The first dataset is a homogeneous (one cultivar) population,
# but has many missing columns.

# The second dataset is a heterogeneous (many cultivar) population.

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

setwd("c:/drop/rpack/agridat/data-raw/")

# multiple matrices

dat <- read_excel("wehner.cucumber.uniformity.xlsx","Sheet1", col_names=FALSE)
#dat2 <- read_excel("wehner.cucumber.uniformity.xlsx","Sheet2", col_names=FALSE)

dat <- dat %>%
  as.matrix %>% `colnames<-`(c(3,4,12,13,21,22)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat2 <- dat2 %>%
  as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

desplot(dat, yield ~ col*row, flip=TRUE, tick=TRUE,
        main="wehner.cucumber.uniformity")
desplot(dat2, yield ~ col*row, flip=TRUE,
        main="wehner.cucumber")


wehner.cucumber.uniformity <- dat

agex(wehner.cucumber.uniformity)
