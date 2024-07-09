# minnesota.barley.R

# Other books

# Report of Northwest Experiment Station, Crookston, 1917
 By University of Minnesota. Northwest Experiment Station (Crookston, Minn.)
http://books.google.com/books?id=8NoxAQAAMAAJ&pg=RA7-PA13&lpg=RA7-PA13&dq=%22improved+manchuria%22+crookston&source=bl&ots=YaR89ZC4-f&sig=3QE_CyUIfSUsQjcByRnR_jdfaVw&hl=en&sa=X&ei=QcWzT6OGEsSE2wW1xInqCA&ved=0CDgQ6AEwAQ#v=onepage&q=%22improved%20manchuria%22%20crookston&f=false

# ----------------------------------------------------------------------------

# Create the yield data

libs(asreml, kw, rio, Hmisc, lattice, readxl, reshape2)
setwd("c:/drop/rpack/agridat/data-raw/")

d0 <- read_excel("minnesota.barley.yield.xlsx", sheet="1893-1921")
d1 <- read_excel("minnesota.barley.yield.xlsx", sheet="1922-1926")
d2 <- read_excel("minnesota.barley.yield.xlsx", sheet="1927-1931")
d3 <- read_excel("minnesota.barley.yield.xlsx", sheet="1932-1936")
d4 <- read_excel("minnesota.barley.yield.xlsx", sheet="1937-1941")

d0 <- melt(d0, id.var=c('site','gen', "CI"))
d1 <- melt(d1, id.var=c('site','gen', "CI"))
d2 <- melt(d2, id.var=c('site','gen', "CI"))
d3 <- melt(d3, id.var=c('site','gen', "CI"))
d4 <- melt(d4, id.var=c('site','gen', "CI"))

dat <- rbind(d0,d1,d2,d3,d4)
names(dat) <- c('site','gen','CI', 'year','yield')
dat <- subset(dat, !is.na(yield))
head(dat)
dat[ dat$gen=="WisNo38" & dat$CI==5105, "gen"] <- "WisconsinBarbless"

# check for duplicate gen CI combinations
dat %>% select(CI,gen) %>% unique() %>% arrange(CI)
dat %>% select(CI,gen) %>% unique() %>% arrange(CI) %>% pull(CI) %>% table() %>% sort()
dat %>% select(CI,gen) %>% unique() %>% pull(gen) %>% table() %>% sort()
   ## WisconsinPedigree      ChampionVermont                Coast      FrenchChevalier 
   ##                 1                    2                    2                    2 
   ##       GoldenQueen              Kitzing               Scotch        BlackHullless 
   ##                 2                    2                    2                    3 
   ##           Mensury          Oderbrucker             Machuria            Chevalier 
   ##                 3                    3                    4                    5 
   ##             Hanna               Hybrid            Manchuria 
   ##                 6                   30                   57 

dat %>% select(CI,gen) %>% unique() %>% arrange(gen) 
# The gen/CI are questionable prior to 1908

# check for outliers, confirmed 103.4 is in original source 
densityplot(~dat$yield)

minnesota.barley.yield <- dat

export(minnesota.barley.yield, "c:/drop/rpack/agridat/data/minnesota.barley.yield.txt")
#export(minnesota.barley.yield, "c:/drop/rpack/agridat/man/minnesota.barley.yield.Rd")
# ----------------------------------------------------------------------------

dat <- minnesota.barley.yield
dat$yr <- factor(dat$year)

# Drop Dryland, Jeans, CompCross, MechMixture because they have less than 5
# year-loc values
dat <- droplevels(subset(dat, !is.element(gen, c("CompCross","Dryland","Jeans","MechMixture",
                                                 "Minn462xPeatland7010", "Minn462xPeatland7011",
                                                 "Minn462xPeatland7012","Minn462xPeatland7013",
                                                 "Minn462xPeatland7014","Mars",
                                                 "ManSA4667", "ManSA4668", "ManSA4669"  ))))
uos(dotplot(gen~yield|yr*site, dat, scales=list(y=list(cex=.5))))

uos(dotplot(gen~yield|site*yr, dat, scales=list(y=list(cex=.5))))

# 1934 has huge swings from one loc to the next
dotplot(gen~yield|site, dat, groups=yr, #layout=c(1,6),
        auto.key=list(columns=5), scales=list(y=list(cex=.5)))

# 28/29 show one reversal
# At StPaul, 1929 had higher yields. At other locations, 1928 had higher yields
dotplot(gen~yield|site, dat, groups=yr, subset=yr %in% c(1928,1929),
        auto.key=list(columns=10),
        layout=c(1,6), scales=list(y=list(cex=.5)))

require(HH)
interaction2wt(yield~site+yr, dat) # 28/29
kw::interaction2wt(dat, yield~site+yr) # 28/29


heat(dat, yield~ gen*site)
heat(dat, yield~ year*site)
heat(dat, yield~ gen*year)
# How does variability compare to 10% G, 70% E, 20% GE ?
require(asreml)
dat <- mutate(dat, gen=factor(gen), site=factor(site))
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

# Total cooling/heating/precip in May-Aug for each site/year
ww <- subset(datw, mo>=4 & mo<=8)
ww <- aggregate(cbind(cdd,hdd,precip,min,max,mn)~site+year, data=ww, sum)
#ww <- subset(ww, site=="Morris")

# Mean yield per each site/env
yy <- aggregate(yield~site+year, dat, mean)
# yy <- subset(yy, site=="Morris")

minn <- merge(ww, yy)
splom(~minn[,c('cdd','hdd','precip','yield')]|minn$site, groups=minn$year,
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

