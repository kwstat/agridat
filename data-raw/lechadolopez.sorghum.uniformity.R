# lechadolopez.sorghum.uniformity

libs(readxl, dplyr, desplot, reshape2)

setwd("c:/drop/rpack/agridat/data-raw/")

dat <- read_excel("lechadolopez.sorghum.uniformity.xlsx", "Sheet1", col_names=FALSE)

dat <- as.matrix(dat)
colnames(dat) <- 1:ncol(dat)
dat <- melt(dat)
dat <- rename(dat, row=Var1, col=Var2, yield=value)
head(dat)
lechadolopez.sorghum.uniformity <- dat

kw::agex(lechadolopez.sorghum.uniformity)


