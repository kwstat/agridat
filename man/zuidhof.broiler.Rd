\name{zuidhof.broiler}
\alias{zuidhof.broiler}
\docType{data}
\title{
  Daily weight, feed, egg measurements for a broiler
}
\description{
  Daily weight, feed, egg measurements for a broiler
}

\format{
  A data frame with 59 observations on the following 6 variables.
  \describe{
    \item{\code{bw}}{Body weight, grams}
    \item{\code{targetbw}}{Target body weight, grams}
    \item{\code{adfi}}{Average daily feed intake, grams}
    \item{\code{adg}}{Average daily gain, grams}
    \item{\code{eggwt}}{Egg weight, grams}
    \item{\code{age}}{Age, days}
  }
}
\details{
  Using graphs like the one in the examples section, the authors
  discovered that a drop in body weight commonly occurs around the time
  of first egg production.
}
\source{
  Martin J. Zuidhof and Robert A. Renema and Frank E. Robinson, (2008).
  Understanding Multiple, Repeated Animal Measurements with the Help of
  PROC GPLOT.  SAS Global Forum 2008, Paper 250-2008.

  Used with permission of Martin Zuidhof.
}

\examples{

data(zuidhof.broiler)
dat <- zuidhof.broiler

dat <- transform(dat, age=age/7) # Change days into weeks

# Reproducing figure 1 of Zuidhof et al.

# Plot using left axis
op <- par(mar=c(5,4,4,4))
plot(bw~age, dat, xlab="Age (weeks)", ylab="Bodyweight (g)",
     main="zuidhof.broiler",
     xlim=c(20,32), ylim=c(0,4000), pch=20)
lines(targetbw~age, subset(dat, !is.na(targetbw)), col="black")

# Now plot using the right axis
par(new=TRUE)
plot(adfi~age, subset(dat, !is.na(adfi)),
     xlab="", ylab="", xlim=c(20,32), xaxt="n",yaxt="n",
     ylim=c(-50,175), type="s", lty=2)
axis(4, at=c(-50,-25,0,25,50,75,100,125,150,175), col="red", col.axis="red")
mtext("Weight (g)", side=4, line=2, col="red")
lines(adg~age, subset(dat, !is.na(adg)), col="red", type="s", lty=1, lwd=2)
abline(h=c(0,52), col="red")
with(dat, segments(age, 0, age, eggwt, col="red"))

legend(20, -40, c("Body weight", "Target BW", "Feed/day", "Gain/day", "Egg wt"),
       bty="n", cex=.5, ncol=5,
       col=c("black","black","red","red","red"),
       lty=c(-1,1,2,1,1), lwd=c(1,1,1,2,1), pch=c(20,-1,-1,-1,-1))
par(op)
}
\keyword{datasets}
