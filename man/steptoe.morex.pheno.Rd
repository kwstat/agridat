\name{steptoe.morex.pheno}
\alias{steptoe.morex.pheno}
\alias{steptoe.morex.geno}
\docType{data}
\title{
  Multi-environment trial of barley, phenotypic and genotypic data for a population of Steptoe x Morex
}
\description{
    Phenotypic and genotypic data for a barley population of Steptoe x
    Morex.  There were 150 doubled haploid crosses, evaluated at 223
    markers.  Phenotypic data wascollected on 8 traits at 16 environments.
}
\usage{data("steptoe.morex.pheno")}

\format{

  \code{steptoe.morex.pheno} is a data.frame of phenotypic data
  with 2432 observations on 10 variables:
  \describe{
    \item{\code{gen}}{genotype factor with parents Steptoe and Morex,
      and 150 crosses SM1, SM2, ..., SM200. Not all 200 numbers were used.}
    \item{\code{env}}{environment factor, 16 levels}
    \item{\code{amylase}}{Alpha Amylase (20 Deg Units)}
    \item{\code{diapow}}{Diastatic Power (Deg Units)}
    \item{\code{hddate}}{Heading Date (Julian Days)}
    \item{\code{lodging}}{Lodging (percent)}
    \item{\code{malt}}{Malt Extract (percent)}
    \item{\code{height}}{Plant Height (Centimeters)}
    \item{\code{protein}}{Grain Protein (percent)}
    \item{\code{yield}}{Grain Yield (Mt/Ha)}
  }

  \code{steptoe.morex.geno} is a \code{cross} object from the
  \code{qtl} package with genotypic data of the 223
  markers for the 150 crosses of Steptoe x Morex.

}
\details{

As described by Hayes et al (1993), a population of 150 barley doubled
haploid (DH) lines was developed by the Oregon State University Barley
Breeding Program for the North American Barley Genome Mapping
Project. The parentage of the population is Steptoe / Morex.

Steptoe is the dominant feed barley in the northwestern U.S.

Morex is the spring U.S. malting quality standard.

Seed from a single head of each parent was used to create the F1, from which a
set of 150 lines was developed.

Phenotypic values for the parents Steptoe and Morex are here:
http://wheat.pw.usda.gov/ggpages/SxM/parental_values.html

There are 16 locations, The average across locations is in column 17.  Not all
traits were collected at every location.  At each location, all 150 lines were
included in block 1, a random subset of 50 lines was used in block 2.

The traits are:
Alpha Amylase (20 Deg Units),
Diastatic Power (Deg Units),
Heading Date (Julian Days),
Lodging (percent),
Malt Extract (percent),
Grain Protein (percent),
Grain Yield (Mt/Ha).

Phenotypic values of the 150 lines in the F1 population are here:
http://wheat.pw.usda.gov/ggpages/SxM/phenotypes.html

Each trait is in a different file, in which each block of numbers represents
one location.

The 223-markers Steptoe/Morex base map is here:
http://wheat.pw.usda.gov/ggpages/SxM/smbasev2.map
.
The data for these markers on the 150 lines is
http://wheat.pw.usda.gov/ggpages/SxM/smbasev2.mrk

These were hand-assembled (e.g. marker distances were
cumulated to marker positions) into a .csv file which was then imported into
R using \code{qtl::read.cross}.  The class was manually changed from
c('bc','cross') to c('dh','cross').

The marker data is coded as A = Steptoe, B = Morex, - = missing.

The pedigrees for the 150 lines are found here:
http://wheat.pw.usda.gov/ggpages/SxM/pedigrees.html

}

\source{
  The phenotypic, genotypic, pedigree, etc information can be found from
  various pages found at the following site:

  The Steptoe x Morex Barley Mapping Population.
  Map: Version 2, August 1, 1995
  http://wheat.pw.usda.gov/ggpages/SxM.  Accessed Jan 2015.

  Data provided by the United States Department of Agriculture.
}

