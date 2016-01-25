\name{gomez.groupsplit}
\alias{gomez.groupsplit}
\docType{data}
\title{
  Group balanced split-plot design in rice
}
\description{
  Group balanced split-plot design in rice
}

\format{
  A data frame with 270 observations on the following 7 variables.
  \describe{
    \item{\code{col}}{column ordinate}
    \item{\code{row}}{row ordinate}
    \item{\code{rep}}{replicate factor, 3 levels}
    \item{\code{fert}}{fertilizer factor, 2 levels}
    \item{\code{gen}}{genotype factor, 45 levels}
    \item{\code{group}}{grouping (genotype) factor, 3 levels}
    \item{\code{yield}}{yield of rice}
  }
}
\details{
  Genotype group S1 is less than 105 days growth duration, S2 is
  105-115 days growth duration, S3 is more than 115 days.
}
\source{
  Gomez, K.A. and Gomez, A.A.. 1984,
  \emph{Statistical Procedures for Agricultural Research}.
  Wiley-Interscience. Page 120.

  Used with permission of Kwanchai Gomez.
}

\examples{

data(gomez.groupsplit)
dat <- gomez.groupsplit

# Gomez figure 3.10.  Obvious fert and group effects
if(require(desplot)){
  desplot(group ~ col*row, dat,
          out1=rep, col=fert, text=gen,
          main="gomez.groupsplit")
}

# Gomez table 3.19 (not partitioned by group)
m1 <- aov(yield ~ fert*group + gen:group + fert:gen:group +
            Error(rep/fert/group), data=dat)
summary(m1)
}

