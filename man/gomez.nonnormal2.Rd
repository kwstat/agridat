\name{gomez.nonnormal2}
\alias{gomez.nonnormal2}
\docType{data}
\title{
  RCB trial of rice measuring white heads
}
\description{
  RCB trial of rice measuring white heads
}
\usage{data("gomez.nonnormal2")}
\format{
  A data frame with 42 observations on the following 3 variables.
  \describe{
    \item{\code{gen}}{genotype}
    \item{\code{rep}}{replicate}
    \item{\code{white}}{percentage of white heads}
  }
}
\details{
  The data are the percent of white heads from a rice variety trial of
  14 varieties with 3 reps.  Because many of the values are less than
  10, the suggested data transformation is sqrt(x+.5).
}
\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 300.

  Used with permission of Kwanchai Gomez.
}
\references{
  None.
}
\examples{

data(gomez.nonnormal2)
dat <- gomez.nonnormal2

# Gomez suggested sqrt transform
dat <- transform(dat, twhite = sqrt(white+.5))

# QQ plots for raw/transformed data
if(require(reshape2) & require(lattice))
  qqmath( ~ value|variable, data=melt(dat),
         main="gomez.nonnormal2 - raw/transformed QQ plot",
         scales=list(relation="free"))

# Gomez anova table 7.21
m1 <- lm(twhite ~ rep + gen, data=dat)
anova(m1)
## Response: twhite2
##           Df Sum Sq Mean Sq F value    Pr(>F)    
## rep        2  2.401  1.2004  1.9137    0.1678    
## gen       13 48.011  3.6931  5.8877 6.366e-05 ***
## Residuals 26 16.309  0.6273                      

}
\keyword{datasets}
