# minnesota.barley.r
# Time-stamp: c:/x/rpack/agridat2/minnesota.barley.r


# 1937-1941 here
# Technical bulletin, Issues 876-900, By United States. Dept. of Agriculture
#http://books.google.com/books?id=eywaJmlWRecC&pg=RA3-PA20&dq=morris+trebi+velvet+-trellis+-lattice&hl=en&sa=X&ei=fJirT5TNJ4Sq2QXs1sjGCQ&ved=0CEAQ6AEwAg#v=onepage&q=morris%20trebi%20velvet%20-trellis%20-lattice&f=false

# Others
# Report of Northwest Experiment Station, Crookston, 1917
 By University of Minnesota. Northwest Experiment Station (Crookston, Minn.)
http://books.google.com/books?id=8NoxAQAAMAAJ&pg=RA7-PA13&lpg=RA7-PA13&dq=%22improved+manchuria%22+crookston&source=bl&ots=YaR89ZC4-f&sig=3QE_CyUIfSUsQjcByRnR_jdfaVw&hl=en&sa=X&ei=QcWzT6OGEsSE2wW1xInqCA&ved=0CDgQ6AEwAQ#v=onepage&q=%22improved%20manchuria%22%20crookston&f=false


# ----------------------------------------------------------------------------

# Create the yield data

library(asreml)
library(kw)
library(rio)
library(Hmisc)
library(lattice)

setwd("c:/x/rpack/agridat/data-done/")

d1 <- import("minnesota.barley.yield.1927.csv")
m1 <- melt(d1, id.var=c('site','gen'))
d2 <- import("minnesota.barley.yield.1932.csv")
m2 <- melt(d2, id.var=c('site','gen'))
dat <- rbind(m1,m2)
names(dat) <- c('site','gen','year','yield')
dat$year <- as.numeric(substring(dat$year,2))
dat <- subset(dat, !is.na(yield))
dat <- dat[,c('yield','gen','year','site')]
minnesota.barley.yield <- dat

export(minnesota.barley.yield, "c:/x/rpack/agridat/data/minnesota.barley.yield.txt")
export(minnesota.barley.yield, "c:/x/rpack/agridat/man/minnesota.barley.yield.Rd")
# ----------------------------------------------------------------------------

dat <- minnesota.barley.yield
dat$yr <- factor(dat$year)

# Drop Dryland, Jeans, CompCross, MechMixture because they have less than 5
# year-loc values
dat <- droplevels(subset(dat, !is.element(gen, c("CompCross","Dryland","Jeans","MechMixture"))))

uos(dotplot(gen~yield|yr*site, dat, scales=list(y=list(cex=.5))))

uos(dotplot(gen~yield|site*yr, dat, scales=list(y=list(cex=.5))))

# 1934 has huge swings from one loc to the next
dotplot(gen~yield|site, dat, groups=yr, #layout=c(1,6),
        auto.key=list(columns=5), scales=list(y=list(cex=.5)))

# 28/29 show one reversal
dotplot(gen~yield|site, dat, groups=yr, subset=year %in% c(1928,1929),
        layout=c(1,6), scales=list(y=list(cex=.5)))

require(HH)
interaction2wt(yield~site+yr, dat) # 28/29

# How does variability compare to 10% G, 70% E, 20% GE ?
require(asreml)
a1 <- asreml(yield ~ 1, random = ~ gen + site:yr + gen:site:yr, data=dat)
a1 <- update(a1)
vc(a1)

# ----------------------------------------------------------------------------

# weather data
http://gis.ncdc.noaa.gov/map/cdo/
Choose 'monthly'.  Select loc.  
1. Select locations.
  The Duluth experiment station was on the northern edge of the city of Duluth, about 3 miles inland from the shore of Lake Superior.  The Superior weather station is right on the shore of Lake Superior, just south of the city of Duluth.
