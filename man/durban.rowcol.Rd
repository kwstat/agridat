\name{durban.rowcol}
\alias{durban.rowcol}
\docType{data}
\title{
  Row column design of a spring barley trial with many varieties
}
\description{
  Row column design of a spring barley trial with many varieties
}

\format{
  A data frame with 544 observations on the following 5 variables.
  \describe{
    \item{\code{row}}{row}
    \item{\code{bed}}{bed (column)}
    \item{\code{rep}}{rep, 2 levels}
    \item{\code{gen}}{genotype, 272 levels}
    \item{\code{yield}}{yield, tonnes/ha}
  }
}
\details{
  Spring barley variety trial of 272 entries (260 new varieties, 12
  control). Grown at the Scottish Crop Research Institute in 1998.
  Row-column design with 2 reps, 16 rows (north/south) by 34 beds
  (east/west).
  The land sloped downward from row 16 to row 1.  Plot yields were
  converted to tonnes per hectare.

  Plot dimensions are not given.
}
\source{
  Durban, Maria and Hackett, Christine and McNicol, James and
  Newton, Adrian and Thomas, William and Currie, Iain. 2003.
  The practical use of semiparametric models in field trials,
  \emph{Journal of Agric Biological and Envir Stats}, 8, 48-66.
  http://doi.org/10.1198/1085711031265
  
  Retrieved from: ftp://ftp.bioss.sari.ac.uk/pub/maria

  Used with permission of Maria Durban.
}

\examples{

data(durban.rowcol)
dat <- durban.rowcol

if(require(desplot)){
  desplot(yield~bed*row, dat,
          out1=rep, num=gen, # aspect unknown
          main="durban.rowcol")
}

# Durban 2003 Figure 1
m10 <- lm(yield~gen, data=dat)
dat$resid <- m10$resid
## require(lattice)
## xyplot(resid~row, dat, type=c('p','smooth'), main="durban.rowcol")
## xyplot(resid~bed, dat, type=c('p','smooth'), main="durban.rowcol")

# Figure 3
if(require(lattice)){
  xyplot(resid ~ bed|factor(row), data=dat,
         main="durban.rowcol",
         type=c('p','smooth'))
}

# ----------------------------------------------------------------------------

\dontrun{
  # Figure 5 - field trend
  # note, Durban used gam package like this
  # m1lo <- gam(yield ~ gen + lo(row, span=10/16) + lo(bed, span=9/34), data=dat)
  require(mgcv)
  m1lo <- gam(yield ~ gen + s(row) + s(bed, k=5), data=dat)
  new1 <- expand.grid(row=unique(dat$row),bed=unique(dat$bed))
  new1 <- cbind(new1, gen="G001")
  p1lo <- predict(m1lo, newdata=new1)
  require(lattice)
  wireframe(p1lo~row+bed, new1, aspect=c(1,.5), main="Field trend") # Figure 5
}

# ----------------------------------------------------------------------------

\dontrun{
  # Figure 7 - variograms
  
  # asreml3
  require(asreml)
  dat <- transform(dat, rowf=factor(row), bedf=factor(bed))
  dat <- dat[order(dat$rowf, dat$bedf),]

  m1a1 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
                 random=~spl(rowf) + spl(bedf) + units,
                 family=asreml.gaussian(dispersion=1))
  m1a2 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
                 random=~spl(rowf) + spl(bedf) + units, rcov=~ar1(rowf):ar1(bedf))
  m1a3 <- asreml(yield~gen, data=dat, random=~units, rcov=~ar1(rowf):ar1(bedf))

  require(lattice)
  v7a <- asreml.variogram(x=dat$bedf, y=dat$rowf, z=m1a3$residuals)
  wireframe(gamma ~ x*y, v7a, aspect=c(1,.5)) # Fig 7a
  
  v7b <- asreml.variogram(x=dat$bedf, y=dat$rowf, z=m1a2$residuals)
  wireframe(gamma ~ x*y, v7b, aspect=c(1,.5)) # Fig 7b
  
  v7c <- asreml.variogram(x=dat$bedf, y=dat$rowf, z=m1lo$residuals)
  wireframe(gamma ~ x*y, v7c, aspect=c(1,.5)) # Fig 7c

}

# ----------------------------------------------------------------------------

\dontrun{
  ## require(asreml4)
  ## dat <- transform(dat, rowf=factor(row), bedf=factor(bed))
  ## dat <- dat[order(dat$rowf, dat$bedf),]

  ## m1a1 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
  ##                random=~spl(rowf) + spl(bedf) + units,
  ##                family=asr_gaussian(dispersion=1))
  ## m1a2 <- asreml(yield~gen + lin(rowf) + lin(bedf), data=dat,
  ##                random=~spl(rowf) + spl(bedf) + units,
  ##                resid = ~ar1(rowf):ar1(bedf))
  ## m1a2 <- update(m1a2)
  ## m1a3 <- asreml(yield~gen, data=dat, random=~units,
  ##                resid = ~ar1(rowf):ar1(bedf))

  ## # Figure 7
  ## require(lattice)
  ## v7a <- asr_varioGram(x=dat$bedf, y=dat$rowf, z=m1a3$residuals)
  ## wireframe(gamma ~ x*y, v7a, aspect=c(1,.5)) # Fig 7a
  
  ## v7b <- asr_varioGram(x=dat$bedf, y=dat$rowf, z=m1a2$residuals)
  ## wireframe(gamma ~ x*y, v7b, aspect=c(1,.5)) # Fig 7b
  
  ## v7c <- asr_varioGram(x=dat$bedf, y=dat$rowf, z=m1lo$residuals)
  ## wireframe(gamma ~ x*y, v7c, aspect=c(1,.5)) # Fig 7c
}

}

