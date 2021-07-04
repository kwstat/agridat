

jones.corn.uniformity <- read.csv("jones.corn.uniformity.csv")
jones.corn.uniformity <- jones.corn.uniformity[ , c("row","col","yield")]

mean(dat$yield)*62.77
# 16062.06 # This appears to be the ISU.SE 2016 location.


library(agridat)
library(desplot)
dat <- jones.corn.uniformity
# Compare to figure 5 of Jones et al.
desplot(dat, yield ~ row*col,
        aspect=(12*3)/(12*4.6),
        main="jones.corn.uniformity")

libs(lattice)
contourplot(yield ~ row*col, dat, region=TRUE)
libs(agricolae)
index.smith
