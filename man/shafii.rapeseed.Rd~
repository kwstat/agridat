\name{shafii.rapeseed}
\alias{shafii.rapeseed}
\docType{data}
\title{
  Rapeseed yield multi-environment trial, 3 years
}
\description{
  Rapeseed yield multi-environment trial, 3 years
}
\usage{data(shafii.rapeseed)}
\format{
  A data frame with 648 observations on the following 5 variables.
  \describe{
    \item{\code{year}}{Year, numeric: 87, 88, 89}
    \item{\code{loc}}{Location factor, 14 levels}
    \item{\code{rep}}{Rep factor, 3 levels}
    \item{\code{gen}}{Genotype factor, 6 levels}
    \item{\code{yield}}{Yield, kg/ha}
  }
}
\details{
  SAS codes for the analysis can be found at
  \url{http://www.uiweb.uidaho.edu/ag/statprog/ammi/}

  The data are from the U.S. National Winter Rapeseed trials conducted
  in 1986, 1987, and 1988.  Trial locations included Georgia (GGA, TGA),
  Idaho (ID), Kansas (KS), Mississippi (MS), Montana (MT), New York
  (NY), North Carolina (NC), Oregon (OR), South Carolina (SC), Tennessee
  (TN), Texas (TX), Virginia (VA), and Washington (WA).

  
}
\source{
  Electronic version retrieved from
  \url{http://www.uiweb.uidaho.edu/ag/statprog/ammi/yld.data}.

  Used with permission of Benjamin Price.
}
\references{
  Bahman Shafii and William J Price, 1998.
  Analysis of Genotype-by-Environment Interaction Using the
  Additive Main Effects and Multiplicative Interaction Model
  and Stability Estimates, \emph{JABES}, 3, 335--345.
}
\examples{
dat <- shafii.rapeseed

dat$gen <- with(dat, reorder(gen, yield, mean))
dat$loc <- with(dat, reorder(loc, yield, mean))
dat$yield <- dat$yield/1000

dat <- transform(dat, rep=factor(rep), year=as.factor(as.character(year)))
dat$locyr = paste(dat$loc, dat$year, sep="")

# The 'means' of reps
datm <- aggregate(yield~gen+year+loc+locyr, data=dat, FUN=mean)
datm <- datm[order(datm$gen),]
datm$gen <- as.character(datm$gen)
datm$gen <- factor(datm$gen,
                       levels=c("Bienvenu","Bridger","Cascade",
                         "Dwarf","Glacier","Jet"))
dat$locyr <- reorder(dat$locyr, dat$yield, mean)

# This picture tells most of the story
# Now change symbols
tpg <- trellis.par.get()
tpg$superpose.symbol$pch <- c('7','8','9')
trellis.par.set(tpg)
dotplot(loc~yield|gen,group=year,data=dat,auto.key=TRUE,
        ylab="Location")
dotplot(loc~yield|gen,group=year,data=datm,auto.key=TRUE)

# AMMI biplot.  Remove gen and locyr effects.
m1.lm <- lm(yield ~ gen + locyr, data=datm)
datm$res <- resid(m1.lm)
# Convert to a matrix
require("reshape2")
dm <- melt(datm, measure.var='res', id.var=c('gen', 'locyr'))
dmat <- acast(dm, gen~locyr)
# AMMI biplot.  Figure 1 of Shafii (1998)
biplot(prcomp(dmat))

}

