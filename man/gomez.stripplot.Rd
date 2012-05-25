\name{gomez.stripplot}
\alias{gomez.stripplot}
\docType{data}
\title{
Rice strip-plot experiment
}
\description{
  A strip-plot experiment with three reps, variety as the horizontal
  strip and nitrogen fertilizer as the vertical strip.
}
\usage{data(gomez.stripplot)}
\format{
  \describe{
    \item{\code{yield}}{Grain yield in kg/ha}
    \item{\code{rep}}{Rep}
    \item{\code{nitro}}{Nitrogen fertilizer in kg/ha}
    \item{\code{gen}}{Rice variety}
    \item{\code{x}}{Ordinate in the field}
    \item{\code{y}}{Ordinate in the field}
  }
}

\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 110.

  Used with permission of Kwanchai Gomez.
}

\examples{

dat <- gomez.stripplot

# Gomez figure 3.7
desplot(gen~x*y, data=dat, out1=rep, num=nitro, cex=1)

# Gomez table 3.12
tapply(dat$yield, dat$rep, sum)
tapply(dat$yield, dat$gen, sum)
tapply(dat$yield, dat$nitro, sum)

# Gomez table 3.15.  Anova table for strip-plot
dat <- transform(dat, nf=factor(nitro))
m1 <- aov(yield ~ gen * nf + Error(rep + rep:gen + rep:nf), data=dat)
summary(m1)

}

