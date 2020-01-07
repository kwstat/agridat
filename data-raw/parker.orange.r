

Additional details

lib(rio)

setwd("c:/x/rpack/agridat/data-raw")

d1 <- import("parker.orange.xlsx",sheet=1)
d2 <- import("parker.orange.xlsx",sheet=2)
d3 <- import("parker.orange.xlsx",sheet=3)
d4 <- import("parker.orange.xlsx",sheet=4)
d5 <- import("parker.orange.xlsx",sheet=5)
d6 <- import("parker.orange.xlsx",sheet=6)
d7 <- import("parker.orange.xlsx",sheet=7)

colnames(d1) <- colnames(d2) <- colnames(d3) <- colnames(d4) <-
  colnames(d5) <- colnames(d6) <- colnames(d7) <-
  0:10

d1 <- d1[,2:11]
d2 <- d2[,2:11]
d3 <- d3[,2:11]
d4 <- d4[,2:11]
d5 <- d5[,2:11]
d6 <- d6[,2:11]
d7 <- d7[,2:11]

require(reshape2)

d1 <- melt(as.matrix(d1))
d2 <- melt(as.matrix(d2))
d3 <- melt(as.matrix(d3))
d4 <- melt(as.matrix(d4))
d5 <- melt(as.matrix(d5))
d6 <- melt(as.matrix(d6))
d7 <- melt(as.matrix(d7))

names(d1) <- names(d2) <- names(d3) <- names(d4) <-
  names(d5) <- names(d6) <- names(d7) <- c('row','col','yield')

dat <- rbind(cbind(year = 1921, d1),
      cbind(year = 1922, d2),
      cbind(year = 1923, d3),
      cbind(year = 1924, d4),
      cbind(year = 1925, d5),
      cbind(year = 1926, d6),
      cbind(year = 1927, d7))

dat <- subset(dat, !is.na(yield)) 
parker.orange.uniformity <- dat
# ----------------------------------------------------------------------------

dat <- parker.orange.uniformity
dat$year <- factor(dat$year)

# Parker fig 2, field plan
if(require(desplot)){
  # 27 rows * 48 ft x 10 cols * 200 feet
  desplot(yield ~ col*row|year, data = dat,
          flip = TRUE, aspect = 27*48/(10*200), # true aspect
          main = "parker.orange.uniformity")
}

# CV across plots in each year. Similar to Parker table 11
cv <- function(x) {
  x <- na.omit(x)
  sd(x)/mean(x)
}
round(100*tapply(dat$yield, dat$year, cv),2)

# Correlation of plot yields across years. Similar to Parker table 15.
# Paker et al may have calculated correlation differently.
dat2 <- acast(dat, row+col ~ year, value.var = 'yield')
round(cor(dat2, use = "pair"),3)
# Visual version.
if(require(corrgram)){
  corrgram(dat2, lower = panel.pts, upper = panel.conf)
}

# Fertility index. Mean across years (ignoring 1921). Parker table 16
dat2 <- aggregate(yield ~ row+col, data = subset(dat, year !=1921 ),
                  FUN = mean, na.rm = TRUE)
round(acast(dat2, row ~ col, value.var = 'yield'),0)

desplot(yield ~ col*row, data = dat2,
        flip = TRUE, aspect = 27*48/(10*200), # true aspect
        main = "parker.orange.uniformity")

