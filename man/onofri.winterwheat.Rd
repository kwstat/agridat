\name{onofri.winterwheat}
\alias{onofri.winterwheat}
\docType{data}
\title{
  Yield of winter wheat varieties across 7 years.
}
\description{
  Yield of 8 durum winter wheat varieties across 7 years with 3 reps.
}
\usage{data("onofri.winterwheat")}
\format{
  A data frame with 168 observations on the following 5 variables.
  \describe{
    \item{\code{year}}{year, numeric}
    \item{\code{block}}{block, 3 levels}
    \item{\code{plot}}{plot, numeric}
    \item{\code{gen}}{genotype, 7 levels}
    \item{\code{yield}}{yield for each plot}
  }
}
\details{
  Yield of 8 durum winter wheat varieties across 7 years with 3 reps.
}

\source{
  Andrea Onofri, Egidio Ciriciofolo (2007).
  Using R to Perform the AMMI Analysis on Agriculture Variety Trials.
  R News, Vol. 7, No. 1, pp. 14-19.
  
  Downloaded electronic version from here Nov 2015:
  http://www.casaonofri.it/Biometry/index.html

  Used with permission of Andrea Onofri.
}

\references{
  F. Mendiburu.
  AMMI.
  http://tarwi.lamolina.edu.pe/~fmendiburu/AMMI.htm

  A. Onofri.
  http://accounts.unipg.it/~onofri/RTutorial/CaseStudies/WinterWheat.htm
}

\examples{
data(onofri.winterwheat)
dat <- onofri.winterwheat
dat <- transform(dat, year=factor(dat$year))

m1 <- aov(yield ~ year + block:year + gen + gen:year, dat)
anova(m1) # Matches Onofri figure 1

\dontrun{
  require(agricolae)
  m2 <- AMMI(dat$year, dat$gen, dat$block, dat$yield)
  plot(m2)
  title("onofri.winterwheat - AMMI biplot")
}

}
\keyword{datasets}
