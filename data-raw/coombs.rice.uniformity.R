# coombs.rice.uniformity.R

# Typed by KW and checked the total is correct.
dat <- data.frame(row=rep(1:18, each=3),
                  col=rep(1:3,18),
                  yield=c(136,120,114,146,140,122,148,144,120,130,124,128,150,
                          120,120,134,138,140,142,122,130,140,120,128,140,120,
                          134,140,140,124,150,140,126,148,140,124,140,140,120,
                          144,136,124,126,130,120,122,140,128,116,120,118,124,
                          140,124)/10)

coombs.rice.uniformity <- dat

libs(desplot)
desplot(dat, yield ~ col*row,
        main="coombs.rice.uniformity",
        flip=TRUE, aspect=(18 / 3))
