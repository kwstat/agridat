\name{gomez.fractionalfactorial}
\alias{gomez.fractionalfactorial}
\docType{data}
\title{
  Fractional factorial of rice, 1/2 2^6 = 2x2x2x2x2x2
}
\description{
  Fractional factorial of rice, 1/2 2^6 = 2x2x2x2x2x2.
  Two reps with 2 blocks in each rep.
}

\format{
  A data frame with 64 observations on the following 6 variables.
  \describe{
    \item{\code{yield}}{grain yield in tons/ha}
    \item{\code{rep}}{replicate, 2 levels}
    \item{\code{block}}{block within rep, 2 levels}
    \item{\code{trt}}{treatment, levels (1) to abcdef}
    \item{\code{col}}{column position in the field}
    \item{\code{row}}{row position in the field}
    \item{\code{a}}{a treatment, 2 levels}
    \item{\code{b}}{b treatment, 2 levels}
    \item{\code{c}}{c treatment, 2 levels}
    \item{\code{d}}{d treatment, 2 levels}
    \item{\code{e}}{e treatment, 2 levels}
    \item{\code{f}}{f treatment, 2 levels}
  }
}
\details{
  Grain yield from a 2^6 fractional factorial experiment in blocks of 16
  plots each, with two replications.
  
  Gomez has some inconsistencies. One example:

  Page 171: treatment (1) in rep 1, block 2 and rep 2, block 1.

  Page 172: treatment (1) in Rep 1, block 1 and rep 2, block 1.

  This data uses the layout shown on page 171.

  Used with permission of Kwanchai Gomez.
}
\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  Statistical Procedures for Agricultural Research.
  Wiley-Interscience.
  Page 171-172.
}

\examples{
\dontrun{

library(agridat)
data(gomez.fractionalfactorial)
dat <- gomez.fractionalfactorial

# trt abcdef has the highest yield
# Gomez, Figure 4.8
libs(desplot)
desplot(dat, yield~col*row,
        # aspect unknown
        text=trt, shorten="none", show.key=FALSE, cex=1,
        main="gomez.fractionalfactorial - treatment & yield")


  # Ensure factors
  dat <- transform(dat,
                   a=factor(a), b=factor(b), c=factor(c),
                   d=factor(d), e=factor(e), f=factor(f) )
  
# Gomez table 4.24, trt SS totalled together.
# Why didn't Gomez nest block within rep?
m0 <- lm(yield ~ rep * block + trt, dat)
anova(m0)

# Gomez table 4.24, trt SS split apart
m1 <- lm(yield ~ rep * block + (a+b+c+d+e+f)^3, dat)
anova(m1)

libs(FrF2)
aliases(m1)
MEPlot(m1, select=3:8,
       main="gomez.fractionalfactorial - main effects plot")

}
}
