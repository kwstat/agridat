\name{minnesota.barley.yield}
\alias{minnesota.barley.yield}
\docType{data}
\title{
  Multi-environment trial of barley in Minnesota at 6 sites in 1927-1936.
}
\description{
  These data come from barley breeding experiments conducted in
  Minnesota during the years 1893-1942.
  During the early years, the experiments were conducted only at StPaul.
  By the late 1920s, the experiments had expanded to 6 sites across the
  state.  
}

\format{
  A data frame with 647 observations on the following 4 variables.
  \describe{
    \item{\code{site}}{site factor, 6 levels}
    \item{\code{gen_name}}{genotype name}
    \item{\code{gen}}{genotype (CI cereal introduction ID)}
    \item{\code{year}}{year}
    \item{\code{yield}}{yield in bu/ac}
  }
}
\details{

  The \code{lattice} package contains a smaller version of this data for
  the years 1931 and 1932.
  
  This is an expanded version of the barley data that is often
  used to illustrate dot plots.
  
  The following comments are in reference to the mentioned source
  documents.

  
  ----- Notes about Immer (1934) -----

  The University Farm location is at Saint Paul.

  This source provides the yield data for each of the three blocks at
  each location in 1931 and 1932.  The following registration numbers
  and names are given:

  \tabular{ll}{
    C.I. number \tab Variety name \cr
    Minn 184 \tab  Manchuria \cr
    Minn 445 \tab  Glabron \cr
    Minn 440 \tab  Svansota \cr
    Minn 447 \tab  Velvet \cr
    Minn 448 \tab  Trebi \cr
    Minn 457 \tab  Manchuria x Smooth Awn \cr
    Minn 462 \tab  Smooth Awn x Manchuria \cr
    Minn 452 \tab  Peatland \cr
    Minn 475 \tab  Svanhals x Lion \cr
    Minn 529 \tab  Wisconsin No 38 \cr
  }

  
  ----- Notes from Harlan et al (1925) -----

  The data from these early tests are accurate at some stations, but may
  have problems at other stations. (p. 14).

  Identification of many varieties is inadequate...the chance of their
  being incorrectly identified is small...Officials of the StPaul
  station have expressed a desire that conclusions be drawn from the
  yields only when the limitations of the earlier experiments are taken
  into full consideration. (p. 72)
  
  The Chevalier and Hanna varieties are not well adapted for StPaul
  (p. 73).

  
  ----- Notes from Harlan et al (1929) -----

  
  ----- Notes from Harlan et al (1935) -----

  The 1931 yields match the average values of Immer (1934).

  The Minnesota 474 and 475 cultivars are both 'Svanhals x Lion' crosses.

  No yields are reported at Crookston in 1928 because of a crop failure. (Page 20)

  Also, in the report for North Dakota it says
  "the zero yields at Williston, ND in 1931 were caused by drought". (Page 31)

  
  ----- Notes from Wiebe et al (1935) -----

  
  ----- Notes from Wiebe et al (1940) -----

  The 1932 data generally match the average values from Immer (1934)
  with the following notes.

  The data for Glabron at St Paul in 1932 are missing, but given as 36.8
  in Immer (1934).  This value is treated as missing in this R dataset.

  The data for Svansota at Morris in 1932 are missing, but given as 35.0
  in Immer (1934).  This value is treated as missing in this R dataset.

  The yield for 'Wisconsin 38' at St Paul in 1932 is shown as 3.80, but
  38 in Immer (1934).  The latter value is used in this R dataset.

  The yields for No475 in 1932 are not reported in Wiebe (1940), but are
  reported in Immer (1934).

  No yields are reported at Morris in 1933 and 1934, because of a crop
  failure owing to drought.

  
  ----- Notes from Hayes (1942) -----

  This source gives the block-level yield data for 5 cultivars at 4
  sites in 1932 and 1935.  Cultivar 'Barbless' is the same as 'Wisconsin
  No38'.

}

\source{

  Harry V. Harlan and Mary L. Martini and Merrit N. Pope (1925).
  Tests of barley varieties in America.
  United States Department of Agriculture, Department Bulletin 1334.
  https://archive.org/details/testsofbarleyvar1334harl
  
  H. V. Harlan and L. H. Newman and Mary L. Martini (1929).
  Yields of barley in the United States and Canada 1922-1926.
  United States Department of Agriculture, Technical Bulletin 96.
  https://handle.nal.usda.gov/10113/CAT86200091
  http://dx.doi.org/10.22004/ag.econ.156681
    
  Harlan, H. V. and Philip Russell Cowan and Lucille Reinbach. (1935).
  Yields of barley in the United States and Canada 1927-1931.
  United States Dept of Agriculture, Technical Bulletin 446.
  https://naldc.nal.usda.gov/download/CAT86200440/PDF

  Wiebe, Gustav A. and Philip Russell Cowan, Lucille Reinbach-Welch. (1940).
  Yields of barley varieties in the United States and Canada 1932-36.
  United States Dept of Agriculture, Technical Bulletin 735.
  https://books.google.com/books?id=OUfxLocnpKkC&pg=PA19

  Wiebe, Gustav A. and Philip Russell Cowan, Lucille Reinbach-Welch. (1944).
  Yields of barley varieties in the United States and Canada, 1937-41.
  United States Dept of Agriculture, Technical Bulletin 881.
  https://handle.nal.usda.gov/10113/CAT86200873
    
}

\references{
  Immer, R. F. and H. K. Hayes and LeRoy Powers. (1934).
  Statistical Determination of Barley Varietal Adaptation.
  Journal of the American Society of Agronomy, 26, 403-419.
  https://doi.org/10.2134/agronj1934.00021962002600050008x

  Hayes, H.K. and Immer, F.R. (1942).
  Methods of plant breeding.
  McGraw Hill.

  Kevin Wright. (2013).  Revisiting Immer's Barley Data.
  The American Statistitician, 67, 129-133.
  https://doi.org/10.1080/00031305.2013.801783
}
\examples{
\dontrun{

library(agridat)

data(minnesota.barley.yield)
dat <- minnesota.barley.yield
dat$yr <- factor(dat$year)

# Drop Dryland, Jeans, CompCross, MechMixture because they have less than 5
# year-loc values
dat <- subset(dat, !is.element(gen_name, c("CompCross","Dryland","Jeans","MechMixture")))
dat <- subset(dat, year >= 1927 & year <= 1936)
dat <- droplevels(dat)

# 1934 has huge swings from one loc to the next
libs(lattice)
dotplot(gen_name~yield|site, dat, groups=yr,
        main="minnesota.barley.yield",
        auto.key=list(columns=5), scales=list(y=list(cex=.5)))
}
}

\keyword{datasets}
