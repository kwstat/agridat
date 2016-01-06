# lee.ordinal.r
# Time-stamp: c:/x/rpack/agridat2/lee.ordinal.r

library(asreml)
library(kw)
library(Hmisc)
library(lattice)

setwd("c:/x/lee/Ch8_Individual_Trial_result")
dat <- import("")
str(dat)
describe(dat)

ff <- c("1983_1984/8384data.csv",
        "1985_1986/8586data.csv",
        "1987_1988/8788data.csv",
        "1991_1992/9192data.csv",
        "1993_1994/9394data.csv",
        "1995_1996/9596data.csv",
        "1997_1998/9798data.csv",
        "1999_2000/9900data.csv",
        "2001_2002/0102data.csv",
        "2003_2004/0304data.csv",
        "2005_2006/0506data.csv")

# Note, Lee's picture of 85-86 has row numbers 1:15 15:1, so that every other
# column is flipped vertically in the picture.  The data appear to match
# the planting plan

# Read, clean, and rbind the files
alldat <- NULL
frame()
bug <- FALSE
for(fil in ff){
  cat("---",fil,"---\n")
  dat <- import(fil)
  if(bug) print(head(dat))
  dat <- melt(dat, id.var=c('Cultivar','Column','Row','Rep'))
  dat <- nick(dat, date=variable)
  dat$date <- substring(dat$date, 2)
  dat$date <- gsub("\\.","-",dat$date)
  dat$date <- as.Date(dat$date, format="%d-%b-%Y")
  if(is.factor(dat$value)) dat$value <- fac2num(dat$value) # because of missings
  if(is.character(dat$value)) dat$value <- as.numeric(dat$value)
  nc <- length(unique(dat$date))
  dat <- cbind(year=substring(fil,1,4), dat)
  alldat <- rbind(alldat, dat)
  if(bug) print(head(dat))
  if(bug) print(table(dat$Cultivar))
  # There are some years with duplicates
  if(bug) {
    foo <- desplot(value~Column*Row|date, dat, layout=c(nc,1),
                   col.region=heat.colors, out1=Rep, num=Cultivar,
                   main=fil)
    foo <- update(foo, between=list(x=.25))
    print(foo)
    print(xyplot(value~date|Cultivar, dat, group=Rep, main=fil, as.table=TRUE))
  }
}
orig=alldat

# Change breeder names to commercial names
alldat$Cultivar <- as.character(alldat$Cultivar)
alldat <- within(alldat, {
  # Based on Potato Plant Breeding database
  Cultivar = gsub("287.12","DRIVER", Cultivar)
  Cultivar = gsub("1308.66", "GLADIATOR", Cultivar)
  Cultivar = gsub("221.17", "KARAKA", Cultivar)
  Cultivar = gsub("064.54", "KIWITEA", Cultivar)
  Cultivar = gsub("064.56", "KIWITEA", Cultivar)
  Cultivar = gsub("511.1$", "MOONLIGHT", Cultivar) # Do not match 511.18
  Cultivar = gsub("^177.3", "PACIFIC", Cultivar) # Do not match 3177.3
  Cultivar = gsub("1830.11", "R.RASCAL", Cultivar)
  Cultivar = gsub("155.05", "RUA", Cultivar)
  Cultivar = gsub("517.12", "SUMMIT", Cultivar)
  Cultivar = gsub("1949.64", "W.DELIGHT", Cultivar)
  Cultivar = gsub("2332.10", "DAWN", Cultivar)
  # 83 checked
  # 85 checked
  # 87 checked
  # 91 map / blight91_sorted_by_cult
  Cultivar = gsub("169.6", "KAIMAI", Cultivar)
  # 93 map / cultlist
  Cultivar = gsub("1975.12", "FRASER", Cultivar)
  # 95 map / cultlist
  Cultivar = gsub("2558.1", "HORIZON", Cultivar)
  # 97 checked
  # 99 checked
  # 01 map / cultlist comparison
  Cultivar = gsub("CROP14", "HORIZON", Cultivar)
  Cultivar = gsub("RANGER", "R.RUSSET", Cultivar)
  Cultivar = gsub("719.44", "CROP17", Cultivar)
  Cultivar = gsub("875.9", "CROP23", Cultivar)
  Cultivar = gsub("913.7", "CROP18", Cultivar)
  Cultivar = gsub("937.3", "CROP25", Cultivar)
  Cultivar = gsub("964.8", "CROP19", Cultivar)
  Cultivar = gsub("1021.1", "CROP20", Cultivar)
  Cultivar = gsub("1025.2", "CROP26", Cultivar)
  Cultivar = gsub("2852.5", "CROP15", Cultivar)
  Cultivar = gsub("2885.1", "CROP16", Cultivar)
  Cultivar = gsub("2886.3", "CROP22", Cultivar)
  Cultivar = gsub("2279.3", "CROP21", Cultivar)
  Cultivar = gsub("3003.4", "CROP27", Cultivar)
  Cultivar = gsub("3011.6", "CROP28", Cultivar)
  # 03 check
  # 05 check
  #Cultivar = gsub("", "", Cultivar)
})
alldat$Cultivar <- factor(alldat$Cultivar)

