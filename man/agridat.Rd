\name{agridat}
\alias{agridat}
\docType{package}
\title{Datasets from agricultural experiments}
\description{
  This package contains datasets from published papers and books
  relating to agriculture, especially to field experiments.
}
\details{
  The following data are examples of uniformity trials with a single genotype.
\tabular{lll}{
name                             \tab other \tab model \cr
\link{batchelor.apple}           \tab xy \tab \cr
\link{batchelor.lemon}           \tab xy \tab \cr
\link{batchelor.navel1}          \tab xy \tab \cr
\link{batchelor.navel2}          \tab xy \tab \cr
\link{batchelor.valencia}        \tab xy \tab \cr
\link{batchelor.walnut}          \tab xy \tab \cr
\link{gomez.uniformity}          \tab xy \tab aov \cr
\link{goulden.barley}            \tab xy \tab \cr
\link{immer.sugarbeet}           \tab xy, 3 traits \tab \cr
\link{kempton.uniformity}        \tab xy \tab \cr
\link{mercer.wheat}              \tab xy, 2 traits \tab spplot \cr
\link{smith.uniformity3}         \tab xy, 3 years \tab rgl \cr
\link{williams.barley}           \tab xy \tab loess \cr
\link{williams.cotton}           \tab xy \tab loess \cr
\link{wiebe.wheat}               \tab xy \tab medianpolish, loess \cr
}

The following experiments are more complex.
Abbreviations in the 'other' column include: xy = coordinates,
pls = partial least squares, row-col = row-column design, ts = time series.

\tabular{llllllll}{
name                             \tab gen \tab loc\tab reps\tab years \tab trt \tab other \tab model \cr
\link{aastveit.barley}           \tab 15  \tab    \tab     \tab 9  \tab     \tab Yr*Gen~Yr*Trait\tab pls \cr
\link{allcroft.lodging}          \tab 32  \tab 7  \tab     \tab    \tab     \tab percent \tab tobit \cr
\link{archbold.apple}            \tab 2   \tab    \tab 5   \tab    \tab 24  \tab split-split \tab lmer \cr
\link{australia.soybean}         \tab 58  \tab 4  \tab     \tab 2  \tab     \tab 4-way, 6 traits \tab biplot \cr
\link{besag.bayesian}            \tab 75  \tab    \tab 3   \tab    \tab     \tab xy  \tab asreml \cr
\link{besag.elbatan}             \tab 50  \tab    \tab 3   \tab    \tab     \tab xy  \tab lm, gam \cr
\link{besag.met}                 \tab 64  \tab 6  \tab 3   \tab    \tab     \tab xy, incblock\tab asreml, lme \cr
\link{blackman.wheat}            \tab 12  \tab 7  \tab     \tab    \tab 2   \tab \tab biplot \cr
\link{bridges.cucumber}          \tab 4   \tab 2  \tab 4   \tab    \tab     \tab xy, latin, hetero\tab asreml \cr
\link{caribbean.maize}           \tab     \tab 17 \tab 4   \tab    \tab 3   \tab \tab \cr
\link{cochran.bib}               \tab 13  \tab 13 \tab     \tab    \tab     \tab BIB\tab aov, lme \cr
\link{cochran.crd}               \tab     \tab    \tab     \tab    \tab 7   \tab xy, crd\tab aov \cr
\link{cochran.latin}             \tab     \tab    \tab 6   \tab    \tab 6   \tab xy, latin\tab aov \cr
\link{cochran.wireworms}         \tab     \tab    \tab 5   \tab    \tab 5   \tab xy, latin\tab glm \cr
\link{corsten.interaction}       \tab 20  \tab 7  \tab     \tab    \tab     \tab \tab \cr
\link{crowder.seeds}             \tab 2   \tab    \tab 21  \tab    \tab 2   \tab \tab glm,jags \cr
\link{cox.stripsplit}            \tab     \tab    \tab  4  \tab    \tab 3,4,2 \tab \tab aov \cr
\link{darwin.maize}              \tab     \tab    \tab 12  \tab    \tab 2   \tab \tab t.test \cr
\link{denis.missing}             \tab 5   \tab 26 \tab     \tab    \tab     \tab \tab lme \cr
\link{denis.ryegrass}            \tab 21  \tab 7  \tab     \tab    \tab     \tab \tab aov \cr
\link{digby.jointregression}     \tab 10  \tab 17 \tab     \tab    \tab 4   \tab  \tab lm \cr
\link{diggle.cow}                \tab     \tab    \tab     \tab    \tab 4   \tab ts \tab \cr
\link{durban.competition}        \tab 36  \tab    \tab 3   \tab    \tab     \tab xy, competition \tab lm \cr
\link{durban.rowcol}             \tab 272 \tab    \tab 2   \tab    \tab     \tab xy \tab lm, gam, asreml \cr
\link{durban.splitplot}          \tab 70  \tab    \tab 4   \tab    \tab 2   \tab xy \tab lm, gam, asreml \cr
\link{eden.potato}               \tab     \tab    \tab 4   \tab 3  \tab 4-12 \tab xy, rcb, latin \tab aov \cr
\link{engelstad.nitro}           \tab     \tab 2  \tab     \tab 5  \tab 6   \tab \tab nls quadratic plateau \cr
\link{federer.diagcheck}         \tab 122 \tab    \tab     \tab    \tab     \tab xy \tab lm, lmer, asreml \cr
\link{federer.tobacco}           \tab     \tab    \tab 8   \tab    \tab 7   \tab xy \tab lm \cr
\link{gathmann.bt}               \tab 2   \tab    \tab 8   \tab    \tab     \tab \tab TOST \cr
\link{gauch.soy}                 \tab 7   \tab 7  \tab 4   \tab 12 \tab     \tab \tab AMMI \cr
\link{gilmour.serpentine}        \tab 108 \tab    \tab 3   \tab    \tab     \tab xy, serpentine\tab asreml \cr
\link{gilmour.slatehall}         \tab 25  \tab    \tab 6   \tab    \tab     \tab xy \tab asreml \cr
\link{gomez.fractionalfactorial} \tab     \tab    \tab 2   \tab    \tab 6   \tab xy \tab lm \cr
\link{gomez.groupsplit}          \tab 45  \tab    \tab 3   \tab    \tab 2   \tab xy, 3 gen groups \tab aov \cr
\link{gomez.multilocsplitplot}   \tab 2   \tab 3  \tab 3   \tab    \tab     \tab nitro \tab aov, lmer \cr
\link{gomez.splitsplit}          \tab 3   \tab    \tab 3   \tab    \tab     \tab xy, nitro, mgmt \tab aov, lmer \cr
\link{gomez.stripplot}           \tab 6   \tab    \tab 3   \tab    \tab     \tab xy, nitro \tab aov \cr
\link{gomez.stripsplitplot}      \tab 6   \tab    \tab 3   \tab    \tab     \tab xy, nitro\tab aov \cr
\link{graybill.heteroskedastic}  \tab 4   \tab 13 \tab     \tab    \tab     \tab hetero \tab \cr
\link{hanks.sprinkler}           \tab 3   \tab    \tab 3   \tab    \tab     \tab xy \tab asreml\cr
\link{hildebrand.systems}        \tab     \tab 14 \tab     \tab    \tab 4   \tab \tab asreml\cr
\link{hughes.grapes}             \tab     \tab    \tab 3   \tab    \tab 6   \tab binomial \tab lmer, aod, glmm\cr
\link{ilri.sheep}                \tab 4   \tab    \tab     \tab 6  \tab     \tab diallel \tab lmer, asreml \cr
\link{john.alpha}                \tab 24  \tab    \tab 3   \tab    \tab     \tab alpha \tab lm,lmer \cr
\link{kempton.competition}       \tab 36  \tab    \tab 3   \tab    \tab     \tab xy, competition \tab lme AR1 \cr
\link{kempton.rowcol}            \tab 35  \tab    \tab 2   \tab    \tab     \tab xy, row-col \tab lmer \cr
\link{kempton.slatehall}         \tab 25  \tab    \tab 6   \tab    \tab     \tab xy \tab asreml,lmer\cr
\link{mcconway.turnip}           \tab 2   \tab    \tab 4   \tab    \tab 2,4 \tab hetero\tab aov, lme\cr
\link{mead.strawberry}           \tab 8   \tab    \tab 4   \tab    \tab     \tab \tab \cr
\link{minnesota.barley.yield}    \tab 22  \tab 6  \tab     \tab 10 \tab     \tab \tab dotplot\cr
\link{pearl.kernels}             \tab     \tab    \tab     \tab    \tab     \tab \tab chisq \cr
\link{rothamsted.brussels}       \tab     \tab    \tab 4   \tab    \tab 6   \tab \tab \cr
\link{ryder.groundnut}           \tab 5   \tab    \tab 4   \tab    \tab     \tab xy, rcb \tab lm \cr
\link{shafii.rapeseed}           \tab 6   \tab 14 \tab 3   \tab 3  \tab     \tab \tab biplot \cr
\link{steel.soybeanmet}          \tab 12  \tab 3  \tab 3   \tab    \tab     \tab \tab \cr
\link{stroup.nin}                \tab 56  \tab    \tab 4   \tab    \tab     \tab xy \tab asreml \cr
\link{stroup.splitplot}          \tab     \tab    \tab 4   \tab    \tab     \tab \tab asreml, MCMCglmm \cr
\link{student.barley}            \tab 2   \tab 51 \tab     \tab 6  \tab     \tab \tab lmer \cr
\link{talbot.potato}             \tab 9   \tab 12 \tab     \tab 6  \tab     \tab Gen*Env~Gen*Trait \tab pls \cr
\link{theobald.covariate}        \tab 10  \tab 7  \tab 5   \tab    \tab     \tab cov \tab jags \cr
\link{thompson.cornsoy}          \tab     \tab 5  \tab 33  \tab    \tab     \tab repeated measures \tab aov \cr
\link{vargas.wheat1}             \tab 7   \tab    \tab     \tab 6  \tab     \tab G*Y~G*Trait, Y*G~Y*Cov\tab pls \cr
\link{vargas.wheat2}             \tab 8   \tab 7  \tab     \tab    \tab     \tab Env*Gen~Env*Cov \tab pls \cr
\link{verbyla.lupin}             \tab 9   \tab 8  \tab     \tab 2  \tab     \tab xy, density\tab \cr
\link{vsn.lupin3}                \tab 336 \tab 3  \tab     \tab    \tab     \tab xy \tab asreml\cr
\link{wedderburn.barley}         \tab 10  \tab 9  \tab     \tab    \tab     \tab percent \tab glm \cr
\link{williams.trees}            \tab 37  \tab 6  \tab     \tab    \tab 2   \tab \tab \cr
\link{yan.winterwheat}           \tab 18  \tab 9  \tab     \tab    \tab     \tab \tab biplot \cr
\link{yates.missing}             \tab     \tab    \tab 10  \tab    \tab 3^2 \tab factorial \tab lm, pca \cr
\link{yates.oats}                \tab 3   \tab    \tab 6   \tab    \tab     \tab xy, nitro\tab lmer \cr
}

The original sources for these data use several different words to refer to
genetics including \emph{line}, \emph{cultivar}, \emph{hybrid},
\emph{variety}, \emph{type}, \emph{stock}, and \emph{genotype}.
For simplicity and consistency, these datasets all use \code{gen} (genotype).
Also for consistency \code{row} and \code{col} are often used for the
coordinates.

Box (1957) said, "I had hoped that we had seen the end of the obscene
tribal habit practiced by statisticians of continually exhuming and
massaging dead data sets after their purpose in life has long since been
forgotten and there was no possibility of doing anything useful as a
result of this treatment."

Clearly, massaging these 'dead' data sets will not lead to any of the
genetics being released for commercial use.  The value of these data is,
however, multifold:
1. Validating published analyses (reproducible research).
2. Providing data for testing new analysis methods.
3. Illustrating the use of R.

Some of the examples use the \code{asreml} package since it is the only
option for fitting mixed models with complex variance structures
to large datasets, and also the only option (even for small datasets)
for modelling AR1xAR1 structures.
The Discovery version of ASREML is free for people
in academia (excluding commercial use) and for people in developing
nations.  This applies to both the stand-alone ASREML and the
R package ASREML-R. Learn more at
\url{http://www.vsni.co.uk/software/asreml-discovery/}.
Commercial use requires a license:
\url{http://www.vsni.co.uk/downloads/asreml/}.
}

\author{
  Kevin Wright, kw.stat@gmail.com

  The author is grateful to the many people who granted permission to
  include their data in this package.
  If you use these data, please consider citing this package
  and the original source of the data.
}

\references{
  Box G. E. P. (1957), Integration of Techniques in Process Development,
  \emph{Transactions of the American Society for Quality Control}.
}

