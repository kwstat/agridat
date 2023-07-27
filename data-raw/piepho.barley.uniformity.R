# 0_template.R
# Time-stamp: <12 Jul 2023 17:03:38 c:/drop/rpack/agridat/data-raw/piepho.barley.uniformity.R>

libs(desplot,dplyr,kw,lattice,magrittr,readxl,readr,reshape2,tibble)

# ----------------------------------------------------------------------------

dat <- read.csv("c:/x/rpack/agridat/data-raw/piepho.barley.csv")

piepho.barley.uniformity <- dat

#agex(piepho.barley.uniformity)

# ----------------------------------------------------------------------------

dat <- piepho.barley.uniformity
libs(desplot)
desplot(dat, yield ~ col*row,
        tick=TRUE, aspect=(36*
        main="piepho.barley.uniformity.csv")

dat <- mutate(dat, x=factor(col), y=factor(row))
dat <- arrange(dat, x, y)

# Piepho model
libs(asreml)
m1 <- asreml(data=dat,
             yield ~ 1, 
             random = ~ x + y + ar1(x):ar1(y), 
             residual = ~  units,
             na.action=na.method(x="keep") )
m1 <- update(m1)
lucid::vc(m1) # Piepho has .9671, .9705 for col,row correlation

# fitting the full model random=~x+y+units has trouble
# so fit this in two steps
m2 <- asreml(data=dat,
             yield ~ 1, 
             #random = ~ x + y + idv(units),
             random = ~ idv(units),
             residual= ~ ar1(x):ar1(y) ,
             na.action=na.method(x="keep") )
m2 <- update(m2)
lucid::vc(m2)
# add random row/col
m2 <- update(m2, random = ~ x + y + idv(units) )
m2 <- update(m2)
lucid::vc(m2)

# I usually omit "units"
m3 <- asreml(data=dat,
             yield ~ 1, 
             random = ~ x + y,
             residual= ~ ar1(x):ar1(y) ,
             na.action=na.method(x="keep") )
m3 <- update(m3)
lucid::vc(m3)
