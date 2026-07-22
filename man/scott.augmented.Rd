\name{scott.augmented}
\alias{scott.augmented}
\docType{data}
\title{
  Augmented RCB experiment using soybean
}
\description{
  Augmented RCB experiment using soybean
}
\usage{data("scott.augmented")}
\format{
  A data frame with 30 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{genotype}
    \item{\code{check}}{Check indicator Y/N}
    \item{\code{block}}{Block}
    \item{\code{yield}}{Yield}
  }
}
\details{
  Experiment conducted in 1991 at the South Dakota State University
  Agronomy Farm, Brookings, SD.

  The experiment is an augmented Randomized Complete Block.
  
  Four soybean genotypes were replicated 3 times.
  Also, 17 genotypes were included, but not replicated. These appeared
  randomly in the different blocks.
  Block 3 contained another replicate of one of the check geenotypes.

  Data provenance. Typed by K.Wright.
}
\source{
  R. A. Scott, G. A. Milliken (1993).
  A SAS Program for Analyzing Augmented Randomized Complete-Block
  Designs.
  Crop Science, 33, 865-867.
  https://doi.org/10.2135%2Fcropsci1993.0011183X003300040046x
}
\references{
  Nonne
}
\examples{
\dontrun{
library(agridat)
data(scott.augmented)
dat <- scott.augmented

# Create separate factors for check genotypes and new genotypes

library(dplyr)
dat <- mutate(dat, 
              gen=factor(gen),
              # gen_check is gen name for checks, 0 for non-checks
              gen_check = ifelse(check=="Y", as.character(gen),0),
              # gen_new is 0 for checks, gen name for non-checks
              gen_new = ifelse(check=="N", as.character(gen),0),
              gen_check=factor(gen_check),
              gen_new=factor(gen_new),
              block=factor(block))

# lmer version
library(lme4)
m1.lme <- lmer(yield ~ -1 + gen_check + (1|gen_new:gen_check) + (1|block), data=dat)
# The fixed effects match Scott Table 1
fixef(m1.lme)
# Random effect predictions
p1fix <- ranef(m1.lme)$"gen_new:gen_check" + fixef(m1.lme)[1]
p1fix |> filter(row_number() > 4) |> head()

# asreml version
#
# dat <- mutate(dat, check=factor(check))
# m2 <- asreml(yield~ at(check,"Y"):gen, data=dat,
#                   random= ~ block + at(check,"N"):gen)
# p2fix <- predict(m2,
#              classify="check:gen", levels=list(check="Y"))$pvals
# filter(p2fix, !is.na(predicted.value))
# p2ran <- predict(m2,
#                  classify="check:gen", levels=list(check="N"))$pvals
# filter(p2ran, !(entry %in% chknames)) |> head()

}
}
\keyword{datasets}
