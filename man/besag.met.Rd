\name{besag.met}
\alias{besag.met}
\docType{data}
\title{
  Multi-environment trial of corn laid out in incomplete-blocks
}
\description{
  Multi-environment trial of corn laid out in incomplete-blocks
}

\format{
  A data frame with 1152 observations on the following 7 variables.
  \describe{
    \item{\code{county}}{County factory, 1-6}
    \item{\code{row}}{Row ordinate}
    \item{\code{col}}{Column ordinate}
    \item{\code{rep}}{Rep factor, 1-3}
    \item{\code{block}}{Incomplete block factor, 1-8}
    \item{\code{yield}}{Yield}
    \item{\code{gen}}{Genotype factor, 1-64}
  }
}
\details{
  Multi-environment trial of 64 corn hybrids in six counties in North
  Carolina.  Each location had 3 replicates in in incomplete-block
  design.
}
\source{
  Julian Besag and D Higdon, 1999.
  Bayesian Analysis of Agricultural Field Experiments,
  \emph{Journal of the Royal Statistical Society: Series B (Statistical
    Methodology)},61, 691--746. Table 1.

  Retrieved from
  \url{http://web.archive.org/web/19990505223413/www.stat.duke.edu/~higdon/trials/nc.dat}.

  Used with permission of David Higdon.
}

\examples{
dat <- besag.met

desplot(yield ~ col*row|county, out1=rep, dat, main="besag.met")

\dontrun{
# Heteroskedastic variance model (separate variance for each variety)
# asreml takes 1 second, lme 73 seconds, SAS PROC MIXED 30 minutes

# Average reps
datm <- aggregate(yield ~ county + gen, data=dat, FUN=mean)

# asreml Using 'rcov' ALWAYS requires sorting the data
require(asreml)
datm <- datm[order(datm$gen),]
m1a <- asreml(yield ~ gen, data=datm,
              random = ~ county,
              rcov = ~ at(gen):units,
              predict=asreml:::predict.asreml(classify="gen"))
summary(m1a)$varcomp
##            effect component std.error z.ratio      con
## county!county.var   1324      838.2       1.6 Positive
##  gen_G01!variance     91.93    58.82      1.6 Positive
##  gen_G02!variance    210.7    133.9       1.6 Positive
##  gen_G03!variance     63.03    40.53      1.6 Positive
##  gen_G04!variance    112.1     71.53      1.6 Positive
##  gen_G05!variance     28.39    18.63      1.5 Positive
##  gen_G06!variance    237.4    150.8       1.6 Positive
## ... etc ...


# lme
require(nlme)
m1l <- lme(yield ~ -1 + gen, data=datm, random=~1|county,
               weights = varIdent(form=~ 1|gen))
m1l$sigma^2 * c(1, coef(m1l$modelStruct$varStruct, unc = F))^2
##           G02    G03    G04    G05    G06    G07    G08 
##  91.90 210.75  63.03 112.05  28.39 237.36  72.72  42.97 
## ... etc ...


# We get the same results from asreml & lme
plot(m1a$gammas[-1],
     m1l$sigma^2 * c(1, coef(m1l$modelStruct$varStruct, unc = F))^2)
}
}

