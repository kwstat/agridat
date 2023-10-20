# cochran.eelworms.R

setwd("c:/drop/rpack/agridat")
dat <- readxl::read_excel("data-raw/cochran.eelworms.xlsx")

libs(lattice)
splom(dat[ , 5:10], group=dat$fumigant, auto.key=TRUE)

## ---------------------------------------------------------------------------
# export

libs(kw)
cochran.eelworms <- dat
agex(cochran.eelworms, prompt=FALSE)