# What is common to 85 95 97 99 01 03?
# intersect( intersect( intersect( intersect( intersect(kk[[2]], kk[[6]]),
#                                            kk[[7]]), kk[[8]]), kk[[9]]), kk[[10]])
# Only "KIWITEA" "RUA"     "I.HARDY"
# And KIWITEA was missing from 1993!!!

# Common cultivars across years.  Page 27.
# Seriously weird code...
# http://stackoverflow.com/questions/20709808
kk <- tapply(alldat$Cultivar, alldat$year, function(x) as.character(unique(x)))
mat <- outer(1:11, 1:11,
             Vectorize(function(a, b)
                       length(Reduce(intersect, kk[c(a, b)]))))
(mat) # Table 1 of Lee

## i1=8
## i2=9
## length(intersect(sort(kk[[i1]]), sort(kk[[i2]])))
## comm=intersect(sort(kk[[i1]]), sort(kk[[i2]]))
## setdiff(sort(kk[[i1]]), comm)
## setdiff(sort(kk[[i2]]), comm)
## sort(kk[[i1]])
## sort(kk[[i2]])

alldat <- nick(alldat, gen=Cultivar, col=Column, row=Row, rep=Rep, y=value)

lee.potatoblight <- alldat

# ----------------------------------------------------------------------------

dat <- lee.potatoblight

# Common cultivars across years.
# Weird code from here: http://stackoverflow.com/questions/20709808
gg <- tapply(dat$gen, dat$year, function(x) as.character(unique(x)))
tab <- outer(1:11, 1:11,
             Vectorize(function(a, b) length(Reduce(intersect, gg[c(a, b)]))))
tab # Match Lee page 27.

# Note the progression to lower scores as time passes in each year
desplot(y ~ col*row|date, dat, main="lee.potatoblight")

# 1983 only.  I.Hardy succumbs quickly
xyplot(y ~ date|gen, dat, subset=year==1983, group=rep,
       ylab="Blight resistance score", main="lee.potatoblight", as.table=TRUE)

require(plyr)
d2 <- ddply(dat, .(year), mutate, days = as.Date(date)-min(as.Date(date)))
d2 <- aggregate(y ~ year + gen + days, data=d2, mean)
xyplot(y ~ as.numeric(days), data=d2, subset=gen=="R.RASCAL",
       group=year, xlim=c(0,80), type='l', main="Red Rascal",
       xlab="Day of season", auto.key=list(columns=5))

# ----------------------------------------------------------------------------

# jags model

## 1983/1984 blight trial ##
### All cultivars, cultivar 1 to 20
### 5 replicates
### 10 repeated measurements
### 100 plots

### Standard logistic sigmoid curve ###
### constraint: BB<0 ###
### effects: cultivar, col, row

# Data, sorted by gen, cols then rows
# all 20 cultivars
# the observed grades are formatted as a matrix with dimesion of
# 100 rows by 10 columns, where rows indicate plots and
# columns indicate repeated assessments.

