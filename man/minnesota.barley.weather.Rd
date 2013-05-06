\name{minnesota.barley.weather}
\alias{minnesota.barley.weather}
\docType{data}
\title{
  Monthly weather at 6 sites in Minnesota 1927-1936.
}
\description{
  This is monthly weather summaries for the 6 sites where barley yield
  trials were conducted.
}
\usage{data(minnesota.barley.weather)}
\format{
  A data frame with 719 observations on the following 8 variables.
  \describe{
    \item{\code{site}}{Site factor, 6 levels}
    \item{\code{year}}{Year, 1927-1936, numeric}
    \item{\code{mo}}{Month, 1-12, numeric}
    \item{\code{cdd}}{Monthly cooling degree days, Fahrenheit}
    \item{\code{hdd}}{Monthly heating degree days, Fahrenheit}
    \item{\code{precip}}{Monthly precipitation, inches}
    \item{\code{min}}{Monthly average daily minimum temp, Fahrenheit}
    \item{\code{max}}{Monthly average daily maximum temp, Fahrenheit}
  }
}
\details{
  When the weather data was extracted from the National Climate Data
  Center, the following weather stations were chosen, based on
  availability of weather data in the given time frame (1927-1936)
  and the proximity to the town (site) for the barley data.
  
  \tabular{lll}{
    site\tab station name\tab station\cr
    Morris\tab MORRIS WC EXPERIMENTAL STATION\tab USC00215638\cr
    StPaul\tab MINNEAPOLIS WEATHER BUREAU DOWNTOWN\tab USC00215433\cr
    Crookston\tab CROOKSTON NW EXPERIMENTAL STATION\tab USC00211891\cr
    GrandRapids\tab GRAND RAPIDS FRS LAB\tab USC00213303\cr
    Waseca\tab  WASECA EXPERIMENTAL STATION\tab USC00218692\cr
    Duluth\tab  SUPERIOR\tab USC00478349\cr
  }

  'cdd' are cooling degree days, which is the number of degree days with
  a temperature _above_ 65 Fahrenheit.
  
  'hdd' are heating degree days, _below_ 65 Fahrenheit.

  No data is available for Duluth in Dec, 1931.
}
\source{
  National Climate Data Center, \url{http://www.ncdc.noaa.gov/}.
}
\examples{
dat <- minnesota.barley.yield
datw <- minnesota.barley.weather

# Weather trends over time
require(latticeExtra)
useOuterStrips(xyplot(cdd~mo|year*site, datw, groups=year,
subset=(mo > 3 & mo < 10), scales=list(alternating=FALSE),
type='l', auto.key=list(columns=5)))

# Total cooling/heating/precip in Apr-Aug for each site/yr
ww <- subset(datw, mo>=4 & mo<=8)
ww <- aggregate(cbind(cdd,hdd,precip)~site+year, data=ww, sum)

# Average yield per each site/env
yy <- aggregate(yield~site+year, dat, mean)

minn <- merge(ww, yy)


# Higher yields generally associated with cooler temps, more precip
require(reshape2)
me <- melt(minn, id.var=c('site','year'))
mey <- subset(me, variable=="yield")
mey <- mey[,c('site','year','value')]
names(mey) <- c('site','year','y')
mec <- subset(me, variable!="yield")
names(mec) <- c('site','year','covar','x')
mecy <- merge(mec, mey)
mecy$yr <- factor(mecy$year)
oldpar <- tpg <- trellis.par.get()
tpg$superpose.symbol$pch <- substring(levels(mecy$yr),4) # Last digit of year
trellis.par.set(tpg)
foo <- xyplot(y~x|covar*site, data=mecy, groups=yr, cex=1, ylim=c(5,65),
              xlab="", ylab="yield",
              panel=function(x,y,...) {
                panel.lmline(x,y,..., col="gray")
                panel.superpose(x,y,...)
              },
              scales=list(x=list(relation="free")))
foo <- useOuterStrips(foo, strip.left = strip.custom(par.strip.text=list(cex=.7)))
combineLimits(foo, margin.x=2L)
}
\keyword{datasets}
