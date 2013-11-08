\name{lavoranti.eucalyptus}
\alias{lavoranti.eucalyptus}
\docType{data}
\title{
  Height of Eucalyptus trees in southern Brazil
}
\description{
  Height of Eucalyptus trees in southern Brazil
}

\format{
  A data frame with 490 observations on the following 4 variables.
  \describe{
    \item{\code{gen}}{Genotype (progeny) factor}
    \item{\code{origin}}{Origin of progeny}
    \item{\code{loc}}{Location factor}
    \item{\code{height}}{Height, meters}
  }
}
\details{
  The genotypes originated from three different locations in Queensland,
  Australia, and were tested in southern Brazil.  The experiment was
  conducted as a randomized complete block design with 6 plants per plot
  and 10 blocks.  Mean tree height is reported.

  The testing locations are described in the following table:
  \tabular{lllllllll}{
    Loc	\tab City \tab Lat (S) \tab Long (W) \tab Altitude \tab Avg min temp \tab Avg max temp \tab Avg temp (C) \tab Precip (mm)\cr
    L1 \tab Barra Ribeiro, RS \tab 30.33 \tab 51.23 \tab 30 \tab 9 \tab 25 \tab 19 \tab 1400\cr
    L2 \tab Telemaco Borba, PR \tab 24.25 \tab 20.48 \tab 850 \tab 11 \tab 26 \tab 19 \tab 1480\cr
    L3 \tab Boa Experanca de Sul, SP \tab 21.95 \tab 48.53 \tab 540 \tab 15 \tab 23 \tab 21 \tab 1300\cr
    L4 \tab Guanhaes, MG \tab 18.66 \tab 43 \tab 900 \tab 14 \tab 24 \tab 19 \tab 1600\cr
    L5 \tab Ipatinga, MG \tab 19.25 \tab 42.33 \tab 250 \tab 15 \tab 24 \tab 22 \tab 1250\cr
    L6 \tab Aracruz, ES \tab 19.8 \tab 40.28 \tab 50 \tab 15 \tab 26 \tab 24 \tab 1360\cr
    L7 \tab Cacapva, SP \tab 23.05 \tab 45.76 \tab 650 \tab 14 \tab 24 \tab 20 \tab 1260
  }

  Arciniegas-Alarcon (2010) used the 'Ravenshoe' subset of the data to
  illustrate imputation of missing values.
}
\source{
  O J Lavoranti (2003). Estabilidade e adaptabilidade fenotipica
  atraves da reamostragem bootstrap no modelo AMMI, PhD thesis,
  University of Sao Paulo, Brazil.
}
\references{
  Arciniegas-Alarcon, S. and Garcia-Pena, M. and dos Santos Dias,
  C.T. and Krzanowski, W.J. (2010). An alternative methodology for
  imputing missing data in trials with genotype-by-environment
  interaction, \emph{Biometrical Letters}, 47, 1--14.
}
\examples{

# Arciniegas-Alarcon et al use SVD and regression to estimate missing values.
# Partition the matrix X as a missing value xm, row vector xr1, column
# vector xc1, and submatrix X11
# X = [ xm  xr1 ]
#     [ xc1 X11 ] and let X11 = UDV'.
# Estimate the missing value xm = xr1 V D^{-1} U' xc1

dat <- lavoranti.eucalyptus
dat <- droplevels(subset(dat, origin=="Ravenshoe"))
dat <- acast(dat, gen~loc, value.var="height")

dat[1,1] <- NA
x11 <- dat[-1,][,-1]
X11.svd <- svd(x11)
xc1 <- dat[-1,][,1]
xr1 <- dat[,-1][1,]
xm <- xr1 %*% X11.svd$v %*% diag(1/X11.svd$d) %*% t(X11.svd$u) %*% xc1
xm # = 18.29, Original value was 17.4
}
\keyword{datasets}
