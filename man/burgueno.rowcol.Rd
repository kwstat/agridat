\name{burgueno.rowcol}
\alias{burgueno.rowcol}
\docType{data}
\title{
  Row-column design
}
\description{
  Row-column design
}
\usage{data("burgueno.rowcol")}
\format{
  A data frame with 128 observations on the following 5 variables.
  \describe{
    \item{\code{rep}}{rep factor, 2 levels}
    \item{\code{row}}{row ordinate}
    \item{\code{col}}{column ordinate}
    \item{\code{gen}}{genotype factor, 64 levels}
    \item{\code{yield}}{yield, tons/ha}
  }
}

\details{
  A field experiment with two contiguous replicates in 8 rows, 16 columns.
}

\source{
  J Burgueno, A Cadena, J Crossa, M Banziger, A Gilmour, B Cullis. 2000.
  \emph{User's guide for spatial analysis of field variety trials using
    ASREML}.  CIMMYT.

  Electronic version of the data obtained from CropStat software.

  Used with permission of Juan Burgueno.

}

\examples{

library(agridat)
data(burgueno.rowcol)
dat <- burgueno.rowcol

# Two contiguous reps in 8 rows, 16 columns
desplot(yield ~ col*row, data=dat, out1=rep, main="burgueno.rowcol",
        text=gen, shorten="none", cex=.75)

if(require(lme4) && require(lucid)){

  # Random rep, row and col within rep
  m1 <- lmer(yield ~ gen + (1|rep) + (1|rep:row) + (1|rep:col), data=dat)
  vc(m1) # Match components of Burgueno p. 40
  
}

\dontrun{
  require(asreml)
  # AR1 x AR1 with linear row/col effects, random spline row/col
  dat <- transform(dat, xf=factor(col), yf=factor(row))
  dat <- dat[order(dat$xf,dat$yf),]
  m2 <- asreml(yield ~ gen + lin(yf) + lin(xf), data=dat,
               random = ~ spl(yf) + spl(xf),
               rcov = ~ ar1(xf):ar1(yf))
  m2 <- update(m2) # More iterations

  # Scaling of spl components has changed in asreml from old versions
  require(lucid))
  vc(m2) # Match Burgueno p. 42
  ##      effect component std.error z.ratio constr
  ##     spl(yf)  0.09077    0.08252   1.1      pos
  ##     spl(xf)  0.08108    0.0821    0.99     pos
  ##  R!variance  0.1482     0.03119   4.8      pos
  ##    R!xf.cor  0.1152     0.2269    0.51   uncon
  ##    R!yf.cor  0.009436   0.2414    0.039  uncon
  ##   plot(variogram(m2), main="burgueno.rowcol")

}

}

\keyword{datasets}
