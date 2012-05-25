\name{verbyla.lupin}
\alias{verbyla.lupin}
\docType{data}
\title{
Lupin yields for different varieties and locations, at many densities
}
\description{
  Yield of 9 varieties of lupin at different planting densities across
  2 years and multiple locations.
}
\usage{verbyla.lupin}
\format{
  \describe{
    \item{\code{gen}}{Genotype factor, 9 varieties}
    \item{\code{site}}{Site factor, 11 levels}
    \item{\code{rate}}{seeding rate in plants/m^2}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{serp}}{factor of 4 levels for serpentine seeding effect}
    \item{\code{linrow}}{centered row position as a numeric variate (row-8.5)/10}
    \item{\code{lincol}}{centered column position as a numeric variate (col-3.5)}
    \item{\code{linrate}}{linear effect of seedrate, scaled (seedrate-41.92958)/10}
    \item{\code{yield}}{yield in tons/hectare}
    \item{\code{year}}{year}
    \item{\code{loc}}{Location factor}
  }
}

\details{
Nine varieties of lupin were tested for yield response to plant density
at 11 sites.  The target density in 1991 was 10, 20, ..., 60 plants per
m^2, and in 1992 was 20, 30, ..., 70 plants per m^2.  The variety Myallie
was grown only in 1992.  Each site had 2 reps in 1991 and 3 reps in
1992.  Each rep was laid out as an RCB design; one randomization was
used for all sites in 1991 and one (different) randomization was used
for all sites in 1992.  (This was confirmed with the principal
investigator.) In 1991 at the Mt. Barker location, the data for columns
5 and 6 was discarded due to problems with weeds.

The year of release for the varieties is
\tabular{ll}{
Unicrop \tab 1973\cr
Illyarrie \tab 1979\cr
Yandee \tab 1980\cr
Danja \tab 1986\cr
Gungurru \tab 1988\cr
Yorrel \tab 1989\cr
Warrach \tab 1989\cr
Merrit \tab 1991\cr
Myallie \tab 1995\cr
}
}

\source{
  Arunas P. Verbyla and Brian R. Cullis and Michael G. Kenward
  and Sue J. Welham, (1999), The analysis of designed experiments and
  longitudinal data by using smoothing splines. \emph{Appl. Statist.},
  48, 269--311.

  Retrieved Oct 2010 from
  \url{http://www.blackwellpublishing.com/rss/Readmefiles/verbyla.htm}.
  
  Used with permission of Blackwell Publishing.
}

\examples{
dat <- verbyla.lupin

# The same RCB randomization was used at all sites in each year
desplot(gen~col+row|site, data=dat)

# Figure 3 of Verbyla
require("latticeExtra")
foo <- xyplot(yield ~ rate|loc*gen, data=dat, subset=year==92,
              type=c('p','smooth'), cex=.5,
              main="1992", xlab="Seed rate (plants/m^2)",
              ylab="Yield (tons/ha)",
              strip=strip.custom(par.strip.text=list(cex=.7)),
)
# useOuterStrips really helps increase the plotting area
if (require(latticeExtra)) {
useOuterStrips(foo,
strip=strip.custom(par.strip.text=list(cex=.7)),
strip.left=strip.custom(par.strip.text=list(cex=.7)))
} else {
print(foo)
}
}

