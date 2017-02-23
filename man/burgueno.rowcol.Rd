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
    \item{\code{rep}}{rep, 2 levels}
    \item{\code{row}}{row}
    \item{\code{col}}{column}
    \item{\code{gen}}{genotype, 64 levels}
    \item{\code{yield}}{yield, tons/ha}
  }
}

\details{
  A field experiment with two contiguous replicates in 8 rows, 16
  columns.

  The plot size is not given.
}

\source{
  J Burgueno, A Cadena, J Crossa, M Banziger, A Gilmour, B Cullis. 2000.
  \emph{User's guide for spatial analysis of field variety trials using
    ASREML}.  CIMMYT.  

  Electronic version of the data obtained from CropStat software.

  Used with permission of Juan Burgueno.

}

\examples{

data(burgueno.rowcol)
dat <- burgueno.rowcol

# Two contiguous reps in 8 rows, 16 columns
if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          out1=rep, # aspect unknown
          text=gen, shorten="none", cex=.75,
          main="burgueno.rowcol")
}

if(require(lme4) && require(lucid)){

  # Random rep, row and col within rep
  m1 <- lmer(yield ~ gen + (1|rep) + (1|rep:row) + (1|rep:col), data=dat)
  vc(m1) # Match components of Burgueno p. 40
  ##      grp        var1 var2   vcov  sdcor
  ##  rep:col (Intercept) <NA> 0.2189 0.4679
  ##  rep:row (Intercept) <NA> 0.1646 0.4057
  ##      rep (Intercept) <NA> 0.1916 0.4378
  ## Residual        <NA> <NA> 0.1796 0.4238
  
}

# ----------------------------------------------------------------------------

\dontrun{
  ## require(asreml)
  ## # AR1 x AR1 with linear row/col effects, random spline row/col
  ## dat <- transform(dat, xf=factor(col), yf=factor(row))
  ## dat <- dat[order(dat$xf,dat$yf),]
  ## m2 <- asreml(yield ~ gen + lin(yf) + lin(xf), data=dat,
  ##              random = ~ spl(yf) + spl(xf),
  ##              rcov = ~ ar1(xf):ar1(yf))
  ## m2 <- update(m2) # More iterations

  ## # Scaling of spl components has changed in asreml from old versions
  ## require(lucid)
  ## vc(m2) # Match Burgueno p. 42
  ## ##      effect component std.error z.ratio constr
  ## ##     spl(yf)  0.09077    0.08252   1.1      pos
  ## ##     spl(xf)  0.08108    0.0821    0.99     pos
  ## ##  R!variance  0.1482     0.03119   4.8      pos
  ## ##    R!xf.cor  0.1152     0.2269    0.51   uncon
  ## ##    R!yf.cor  0.009436   0.2414    0.039  uncon
  ## ##   plot(variogram(m2), main="burgueno.rowcol")

}

# ----------------------------------------------------------------------------

\dontrun{
  require(asreml4)
  # AR1 x AR1 with linear row/col effects, random spline row/col
  dat <- transform(dat, xf=factor(col), yf=factor(row))
  dat <- dat[order(dat$xf,dat$yf),]
  m2 <- asreml(yield ~ gen + lin(yf) + lin(xf), data=dat,
               random = ~ spl(yf) + spl(xf),
               resid = ~ ar1(xf):ar1(yf))
  m2 <- update(m2) # More iterations

  # Scaling of spl components has changed in asreml from old versions
  require(lucid)
  vc(m2) # Match Burgueno p. 42
  ##       effect component std.error z.ratio bound %ch
  ##      spl(yf)  0.09077    0.08252   1.1       P 0  
  ##      spl(xf)  0.08107    0.08209   0.99      P 0  
  ##     xf:yf(R)  0.1482     0.03119   4.8       P 0  
  ## xf:yf!xf!cor  0.1152     0.2269    0.51      U 0.1
  ## xf:yf!yf!cor  0.009467   0.2414    0.039     U 0.9

  plot(varioGram(m2), main="burgueno.rowcol")

}

}

\keyword{datasets}