jdat=list(n.date=10, n.obs=100, n.gen=20, n.col=10, n.row=10, n.cut=8,
  time=c(10, 18, 24, 31, 38, 45, 52, 59, 66, 74),
  variety=c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4,
    5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9,
    9, 9, 9, 9, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 12, 12, 12,
    12, 12, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 15, 15, 15, 15,
    15, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18,
    19, 19, 19, 19, 19, 20, 20, 20, 20, 20),
  cols=c(1, 5, 6, 7, 10, 1, 2, 3, 5, 7, 1, 2, 3, 4, 10, 3, 5, 6, 9,
    10, 4, 5, 6, 7, 9, 1, 2, 4, 6, 10, 4, 5, 7, 8, 10, 2, 6, 7, 8,
    9, 2, 3, 4, 5, 9, 1, 2, 7, 8, 9, 1, 6, 7, 9, 10, 3, 4, 6, 7,
    9, 3, 5, 8, 9, 10, 2, 3, 4, 6, 9, 1, 2, 3, 5, 8, 1, 4, 6, 8,
    10, 1, 2, 7, 8, 10, 3, 4, 5, 6, 8, 2, 5, 8, 9, 10, 1, 3, 4, 7,
    8),
  rows=c(9, 4, 5, 1, 8, 3, 1, 9, 6, 7, 10, 8, 3, 2, 6, 10, 2, 8, 3,
    5, 10, 7, 2, 4, 5, 1, 9, 3, 6, 7, 7, 10, 2, 5, 3, 7, 1, 10, 3,
    6, 3, 7, 5, 9, 2, 4, 6, 8, 10, 1, 8, 3, 5, 10, 1, 2, 4, 10, 6,
    7, 6, 3, 1, 8, 10, 2, 5, 8, 4, 9, 2, 4, 8, 5, 9, 5, 9, 7, 2,
    4, 6, 10, 3, 7, 2, 1, 6, 8, 9, 4, 5, 1, 8, 4, 9, 7, 4, 1, 9,
    6),
  grade=structure(.Data=c(9, 8, 8, 7, 2, 2, 2, 1, 1, 1, 9, 9, 7, 4, 2, 1, 1, 1, 1, 1,
                    9, 9, 7, 4, 2, 1, 1, 1, 1, 1, 9, 9, 8, 6, 4, 2, 1, 1, 1, 1, 8,
                    8, 7, 5, 3, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 8, 9, 9,
                    9, 9, 9, 9, 9, 9, 8, 8, 9, 9, 9, 9, 9, 9, 9, 8, 8, 6, 9, 9, 9,
                    9, 9, 9, 9, 8, 7, 4, 9, 9, 9, 9, 9, 9, 9, 8, 7, 5, 9, 9, 9, 9,
                    9, 9, 8, 8, 6, 2, 9, 9, 9, 9, 9, 9, 8, 7, 6, 2, 9, 9, 9, 9, 9,
                    9, 8, 8, 7, 5, 9, 9, 9, 9, 9, 9, 8, 7, 6, 4, 9, 9, 9, 9, 9, 9,
                    8, 7, 5, 1, 9, 9, 8, 7, 4, 3, 1, 1, 1, 1, 9, 9, 8, 6, 4, 2, 2,
                    2, 2, 1, 9, 9, 8, 6, 2, 1, 1, 1, 1, 1, 9, 9, 8, 6, 3, 3, 2, 1,
                    1, 1, 8, 9, 8, 6, 3, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 8, 7,
                    2, 9, 9, 9, 9, 8, 9, 8, 8, 5, 1, 9, 9, 9, 9, 9, 9, 9, 9, 8, 7,
                    9, 9, 9, 9, 9, 9, 8, 8, 7, 4, 9, 9, 9, 9, 9, 8, 7, 6, 3, 1, 9,
                    9, 9, 9, 9, 9, 9, 9, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 7, 9, 9,
                    9, 9, 9, 9, 9, 9, 9, 8, 9, 9, 9, 9, 9, 8, 8, 7, 6, 2, 9, 9, 9,
                    9, 9, 8, 8, 8, 7, 6, 9, 9, 9, 9, 8, 8, 7, 5, 2, 1, 9, 9, 9, 9,
                    8, 7, 5, 4, 3, 1, 9, 9, 9, 9, 8, 8, 7, 5, 3, 1, 9, 9, 9, 9, 8,
                    8, 6, 4, 2, 1, 9, 9, 9, 8, 8, 7, 4, 4, 3, 1, 9, 9, 8, 7, 3, 2,
                    2, 2, 1, 1, 9, 8, 8, 7, 5, 3, 2, 2, 1, 1, 9, 9, 8, 7, 3, 2, 1,
                    1, 1, 1, 9, 9, 8, 5, 4, 3, 1, 1, 1, 1, 9, 9, 7, 5, 3, 2, 1, 1,
                    1, 1, 9, 9, 7, 5, 3, 2, 1, 1, 1, 1, 9, 9, 8, 5, 1, 1, 1, 1, 1,
                    1, 9, 9, 8, 5, 4, 4, 4, 3, 2, 1, 9, 9, 8, 3, 1, 1, 1, 1, 1, 1,
                    9, 9, 8, 5, 4, 2, 1, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 8, 8, 7, 9,
                    9, 9, 9, 9, 9, 9, 8, 7, 5, 9, 9, 9, 9, 9, 9, 9, 8, 7, 5, 9, 9,
                    9, 9, 9, 9, 9, 8, 7, 5, 9, 9, 9, 9, 9, 9, 9, 9, 9, 8, 9, 8, 8,
                    6, 3, 2, 2, 2, 2, 1, 9, 9, 8, 6, 4, 4, 3, 2, 2, 1, 9, 9, 7, 4,
                    2, 2, 2, 1, 1, 1, 9, 9, 8, 6, 4, 3, 2, 2, 2, 1, 9, 9, 8, 6, 6,
                    4, 3, 2, 2, 1, 9, 9, 8, 7, 5, 3, 2, 2, 2, 2, 9, 9, 8, 5, 3, 2,
                    2, 2, 2, 2, 9, 9, 8, 7, 3, 3, 2, 2, 1, 1, 8, 9, 8, 7, 3, 2, 2,
                    2, 2, 1, 9, 9, 8, 6, 3, 2, 2, 1, 1, 1, 9, 9, 8, 7, 5, 4, 4, 3,
                    2, 1, 9, 9, 8, 7, 6, 5, 4, 4, 3, 1, 9, 9, 8, 7, 6, 5, 4, 2, 1,
                    1, 9, 9, 7, 7, 4, 4, 4, 4, 3, 2, 9, 9, 8, 7, 5, 4, 4, 4, 2, 1,
                    9, 9, 7, 3, 1, 1, 1, 1, 1, 1, 9, 9, 7, 4, 1, 1, 1, 1, 1, 1, 9,
                    8, 7, 3, 1, 1, 1, 1, 1, 1, 9, 9, 7, 3, 1, 1, 1, 1, 1, 1, 9, 9,
                    7, 4, 1, 1, 1, 1, 1, 1, 9, 9, 7, 5, 3, 2, 2, 1, 1, 1, 9, 9, 8,
                    7, 4, 2, 1, 1, 1, 1, 9, 9, 7, 5, 2, 1, 1, 1, 1, 1, 9, 9, 7, 4,
                    2, 2, 1, 1, 1, 1, 9, 9, 8, 7, 3, 2, 2, 1, 1, 1, 8, 8, 6, 2, 1,
                    1, 1, 1, 1, 1, 9, 9, 8, 4, 1, 1, 1, 1, 1, 1, 9, 8, 7, 3, 1, 1,
                    1, 1, 1, 1, 9, 9, 7, 4, 2, 1, 1, 1, 1, 1, 9, 9, 7, 5, 2, 1, 1,
                    1, 1, 1, 9, 8, 8, 6, 4, 3, 2, 2, 1, 1, 9, 9, 8, 6, 4, 3, 2, 1,
                    1, 1, 9, 9, 8, 5, 4, 4, 2, 2, 1, 1, 8, 8, 8, 6, 4, 3, 2, 2, 1,
                    1, 9, 9, 8, 6, 5, 3, 3, 2, 1, 1, 9, 9, 9, 7, 7, 5, 5, 6, 3, 2,
                    9, 9, 9, 7, 4, 5, 4, 4, 4, 3, 9, 9, 8, 6, 4, 4, 3, 3, 3, 1, 9,
                    9, 9, 7, 5, 4, 4, 4, 2, 1, 9, 9, 8, 6, 4, 3, 3, 2, 1, 1, 9, 9,
                    8, 7, 6, 5, 5, 5, 5, 4, 9, 9, 8, 7, 7, 6, 5, 5, 5, 3, 9, 9, 8,
                    7, 6, 6, 6, 6, 5, 4, 9, 9, 8, 7, 6, 5, 5, 5, 4, 3, 9, 9, 8, 7,
                    6, 6, 6, 6, 5, 4, 9, 9, 9, 9, 8, 7, 7, 6, 4, 2, 9, 9, 9, 9, 8,
                    7, 7, 5, 3, 2, 9, 9, 9, 8, 7, 6, 5, 5, 4, 3, 9, 9, 9, 9, 8, 7,
                    7, 5, 3, 1, 9, 9, 9, 9, 8, 8, 7, 6, 5, 2),.Dim = c(100, 10))
  )

jinit=list(tau.col=0.1, tau.row=0.1)

require(rjags)
m1 <- jags.model("c:/x/rpack/agridat2/lee.ordinal.bug",
                 data=jdat, #inits=jinit,
                 n.chains=1)
c1 <- coda.samples(m1, variable.names='a', n.iter=1000)
s1 <- summary(c1)
print(s1)


