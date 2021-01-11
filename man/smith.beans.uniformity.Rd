\name{smith.beans.uniformity}
\alias{smith.beans.uniformity}
\docType{data}
\title{
  Uniformity trials of beans, 2 species in 2 years
}
\description{
  Uniformity trials of beans at California, 1954-1955, 2 species in 2 years
}
\usage{data("smith.beans.uniformity")}
\format{
  A data frame with 912 observations on the following 4 variables.
  \describe{
    \item{\code{expt}}{experiment}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{yield}}{yield, kg}
  }
}
\details{
  
  Trials were conducted in California.
  
  In 1955 plots were twice as wide and twice as long as in 1954. 
  Red Kidney is a bush variety bean, Standard Pink is a viny variety.

  Smith randomly assigned A,B,C,D to plots and used these as 'varieties'
  for calculating ANOVA tables.  Plots were combined side-by-side and
  end-to-end to make larger plots. Decreasing LSDs were observed for
  increases in plot sizes.  LSDs were seldom above 200, which was
  considered to be a noticeable difference for the farmers.

  There are four datasets:

  \bold{1954}
  
  Experiment 1: Red Kidney.
  Experiment 2: Standard Pink

  Field width: 18 plots * 30 inches = 45 ft
  
  Field length: 12 plots * 15 ft = 180 ft

  \bold{1955}
  
  Experiment 3: Red Kidney.
  Experiment 4: Standard Pink

  Field width: 16 plots * 2 rows * 30 in = 80 ft

  Field length: 15 plots * 30 ft = 450 ft

}

\source{
  Francis L. Smith, 1958.
  Effects of plot size, plot shape, and number of replications on the
  efficacy of bean yield trials.
  Hilgardia, 28, 43-63.
  https://doi.org/10.3733/hilg.v28n02p043  
}

\references{
  None.
}

\examples{
\dontrun{

library(agridat)
  
  data(smith.beans.uniformity)
  dat1 <- subset(smith.beans.uniformity, expt=="E1")
  dat2 <- subset(smith.beans.uniformity, expt=="E2")
  dat3 <- subset(smith.beans.uniformity, expt=="E3")
  dat4 <- subset(smith.beans.uniformity, expt=="E4")

  cv <- function(x) { sd(x)/mean(x) }
  cv(dat1$yield)
  cv(dat2$yield) # Does not match Smith. Checked all values by hand.
  cv(dat3$yield)
  cv(dat4$yield)

  libs("desplot")
  desplot(dat1, yield ~ col*row,
          aspect=180/45, flip=TRUE, # true aspect
          main="smith.beans.uniformity, expt 1 (true aspect)")

  desplot(dat2, yield ~ col*row,
          aspect=180/45, flip=TRUE, # true aspect
          main="smith.beans.uniformity, expt 2 (true aspect)")

  desplot(dat3, yield ~ col*row,
          aspect=450/80, flip=TRUE, # true aspect
          main="smith.beans.uniformity, expt 3 (true aspect)")

  desplot(dat4, yield ~ col*row,
          aspect=450/80, flip=TRUE, # true aspect
          main="smith.beans.uniformity expt 4, (true aspect)")
  
}
}
\keyword{datasets}
