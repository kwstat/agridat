# usgs.herbicides.R

Methods:
http://bvcentre.ca/research/project/below_the_method_detection_limit_problems_definitions_data_and_solutions

# ----------------------------------------------------------------------------

library(readxl)
library(readr)

dat <- read_csv("c:/x/usgs.herbicides.csv")
class(dat) <- "data.frame"
dat <- data.frame(dat)
str(dat)


dat2 <- read_excel("c:/x/usgs.herbicides.xlsx", "sites")
usgs.herbicides.sites <- dat2[,1:8]
with(usgs.herbicides.sites,plot(long,lat))

dat$long <- lookup(dat$usgsid, dat2$usgsid, dat2$long)
dat$lat <- lookup(dat$usgsid, dat2$usgsid, dat2$lat)

dat <- dat[,c(1:2,18:19,3:17)]

usgs.herbicides <- dat
agex(usgs.herbicides)

# ----------------------------------------------------------------------------

dat <- usgs.herbicides


dat$atrazine
# create censored data
dat$y <- as.numeric(dat$atrazine)
dat$ycen <- is.na(dat$y)
dat$y[is.na(dat$y)] <- .01

if(require(ggplot2)){
  ggplot(dat, aes(y)) +
    geom_dotplot() +
    theme_bw() +
    facet_wrap(~ ycen, ncol=1) + scale_x_continuous(trans="log") +
    labs(title="usgs.herbicides", x="log concentration", y="count",
         caption="TRUE are censored <0.05, FALSE are not censored")
}

stripchart(log(dat$y), method="stack", pch=1, col="black")
with(subset(dat, ycen), stripchart(log(y), method="stack", add=TRUE, pch=1, col="red"))

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