\references{

  P.M. Hayes, B.H. Liu, S.J. Knapp, F. Chen, B. Jones, T. Blake,
  J. Franckowiak, D. Rasmusson, M. Sorrells, S.E. Ullrich, and others. 1993.
  Quantitative trait locus effects and environmental interaction in a sample of
  North American barley germplasm.
  \emph{Theoretical and Applied Genetics}, 87, 392--401.
  http://doi.org/10.1007/BF01184929

  Ignacio Romagosa, Steven E. Ullrich, Feng Han, Patrick M. Hayes. 1996.
  Use of the additive main effects and multiplicative interaction model
  in QTL mapping for adaptation in barley.
  \emph{Theor Appl Genet}, 93, 30-37.
  http://doi.org/10.1007/BF00225723

  Piepho, Hans-Peter. 2000.
  A mixed-model approach to mapping quantitative trait loci in barley on
  the basis of multiple environment data.
  \emph{Genetics}, 156, 2043-2050.

  M. Malosetti, J. Voltas, I. Romagosa, S.E. Ullrich, F.A. van Eeuwijk. (2004).
  Mixed models including environmental covariables for studying QTL by
  environment interaction.
  \emph{Euphytica}, 137, 139-145.
  http://doi.org/10.1023/B:EUPH.0000040511.4638

}

\examples{

data(steptoe.morex.pheno)
dat <- steptoe.morex.pheno

\dontrun{
  # Visualize GxE of traits
  require(lattice)
  levelplot(amylase~env*gen, data=dat, scales=list(x=list(rot=90)), main="amylase")
  levelplot(diapow~env*gen, data=dat, scales=list(x=list(rot=90)), main="diapow")
  levelplot(hddate~env*gen, data=dat, scales=list(x=list(rot=90)), main="hddate")
  levelplot(lodging~env*gen, data=dat, scales=list(x=list(rot=90)), main="lodging")
  levelplot(malt~env*gen, data=dat, scales=list(x=list(rot=90)), main="malt")
  levelplot(height~env*gen, data=dat, scales=list(x=list(rot=90)), main="height")
  levelplot(protein~env*gen, data=dat, scales=list(x=list(rot=90)), main="protein")
  levelplot(yield~env*gen, data=dat, scales=list(x=list(rot=90)), main="yield")
}

# Calculate avg yield for each loc as in Romagosa 1996, table 3
t(t(round(tapply(dat$yield, dat$env, FUN=mean),2)))
# SKo92,SKg92 means in table 3 are switched.  Who is right, him or me?

# Draw marker map
if(require(qtl)){
  data(steptoe.morex.geno)
  datg <- steptoe.morex.geno
  plot.map(datg, main="steptoe.morex.pheno")  # or just use plot()
}

\dontrun{
  # This is a very rudimentary example.

# Fit a simple multi-environment mixed model
require(asreml)
m1 <- asreml(yield ~ env, data=dat, random=~gen)

require(wgaim)
plotMissing(datg)
link.map(datg)
# Create an interval object for wgaim
class(datg)[1] <- "bc"
dati <- cross2int(datg, id="gen")

  # Whole genome qtl
  assign("dat", dat, 1) # Needed for wgaim in script mode
q1 <- wgaim(m1, dat, dati, merge.by="gen", na.method.X='include')
link.map(q1, dati) # Visualize
out.stat(q1, dati) # outlier statistic
summary(q1, dati)  # Table of important intervals
# Chrom Left Marker dist(cM) Right Marker dist(cM)   Size Pvalue % Var
#     3      ABG399     52.6       BCD828     56.1  0.254  0.000  45.0
#     5      MWG912      148      ABG387A    151.2  0.092  0.001   5.9
#     6     ABC169B     64.8       CDO497     67.5 -0.089  0.001   5.6

}
}
\keyword{datasets}
