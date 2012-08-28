\name{ivins.herbs}
\alias{ivins.herbs}
\docType{data}
\title{
  Percent ground cover of herbage species and nettles.
}
\description{
  Percent ground cover of herbage species and nettles.  
}
\usage{data(ivins.herbs)}
\format{
  A data frame with 78 observations on the following 4 variables.
  \describe{
    \item{\code{block}}{Block factor, 6 levels}
    \item{\code{gen}}{Genotype factor, 13 levels}
    \item{\code{nettle}}{Percent ground cover of nettles}
    \item{\code{herb}}{Percent ground cover of herbage species}
  }
}

\details{
  On the University of Nottingham farm, 13 different strains and species
  of herbage plants were sown on about 4 acres in an RCB design.  Each
  grass species was sown together with white clover seed.
  
  During establishment of the herbage plants, it became apparent that
  \emph{Urtica dioica} (nettle) became established according to the
  particular herbage plant in each plot.  In particular, nettle became
  established in plots sown with leguminous species and the two grass
  species.  The graminaceous plots had less nettles.

  The data here are the percentage ground cover of nettle and herbage
  plants in September 1951.
  
  Note, some of the percent ground cover amounts were originally
  reported as 'trace'. These have been arbitrarily set to 0.1 in this
  data.
  
  \tabular{lll}{
    gen \tab species \tab strain \cr
    G01 \tab lolium perenne      \tab Irish perennial ryegrass \cr
    G02 \tab L. perenne          \tab S. 23 perennial ryegrass \cr
    G03 \tab Dactylis glomerata  \tab Danish cocksfoot \cr
    G04 \tab D. glomerata        \tab S. 143 cocksfoot \cr
    G05 \tab Phleum pratense     \tab American timothy \cr
    G06 \tab P. pratense         \tab S. 48 timothy \cr
    G07 \tab Festuca pratensis   \tab S. 215 meadow fescue \cr
    G08 \tab Poa trivialis       \tab Danish rough stalked meadow grass \cr
    G09 \tab Cynosurus cristatus \tab New Zealand crested dogstail \cr
    G10 \tab Trifolium pratense  \tab Montgomery late red clover \cr
    G11 \tab Medicago lupulina   \tab Commercial black medick \cr
    G12 \tab Trifolium repens    \tab S. 100 white clover \cr
    G13 \tab Plantago lanceolata \tab Commercial ribwort plantain
  }
}

\source{
  Ivins, JD. (1952). Concerning the Ecology of Urtica Dioica L.,
  \emph{Journal of Ecology}, 40, 380-382.
}

\references{
  Ivins, JD (1950). Weeds in relation to the establishment of the Ley.
  \emph{Grass and Forage Science}, 5, 237--242.

  O'Gorman, T.W. (2001). A comparison of the F-test, Friedman's test,
  and several aligned rank tests for the analysis of randomized complete
  blocks, \emph{Journal of agricultural, biological, and environmental
    statistics}, 6, 367--378.
}

\examples{
dat <- ivins.herbs

xyplot(herb~nettle|block, dat) # Nettle is primarily established in legumes.

# O'Brien used first 7 species to test gen differences
dat7 <- droplevels(subset(dat, is.element(gen, c('G01','G02','G03','G04','G05','G06','G07'))))
m1 <- lm(herb ~ gen + block, data=dat7)
anova(m1) # gen p-value is .041
friedman.test(herb ~ gen|block, dat7) # gen p-value .056

}
\keyword{datasets}
