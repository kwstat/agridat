\name{gomez.fractionalfactorial}
\alias{gomez.fractionalfactorial}
\docType{data}
\title{
  Rice fractional factorial experiment 1/2 2^6.
}
\description{
  Rice fractional factorial experiment 1/2 2^6.
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
  }
}
\details{
  Grain yield from a 2^6 fractional factorial experiment in blocks of 16
  plots each, with two replications.
  
  Gomez has some inconsistencies. One example:

  Page 171: treatment (1) in rep 1, block 2 and rep 2, block 1.

  Page 172: treatment (1) in Rep 1, block 1 and rep 2, block 1.

  This data uses the layout shown on page 171.
}
\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 171-172.

  Used with permission of Kwanchai Gomez.
}

\examples{
\dontrun{

library(agridat)
data(gomez.fractionalfactorial)
dat <- gomez.fractionalfactorial

# trt abcdef has the highest yield
# Gomez, Figure 4.8
libs(desplot)
desplot(yield~col*row, dat,
        # aspect unknown
        text=trt, shorten="none", show.key=FALSE, cex=1,
        main="gomez.fractionalfactorial - treatment & yield")


# Split treatment into individual factors
dat <- transform(dat,
                 a = -1 + 2 * grepl('a',trt),
                  b = -1 + 2 * grepl('b',trt),
                 c = -1 + 2 * grepl('c',trt),
                 d = -1 + 2 * grepl('d',trt),
                 e = -1 + 2 * grepl('e',trt),
                 f = -1 + 2 * grepl('f',trt))

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
