# wehner.cucumber.uniformity.R

# Reason not used:
# The first dataset is a homogeneous (one cultivar) population,
# but has many missing columns.
# The second dataset is a heterogeneous (many cultivar) population.

## Source:
## Todd C. Wehner. (1984).
## Variation for Yield within Locations in Homogeneous and Heterogeneous Cucumber Populations
## In: Cucurbit Genetics Cooperative Report 7:33-34 (article 15) 1984



libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

setwd("c:/x/rpack/agridat/data-raw/")

# multiple matrices

dat1 <- read_excel("wehner.cucumber.uniformity.xlsx","Sheet1", col_names=FALSE)
dat2 <- read_excel("wehner.cucumber.uniformity.xlsx","Sheet2", col_names=FALSE)

dat1 <- dat1 %>%
  as.matrix %>% `colnames<-`(c(3,4,12,13,21,22)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)
dat2 <- dat2 %>%
  as.matrix %>% `colnames<-`(1:ncol(dat2)) %>% melt %>% rename(row=Var1,col=Var2,yield=value)

desplot(yield ~ col*row, dat1, flip=TRUE, tick=TRUE,
        main="wehner.cucumber.uniformity")
desplot(yield ~ col*row, dat2, flip=TRUE,
        main="wehner.cucumber.uniformity")
