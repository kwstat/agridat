\name{durban.splitplot}
\alias{durban.splitplot}
\docType{data}
\title{
  Split-plot barley variety trial with fungicide treatments
}
\description{
    Split-plot barley variety trial with fungicide treatments.
}

\format{
  A data frame with 560 observations on the following 6 variables.
  \describe{
    \item{\code{yield}}{Yield, tonnes/ha}
    \item{\code{block}}{Block factor, 4 levels}
    \item{\code{gen}}{Genotype factor, 70 levels}
    \item{\code{fung}}{Fungicide factor, 2 levels}
    \item{\code{row}}{Row}
    \item{\code{bed}}{Bed (column)}
  }
}
\details{
  Grown in 1995-1996 at the Scottish Crop Research Institute.
  Split-plot design with 4 blocks, 2 whole-plot fungicide treatments,
  and 70 barley varieties or variety mixes.  Total area was 10 rows
  (north/south) by 56 beds (east/west).
}
\source{
  Durban, Maria and Hackett, Christine and McNicol, James and
  Newton, Adrian and Thomas, William and Currie, Iain. 2003.
  The practical use of semiparametric models in field trials,
  \emph{Journal of Agric Biological and Envir Stats}, 8, 48-66.

  Retrieved from \url{ftp://ftp.bioss.sari.ac.uk/pub/maria}.

  Used with permission of Maria Durban.
}
\examples{
dat <- durban.splitplot

# Durban 2003, Figure 2
m20 <- lm(yield~gen*fung, data=dat)
dat$resid <- m20$resid
require(lattice)
xyplot(resid~row, dat, type=c('p','smooth'), main="durban.splitplot")
xyplot(resid~bed, dat, type=c('p','smooth'), main="durban.splitplot")

# Figure 4 doesn't quite match due to different break points
coplot(resid~bed|row, data=dat, number=8, cex=.5,
       panel=function(x,y,...) panel.smooth(x,y,span=.4,...))

\dontrun{
# Figure 6 - field trend
require(gam)
m2lo <- gam(yield ~ gen*fung + lo(row, bed, span=.082), data=dat)
new2 <- expand.grid(row=unique(dat$row), bed=unique(dat$bed))
new2 <- cbind(new2, gen="G01", fung="F1")
p2lo <- predict(m2lo, new=new2)
wireframe(p2lo~row+bed, new2, aspect=c(1,.5), main="Field trend")

dat <- transform(dat, rowf=factor(row), bedf=factor(bed))
dat <- dat[order(dat$rowf, dat$bedf),]

# Table 5, variance components.  Table 6, F tests
require(asreml)
m2a2 <- asreml(yield ~ gen*fung, random=~block/fung+units, data=dat,
rcov=~ar1v(rowf):ar1(bedf))
summary(m2a2)$varcomp
anova(m2a2)
}
}

