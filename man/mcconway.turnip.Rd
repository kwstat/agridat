\name{mcconway.turnip}
\alias{mcconway.turnip}
\docType{data}
\title{
  Yields of turnips grown for winter fodder
}
\description{
  Yields of turnips grown for winter fodder with two treatments for
  planting date and density, planted as RCB.
}

\format{
  A data frame with 64 observations on the following 6 variables.
  \describe{
    \item{\code{gen}}{Genotype factor}
    \item{\code{date}}{Planting date factor, levels \code{21Aug1990} \code{28Aug1990}}
    \item{\code{density}}{Planting density, 1, 2, 4, 8 kg/ha}
    \item{\code{block}}{Block factor, 4 levels}
    \item{\code{yield}}{Yield}
  }
}
\details{
  This is a randomized block experiment with 16 treatments
  allocated at random to each of four blocks.  The 16 treatments
  were combinations of two varieties, two planting dates, and
  four densities.

  Lee et al (2008) proposed an anlysis using mixed models with changing
  treatment variances.

  Piepho (2009) proposed an ordinary ANOVA using transformed data.
}
\source{
  Statistical Modelling Using Genstat, K. J. McConway, M. C. Jones,
  P. C. Taylor.

  Used with permission of Kevin McConway.
}
\references{
  Michael Berthold, D. J. Hand.
  \emph{Intelligent data analysis: an introduction}, 1998.
  Pages 75--82.

  Lee, C.J. and O Donnell, M. and O Neill, M. (2008).
  Statistical analysis of field trials with changing treatment
  variance. \emph{Agronomy Journal}, 100, 484--489.

  Piepho, H.P. (2009),
  Data transformation in statistical analysis of field trials
  with changing treatment variance.
  \emph{Agronomy Journal}, 101, 865--869.
}
\examples{

dat <- mcconway.turnip
dat$densf <- factor(dat$density)

# Table 2 of Lee et al.
m0 <- aov( yield ~ gen * densf * date + block, dat )
summary(m0)

# Boxplots suggest heteroskedasticity for date, density
# require("HH")
# interaction2wt(yield ~ gen + date + densf +block, dat)

require(nlme)
# Random block model
m1 <- lme(yield ~ gen * date * densf, random= ~1|block, data=dat)
summary(m1)
anova(m1)

# Multiplicative variance model over densities and dates
m2 <- update(m1,
             weights=varComb(varIdent(form=~1|densf),
               varIdent(form=~1|date)))
summary(m2)
anova(m2)

# Unstructured variance model over densities and dates
m3 <- update(m1, weights=varIdent(form=~1|densf*date))
summary(m3)
anova(m3)

# Table 3 of Piepho, using transformation
m4 <- aov( yield^.235 ~ gen * date * densf + block, dat )
summary(m4)

}

