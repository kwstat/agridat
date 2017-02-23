\name{battese.survey}
\alias{battese.survey}
\docType{data}
\title{
  Survey and satellite data for corn and soy areas in Iowa
}
\description{
  Survey and satellite data for corn and soy areas in Iowa
}
\usage{data("battese.survey")}
\format{
  A data frame with 37 observations on the following 9 variables.
  \describe{
    \item{\code{county}}{county name}
    \item{\code{segment}}{sample segment number (within county)}
    \item{\code{countysegs}}{number of segments in county}
    \item{\code{cornhect}}{hectares of corn in segment}
    \item{\code{soyhect}}{hectares of soy}
    \item{\code{cornpix}}{pixels of corn in segment}
    \item{\code{soypix}}{pixels of soy}
    \item{\code{cornmean}}{county mean of corn pixels per segment}
    \item{\code{soymean}}{county mean of soy pixels per segment}
  }
}
\details{
  The data are for 12 counties in north-central Iowa in 1978.

  The USDA determined the area of soybeans in 37 area sampling units
  (called 'segments').  Each segment is about one square mile (about 259
  hectares).  The number of pixels of that were classified as corn and
  soybeans came from Landsat images obtained in Aug/Sep 1978. Each pixel
  represents approximately 0.45 hectares.

  Data originally compiled by USDA.
  
  This data is also available in R packages: 'rsae::landsat' and 'JoSAE::landsat'.
}
\source{
  Battese, George E and Harter, Rachel M and Fuller, Wayne A. (1988).
  An error-components model for prediction of county crop areas using
  survey and satellite data.
  emph{Journal of the American Statistical Association}, 83, 28-36.
  http://doi.org/10.2307/2288915

  Battese (1982) preprint version.
  http://www.une.edu.au/__data/assets/pdf_file/0017/15542/emetwp15.pdf
  
}
\references{
  Pushpal K Mukhopadhyay and Allen McDowell. (2011).
  Small Area Estimation for Survey Data Analysis Using SAS Software
  SAS Global Forum 2011.  
}
\examples{
data(battese.survey)
dat <- battese.survey

# Battese fig 1 & 2.  Corn plot shows outlier in Hardin county
library("lattice")
dat <- dat[order(dat$cornpix),]
xyplot(cornhect ~ cornpix, data=dat, group=county, type=c('p','l'),
       main="battese.survey", xlab="Pixels of corn", ylab="Hectares of corn",
       auto.key=list(columns=3))
if(0){
  dat <- dat[order(dat$soypix),]
  xyplot(soyhect ~ soypix, data=dat, group=county, type=c('p','l'),
         main="battese.survey", xlab="Pixels of soy", ylab="Hectares of soy",
         auto.key=list(columns=3))
}

if(require("lme4") & require("lucid")){

  # Fit the models of Battese 1982, p.18.  Results match
  m1 <- lmer(cornhect ~ 1 + cornpix + (1|county), data=dat)
  fixef(m1)
  vc(m1)
  m2 <- lmer(soyhect ~ 1 + soypix + (1|county), data=dat)
  fixef(m2)
  vc(m2)

  # Predict for Humboldt county as in Battese 1982 table 2
  5.4662+.3878*290.74
  # 118.2152 # mu_i^0
  5.4662+.3878*290.74+ -2.8744
  # 115.3408 # mu_i^gamma
  (185.35+116.43)/2
  # 150.89 # y_i bar

  # Survey regression estimator of Battese 1988
  
  # Delete the outlier
  dat2 <- subset(dat, !(county=="Hardin" & soyhect < 30))
  
  # Results match top-right of Battese 1988, p. 33
  m3 <- lmer(cornhect ~ cornpix + soypix + (1|county), data=dat2)
  fixef(m3)
  vc(m3)
  m4 <- lmer(soyhect ~ cornpix + soypix + (1|county), data=dat2)
  fixef(m4)
  vc(m4)
}
}
\keyword{datasets}