2. Choose 1926-1937 date range.
3. Select CSV output.
4. Continue.
5. Select data types:
  Computed: cldd htdd
  Precip: tpcp
  Air Temp: mmnt mmxt mntm
6. Check "data flags", station name, geo loc.
7. Click continue

Data format.  Note, the csv files are metric, in tenths.

CLDD Degree days above 65F (tenths of deg C)
HTDD Degree days below 65F (tenths of deg C)
TPCP Total precip (tenths of mm)
MMNT Mean min (tenths of deg C)
MMXT Mean max (tenths of deg C)
MNTM Mean mean (tenths of deg C)

# ----- Weather data -----
setwd("c:/x/rpack/agrida/data-done/")
dat0 <- import("minnesota.barley.weather.xls")
datw <- dat0
datw <- datw[, c(3:10)]
datw$year <- as.numeric(substring(datw$dat,1,4))
datw$mo <- as.numeric(substring(datw$dat,5,6))
datw <- subset(datw, year>1926 & year<1937)
datw <- transform(datw,
                  cdd=round(CoolingDaysF,0),
                  hdd=round(HeatingDaysF,0),
                  precip=round(PrecipInch,2),
                  min=round(MeanMinF,1),
                  max=round(MeanMaxF,1),
                  mn=round(MeanMeanF,1))

datw <- datw[,c(1,9:15)]

minnesota.barley.weather <- datw
export(datw, "c:/x/rpack/agridat/data/minnesota.barley.weather.txt")
export(datw, "c:/x/rpack/agridat/man/minnesota.barley.weather.Rd")

# Total cooling/heating/precip in May-Aug for each site/yr
ww <- subset(datw, mo>=4 & mo<=8)
ww <- aggregate(cbind(cdd,hdd,precip,min,max,mn)~site+yr, data=ww, sum)
#ww <- subset(ww, site=="Morris")

# Mean yield per each site/env
yy <- aggregate(yield~site+yr, dat, mean)
# yy <- subset(yy, site=="Morris")

minn <- merge(ww, yy)
splom(~minn[,c('cdd','hdd','precip','yield')]|minn$site, groups=minn$yr,
      auto.key=list(columns=5),
      scales=list(cex=.8),
      #subset=minn$site=="Morris"
      )
cor(minn[,3:6])

# ----------------------------------------------------------------------------

datw$ <- hdd
useOuterStrips(xyplot(hdd~mo|year*site, datw, groups=year,
                      #subset=(mo > 3 & mo < 10),
                      scales=list(alternating=FALSE),
type='l', auto.key=list(columns=5)))

# PLS

dy <- minnesota.barley.yield
dw <- minnesota.barley.weather

dwm <- melt(dw, id.var=c('site','year','mo'))
wmat <- acast(dwm, site+year~variable+mo)

dym <- melt(dy, id.var=c('site','year','gen'))
ymat <- acast(dym, site+year~gen, fun.aggregate=mean)

# colSums(!is.nan(ymat))
ymat <- ymat[,c('Glabron','Manchuria','Peatland','Trebi','Velvet')]

# 1931 Duluth has no weather data.  Others have no yield data.
droplocs <- c('Duluth_1931','StPaul_1932','GrandRapids_1927','Crookston_1928',
              'Morris_1933','Morris_1934')
wmat <- wmat[rownames(wmat) %!in% droplocs, ]
ymat <- ymat[rownames(ymat) %!in% droplocs, ]


require(pls)
# Double-centered yields
ymat <- sweep(ymat, 1, rowMeans(ymat)) 
ymat <- sweep(ymat, 2, colMeans(ymat))
# Standardized covariates
wmat <- scale(wmat) 
m1 <- plsr(ymat~wmat)
loadings(m1)
# Aastveit Fig 2a (genotypes), not rotated as they did
biplot(m1, which="y", var.axes=TRUE)
# Fig 2b, 2c (not rotated)
biplot(m1, which="x", var.axes=TRUE, cex=.5)

