\name{usgs.herbicides}
\alias{usgs.herbicides}
\docType{data}
\title{
  Concentrations of herbicides in streams in the United States
}
\description{
  Concentrations of selected herbicides and degradation products
  determined by laboratory method analysis code GCS for water samples
  collected from 51 streams in nine Midwestern States,2002
}
\usage{data("usgs.herbicides")}
\format{
  A data frame with 184 observations on the following 19 variables.
  \describe{
    \item{\code{mapnum}}{map number}
    \item{\code{usgsid}}{USGS ID}
    \item{\code{long}}{longitude}
    \item{\code{lat}}{latitude}
    \item{\code{site}}{site name}
    \item{\code{city}}{city}
    \item{\code{sampletype}}{sample type code}
    \item{\code{date}}{date sample was collected}
    \item{\code{hour}}{hour sample was collected}
    \item{\code{acetochlor}}{concentration as character}
    \item{\code{alachlor}}{concentration as character}
    \item{\code{ametryn}}{concentration as character}
    \item{\code{atrazine}}{concentration as character}
    \item{\code{CIAT}}{concentration as character}
    \item{\code{CEAT}}{concentration as character}
    \item{\code{cyanazine}}{concentration as character}
    \item{\code{CAM}}{concentration as character}
    \item{\code{dimethenamid}}{concentration as character}
    \item{\code{flufenacet}}{concentration as character}
  }
}
\details{
  
Concentrations of selected herbicides and degradation products determined by laboratory method analysis code GCS for water samples collected from 51 streams in nine Midwestern States, 2002.

All concentrations are micrograms/liter, "<" means "less than". The data are in character format to allow for "<".

The original report contains data for more herbicides. This data is for illustrative purposes.

Sample types: CR = concurrent replicate sample, FB = field blank, LD = laboratory duplicate, S1 = sample from pre-emergence runoff, S2 = sample from post-emergence runoff, S3 = sample from harvest-season runoff.

}

\source{
  Scribner, E.A., Battaglin, W.A., Dietze, J.E., and Thurman, E.M.,
  "Reconnaissance Data for Glyphosate, Other Selected Herbicides, their Degradation Products, and Antibiotics in 51 streams in Nine Midwestern States, 2002".
  U.S. Geological Survey Open File Report 03-217.
  Herbicide data from table 5, page 30-37. Site coordinates page 7-8.
  https://ks.water.usgs.gov/pubs/reports/ofr.03-217.html
}
\references{
  None.
}

\examples{
data(usgs.herbicides)
dat <- usgs.herbicides

\dontrun{

  require("NADA")
  # create censored data for one trait
  dat$y <- as.numeric(dat$atrazine)
  dat$ycen <- is.na(dat$y)
  dat$y[is.na(dat$y)] <- .05
  
  # percent censored
  with(dat, censummary(y, censored=ycen))
  # median/mean
  with(dat, cenmle(y, ycen, dist="lognormal"))
  # boxplot
  with(dat, cenboxplot(obs=y, cen=ycen, log=FALSE))
  # with(dat, boxplot(y))
  pp <- with(dat, ros(obs=y, censored=ycen, forwardT="log")) # default lognormal
  plot(pp)
}

if(require("NADA")){
  plotfun <- function(vv){
    dat$y <- as.numeric(dat[[vv]])
    dat$ycen <- is.na(dat$y)
    dat$y[is.na(dat$y)] <- .01
    # qqnorm(log(dat$y), main=vv) # ordinary qq plot shows censored values
    pp <- with(dat, ros(obs=y, censored=ycen, forwardT="log"))
    plot(pp, main=vv) # omits censored values
  }
  op <- par(mfrow=c(3,3))
  vnames <- c("acetochlor", "alachlor", "ametryn", "atrazine","CIAT", "CEAT", "cyanazine", #"CAM",
              "dimethenamid", "flufenacet")
  for(vv in vnames) plotfun(vv)
  par(op)
}

}
\keyword{datasets}
