\name{piepho.barley.uniformity}
\alias{piepho.barley.uniformity}
\docType{data}
\title{
  Uniformity trial of barley
}
\description{
  Uniformity trial of barley in Germany
}
\usage{data("piepho.barley.uniformity")}
\format{
  A data frame with 1080 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{yield}}{yield per plot}    
  }
}
\details{
    Uniformity trial of barley at Ihinger Hof farm, conducted by the
  University of Hohenheim, Germany, in 2007.
  
  Note: The paper by Piepho says
  "The trial had 30 rows and 36 columns. Plot widths were 1.90 m along rows and 3.73 m along columns."
  However, the SAS code supplement to the paper, called
  "PBR_1654_sm_example1.sas", has row=1-36, col=1-30.  We cannot
  determine which dimension is "row" and which is "column", and
  therefore cannot determine the actual dimensions of the field.

}
\source{
  H. P. Piepho & E. R. Williams (2010).
  Linear variance models for plant breeding trials.
  Plant Breeding, 129, 1-8.
  https://doi.org/10.1111/j.1439-0523.2009.01654.x
}
\references{
  None
}
\examples{
\dontrun{
  data(piepho.barley.uniformity) 
  dat <- piepho.barley.uniformity
  libs(desplot)
  desplot(yield ~ col*row, dat,
          tick=TRUE, # aspect unknown
          main="piepho.barley.uniformity.csv")

  # Piepho AR1xAR1 model (in random term, NOT residual)
  libs(asreml)
  dat <- mutate(dat, x=factor(col), y=factor(row))
  dat <- arrange(dat, x, y)
  m1 <- asreml(data=dat,
               yield ~ 1, 
               random = ~ x + y + ar1(x):ar1(y), 
               residual = ~  units,
               na.action=na.method(x="keep") )
  m1 <- update(m1)
  # Match Piepho: .9671, .9705 for col,row correlation
  libs(lucid)
  lucid::vc(m1) 
}
}
\keyword{datasets}
