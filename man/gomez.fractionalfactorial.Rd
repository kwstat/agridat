\name{gomez.fractionalfactorial}
\alias{gomez.fractionalfactorial}
\docType{data}
\title{
  Rice fractional factorial experiment
}
\description{
  A 1/2 fractional factorial experiment with 6 treatments.  Two reps
  with 2 blocks in each rep.
}

\format{
  A data frame with 64 observations on the following 6 variables.
  \describe{
    \item{\code{yield}}{grain yield in tons/ha}
    \item{\code{rep}}{replicate factor, 2 levels}
    \item{\code{block}}{block factor within rep, 2 levels}
    \item{\code{trt}}{treatment factor, levels (1) to abcdef}
    \item{\code{col}}{column position in the field}
    \item{\code{row}}{row position in the field}
  }
}
\details{
  Note: In Gomez, page 171 has (for example) treatment (1) in Rep 1,
  Block 2 and Rep 2, Block 1.  Page 172 has treatment (1) in Block 1 of
  both reps.  This data uses the layout shown on page 171.
}
\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 171-172.

  Used with permission of Kwanchai Gomez.
}

\examples{

data(gomez.fractionalfactorial)
dat <- gomez.fractionalfactorial

# trt abcdef has the highest yield
# Gomez, Figure 4.8
if(require(desplot)){
  desplot(yield~col*row, dat,
          text=trt, shorten="none", show.key=FALSE, cex=1,
          main="gomez.fractionalfactorial - treatment & yield")
}

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

if(require(FrF2)){
  aliases(m1)
  MEPlot(m1, select=3:8,
         main="gomez.fractionalfactorial - main effects plot")
  #IAPlot(m1, select=3:8)
}

}

