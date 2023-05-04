\name{chinloy.fractionalfactorial}
\alias{chinloy.fractionalfactorial}
\docType{data}
\title{
  Fractional factorial of sugarcane, 1/3 3^5 = 3x3x3x3x3
}
\description{
  Fractional factorial of sugarcane, 1/3 3^5 = 3x3x3x3x3.
}
\usage{data("chinloy.fractionalfactorial")}
\format{
  A data frame with 81 observations on the following 10 variables.
  \describe{
    \item{\code{yield}}{yield}
    \item{\code{block}}{block}
    \item{\code{row}}{row position}
    \item{\code{col}}{column position}
    \item{\code{trt}}{treatment code}
    \item{\code{n}}{nitrogen treatment, 3 levels 0, 1, 2}
    \item{\code{p}}{phosphorous treatment, 3 levels 0, 1, 2}
    \item{\code{k}}{potassium treatment, 3 levels 0, 1, 2}
    \item{\code{b}}{bagasse treatment, 3 levels 0, 1, 2}
    \item{\code{m}}{filter press mud treatment, 3 levels 0, 1, 2}
  }
}
\details{
  An experiment grown in 1949 at the Worthy Park Estate in Jamaica.
  
  There were 5 treatment factors:

  3 Nitrogen levels: 0, 3, 6 hundred-weight per acre.

  3 Phosphorous levels: 0, 4, 8 hundred-weight per acre.
  
  3 Potassium (muriate of potash) levels: 0, 1, 2 hundred-weight
  per acre.
  
  3 Bagasse (applied pre-plant) levels: 0, 20, 40 tons per acre.

  3 Filter press mud (applied pre-plant) levels: 0, 10, 20 tons per acre.

  
  Each plot was 18 yards long by 6 yards (3 rows) wide. Plots were
  arranged in nine columns of nine, a 2-yard space separating plots
  along the rows and two guard rows separating plots across the rows.
  
  Field width: 6 yards * 9 plots + 4 yards * 8 gaps = 86 yards

  Field length: 18 yards * 9 plots + 2 yards * 8 gaps = 178 yards

}
\source{
  T. Chinloy, R. F. Innes and D. J. Finney. (1953).
  An example of fractional replication in an experiment on sugar cane manuring.
  Journ Agricultural Science, 43, 1-11.
  https://doi.org/10.1017/S0021859600044567
}
\references{
  None
}
\examples{
\dontrun{

library(agridat)
data(chinloy.fractionalfactorial)
dat <- chinloy.fractionalfactorial

# Treatments are coded with levels 0,1,2. Make sure they are factors
dat <- transform(dat,
                 n=factor(n), p=factor(p), k=factor(k), b=factor(b), m=factor(m))

# Experiment layout
libs(desplot)
desplot(dat, yield ~ col*row,
        out1=block, text=trt, shorten="no", cex=0.6,
        aspect=178/86,
        main="chinloy.fractionalfactorial")

# Main effect and some two-way interactions. These match Chinloy table 6.
# Not sure how to code terms like p^2k=b^2m
m1 <- aov(yield ~ block + n + p + k + b + m + n:p + n:k + n:b + n:m, dat)
anova(m1)

}
}
\keyword{datasets}
