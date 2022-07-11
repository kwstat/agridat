\name{kreusler.maize}
\alias{kreusler.maize}
\docType{data}
\title{
  Growth of maize plants in Germany during 1875-1878
}
\description{
  Growth of maize plants in Germany during 1875-1878.
}
\usage{data("kreusler.maize")}
\format{
  A data frame with 165 observations on the following 17 variables.
  \describe{
    \item{\code{gen}}{genotype}
    \item{\code{year}}{year}
    \item{\code{date}}{calendar date}
    \item{\code{raindays}}{number of days of rain per week (zahl der regenstage)}
    \item{\code{rain}}{rain amount (mm)}
    \item{\code{temp}}{temperature mean (deg C) (temperatur mittel)}
    \item{\code{parentseed}}{weight of parent seed (g) (alte korner)}
    \item{\code{roots}}{weight of roots (g) (wurzel)}
    \item{\code{leaves}}{weight of leaves (g) (blatter)}
    \item{\code{stem}}{weight of stem (g) (stengel)}
    \item{\code{tassel}}{weight of tassel (g) (blutenstande)}
    \item{\code{grain}}{weight of grain (korner)}
    \item{\code{plantweight}}{weight of entire plant (ganze pflanze)}
    \item{\code{plantheight}}{plant height (cm) (mittlere hohe der pflanzen)}
    \item{\code{leafcount}}{number of leaves (anzahl der blatter)}
    \item{\code{leafarea}}{leaf area (cm^2) (flachenmaass der blatter)}
  }
}
\details{

Experiments were performed at Poppelsdorf, Germany (near Bonn) during
the years 1875 to 1878.  Observations were collected weekly throughout
the growing season.

Five varieties were grown in 1875. Two in 1876, and one in 1877 and 1878.

The plants were selected by eye as representative, with the number of
plants chosen decreasing during the growing season.  For example, the
dry-weight data was based on the following number of plants:

In 1875 the number sampled began at 20 and dropped to 10.

In 1876 the number sampled began at 45 and dropped to 24.

In 1877 the number sampled began at 90 and dropped to 36.

In 1878 the number sampled began at 120 and dropped to 40.

Most of the observations included fresh weight and dry weight of entire
plants, along with leaf area, date of inflorescence, fertilization, and
kernel development.

The data of Hornberger 71 are the same as Kreusler/Hornberger, but more
complete.

The temperature data was originally given in degrees Reaumur in 1875 and
1876, and degrees Celsius in 1877 and 1878.  All temperatures in this
data are degrees Celsius.  Note: deg C = 1.25 deg R.  Briggs, Kidd &
West (1920) give all temperature in Celsius.

}
\source{

  The 1875-1876 data are from:

  A. Prehn & G. Becker. (1878)
  \emph{Jahresbericht fur Agrikultur-chemie}, Vol 20, p. 216-220.
  https://books.google.com/books?id=ZfxNAAAAYAAJ&pg=216

  The 1877 data are from:

  A. Kreusler, A. Prehn, Hornberger. (1880)
  \emph{Jahresbericht fur Agrikultur-Chemie}, Vol 21, p 248.
  https://books.google.com/books?id=U3IYAQAAIAAJ&pg=248

  The 1878 data are from:

  U. Kreusler, A. Prehn, R. Hornberger. (1880).
  \emph{Jahresbericht fur Agrikultur-Chemie}, Vol 22, p. 211.
  https://books.google.com/books?id=9HIYAQAAIAAJ&pg=211

  Dry plant weight and leaf area for all genotypes and years are
  repeated by:

  G. E. Briggs, Franklin Kidd, Cyril West. (1920).
  A Quantitative Analysis of Plant Growth. Part I.
  \emph{Annals of Applied Biology}, 7, 103-123.

  G. E. Briggs, Franklin Kidd, Cyril West. (1920).
  A Quantitative Analysis of Plant Growth. Part II.
  \emph{Annals of Applied Biology}, 7, 202-223.

}

\references{
  Roderick Hunt, G. Clifford Evans. 1980.
  Classical Data on the Growth of Maize: Curve Fitting With Statistical Analysis.
  \emph{New Phytol}, 86, 155-180.
}

\examples{
\dontrun{

data(kreusler.maize)
dat <- kreusler.maize
dat$date2 <- as.Date(dat$date,"\%d \%b \%Y")
dat$doy <- as.numeric(strftime(dat$date2, format="\%j"))

# Hunt & Evans Fig 2a
libs(lattice)
xyplot(log10(plantweight)~doy|factor(year), data=dat, group=gen,
       type=c('p','smooth'), span=.4, as.table=TRUE,
       xlab="Day of year", main="kreusler.maize - growth of maize",
       auto.key=list(columns=5))

# Hunt & Evans Fig 2b
xyplot(log10(plantweight)~doy|gen, data=dat, group=factor(year),
       type=c('p','smooth'), span=.5, as.table=TRUE,
       xlab="Day of year",
       auto.key=list(columns=4))
# Hunt & Evans Fig 3a
xyplot(log10(leafarea)~doy|factor(year), data=dat, group=gen,
       type=c('p','smooth'), span=.5, as.table=TRUE,
       xlab="Day of year",
       auto.key=list(columns=5))
# Hunt & Evans Fig 3a
xyplot(log10(leafarea)~doy|gen, data=dat, group=factor(year),
       type=c('p','smooth'), span=.5, as.table=TRUE,
       xlab="Day of year",
       auto.key=list(columns=4))

# All traits

xyplot(raindays~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(rain~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(temp~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(parentseed~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(roots~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(leaves~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(stem~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(grain~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(plantweight~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(plantheight~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(leafcount~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(leafarea~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
xyplot(tassel~doy|factor(year), data=dat, group=gen,
       type='l', auto.key=list(columns=5), as.table=TRUE, layout=c(1,4))
}

}
\keyword{datasets}
