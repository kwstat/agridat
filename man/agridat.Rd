\name{agridat}
\alias{agridat}
\docType{package}
\title{Datasets from agricultural experiments}
\description{
  This package contains datasets from published papers and books
  relating to agriculture including field crops, tree crops, animal
  studies, and a few others.
}
\details{

Abbreviations in the 'other' column include: xy = coordinates,
pls = partial least squares, row-col = row-column design, ts = time series.

\bold{Uniformity trials with a single genotype}

\tabular{llll}{
name                                  \tab dimensions \tab other \tab model \cr
\link{baker.barley.uniformity}        \tab 3 x 19 \tab xy, 10 years \tab \cr
\link{batchelor.apple.uniformity}     \tab 8 x 28 \tab xy \tab \cr
\link{batchelor.lemon.uniformity}     \tab 14 x 16 \tab xy \tab \cr
\link{batchelor.navel1.uniformity}    \tab 20 x 50 \tab xy \tab \cr
\link{batchelor.navel2.uniformity}    \tab 15 x 33 \tab xy \tab \cr
\link{batchelor.valencia.uniformity}  \tab 12 x 20 \tab xy \tab \cr
\link{batchelor.walnut.uniformity}    \tab 10 x 28 \tab xy \tab \cr
\link{garber.multi.uniformity}        \tab 45 x 6 \tab xy, 2 years/crops \tab \cr
\link{gomez.rice.uniformity}          \tab 18 x 36 \tab xy \tab aov \cr
\link{goulden.barley.uniformity}      \tab 20 x 20 \tab xy \tab \cr
\link{harris.multi.uniformity}        \tab 2 x 23 \tab xy, 23 crops \tab corrgram\cr
\link{immer.sugarbeet.uniformity}     \tab 10 x 60 \tab xy, 3 traits \tab \cr
\link{kalamkar.potato.uniformity}     \tab 6 x 96 \tab xy \tab \cr
\link{kempton.barley.uniformity}      \tab 7 x 28 \tab xy \tab \cr
\link{li.millet.uniformity}           \tab 6 x 100 \tab xy \tab \cr
\link{lyon.potato.uniformity}         \tab 34 x 6 \tab xy \tab \cr
\link{mercer.mangold.uniformity}      \tab 10 x 25 \tab xy, 2 traits \tab \cr
\link{mercer.wheat.uniformity}        \tab 25 x 20 \tab xy, 2 traits \tab spplot \cr
\link{odland.soybean.uniformity}      \tab 25 x 42 \tab xy \tab \cr
\link{odland.soyhay.uniformity}       \tab 28 x 55 \tab xy \tab \cr
\link{smith.corn.uniformity}          \tab 6 x 20 \tab xy, 3 years \tab rgl \cr
\link{stephens.sorghum.uniformity}    \tab 100 x 20 \tab xy \tab \cr
\link{wassom.brome1.uniformity}       \tab 36 x 36 \tab xy \tab \cr
\link{wassom.brome2.uniformity}       \tab 36 x 36 \tab xy \tab \cr
\link{wassom.brome3.uniformity}       \tab 36 x 36 \tab xy \tab \cr
\link{wiebe.wheat.uniformity}         \tab 12 x 125 \tab xy \tab medianpolish, loess \cr
\link{williams.barley.uniformity}     \tab 48 x 15 \tab xy \tab loess \cr
\link{williams.cotton.uniformity}     \tab 24 x 12 \tab xy \tab loess \cr
}

% ------------------------------------------------------------------------------

\bold{Animals}

\tabular{llllllll}{
name                             \tab gen \tab loc\tab years \tab trt \tab other \tab model \cr
\link{brandt.switchback}         \tab 10  \tab    \tab    \tab 2   \tab \tab aov \cr
\link{diggle.cow}                \tab     \tab    \tab    \tab 4   \tab ts \tab \cr
\link{foulley.calving}           \tab     \tab    \tab    \tab     \tab ordinal \tab polr \cr
\link{henderson.milkfat}         \tab     \tab    \tab    \tab     \tab \tab nls,lm,glm,gam\cr
\link{holland.arthropods}        \tab 5   \tab    \tab    \tab     \tab \tab \cr
\link{ilri.sheep}                \tab 4   \tab    \tab 6  \tab     \tab diallel \tab lmer, asreml \cr
\link{lucas.switchback}          \tab 12  \tab    \tab    \tab 3   \tab \tab aov \cr
\link{patterson.switchback}      \tab 12  \tab    \tab    \tab 4   \tab \tab aov \cr
\link{zuidhof.broiler}           \tab     \tab    \tab    \tab     \tab ts \tab \cr
}

% ------------------------------------------------------------------------------

\bold{Trees}

\tabular{llllllll}{
name                             \tab gen \tab loc\tab reps\tab years \tab trt \tab other \tab model \cr
\link{archbold.apple}            \tab 2   \tab    \tab 5   \tab    \tab 24  \tab split-split \tab lmer \cr
\link{box.cork}                  \tab     \tab    \tab     \tab    \tab     \tab repeated \tab radial, asreml \cr
\link{harris.wateruse}           \tab 2   \tab    \tab     \tab    \tab 2   \tab repeated \tab asreml,lme \cr
\link{lavoranti.eucalyptus}      \tab 70  \tab 7  \tab     \tab    \tab     \tab  \tab svd \cr
\link{pearce.apple}              \tab     \tab    \tab 4   \tab    \tab 6   \tab cov \tab lm,lmer \cr
\link{williams.trees}            \tab 37  \tab 6  \tab     \tab    \tab 2   \tab \tab \cr
}

% ------------------------------------------------------------------------------

\bold{Field and horticulture crops}

\tabular{llllllll}{
name                             \tab gen \tab loc\tab reps\tab years \tab trt \tab other \tab model \cr

\link{adugna.sorghum}            \tab 28  \tab 13 \tab     \tab 5  \tab     \tab \tab \cr
\link{aastveit.barley}           \tab 15  \tab    \tab     \tab 9  \tab     \tab yr*gen~yr*trt\tab pls \cr
\link{allcroft.lodging}          \tab 32  \tab 7  \tab     \tab    \tab     \tab percent \tab tobit \cr
\link{ars.earlywhitecorn96}      \tab 60  \tab 9  \tab     \tab    \tab     \tab 6 traits \tab dotplot \cr
\link{australia.soybean}         \tab 58  \tab 4  \tab     \tab 2  \tab     \tab 4-way, 6 traits \tab biplot \cr
\link{beall.webworms}            \tab     \tab    \tab 15  \tab    \tab 2,2 \tab xy \tab glm poisson\cr
\link{beaven.barley}             \tab  8  \tab    \tab 20  \tab    \tab     \tab xy \tab \cr
\link{besag.bayesian}            \tab 75  \tab    \tab 3   \tab    \tab     \tab xy \tab asreml \cr
\link{besag.beans}               \tab 6   \tab    \tab 4*6 \tab    \tab     \tab xy \tab lm,competition \cr
\link{besag.elbatan}             \tab 50  \tab    \tab 3   \tab    \tab     \tab xy \tab lm, gam \cr
\link{besag.endive}              \tab     \tab    \tab     \tab    \tab     \tab xy,binary \tab autologistic \cr
\link{besag.met}                 \tab 64  \tab 6  \tab 3   \tab    \tab     \tab xy, incblock\tab asreml, lme \cr
\link{besag.triticale}           \tab 3   \tab    \tab     \tab    \tab 2,2,3 \tab xy \tab lm, asreml \cr
\link{bliss.borers}              \tab     \tab    \tab     \tab    \tab 4   \tab \tab glm \cr
\link{blackman.wheat}            \tab 12  \tab 7  \tab     \tab    \tab 2   \tab \tab biplot \cr
\link{bond.diallel}              \tab 6*6 \tab    \tab     \tab    \tab 9   \tab diallel \tab \cr
\link{bridges.cucumber}          \tab 4   \tab 2  \tab 4   \tab    \tab     \tab xy, latin, hetero\tab asreml \cr
\link{brandle.rape}              \tab 5   \tab 9  \tab 4   \tab 3  \tab     \tab \tab lmer \cr
\link{burgueno.alpha}            \tab 15  \tab    \tab 3   \tab    \tab     \tab xy, alpha \tab asreml,lmer \cr
\link{burgueno.rowcol}           \tab 64  \tab    \tab 2   \tab    \tab     \tab xy, row-col \tab asreml,lmer \cr
\link{burgueno.unreplicated}     \tab 280 \tab    \tab     \tab    \tab     \tab xy \tab asreml \cr
\link{butron.maize}              \tab 49  \tab 3  \tab     \tab 2  \tab     \tab diallel,pedigree \tab biplot,asreml \cr
\link{caribbean.maize}           \tab     \tab 17 \tab 4   \tab    \tab 3   \tab \tab \cr
\link{carmer.density}            \tab 8   \tab    \tab     \tab    \tab 4   \tab \tab nls,nlme \cr
\link{carlson.germination}       \tab 15  \tab    \tab     \tab    \tab 8   \tab \tab glm\cr
\link{cochran.bib}               \tab 13  \tab 13 \tab     \tab    \tab     \tab BIB \tab aov, lme \cr
\link{cochran.crd}               \tab     \tab    \tab     \tab    \tab 7   \tab xy, crd\tab aov \cr
\link{cochran.factorial}         \tab     \tab    \tab 2   \tab    \tab 4^2 \tab factorial \tab aov \cr
\link{cochran.latin}             \tab     \tab    \tab 6   \tab    \tab 6   \tab xy, latin\tab aov \cr
\link{cochran.wireworms}         \tab     \tab    \tab 5   \tab    \tab 5   \tab xy, latin\tab glm \cr
\link{cochran.eelworms}          \tab     \tab    \tab 4   \tab    \tab 5   \tab xy \tab aov \cr
\link{connolly.potato}           \tab 20  \tab    \tab 4   \tab    \tab     \tab xy, competition \tab lm \cr
\link{cornelius.maize}           \tab 9   \tab 20 \tab     \tab    \tab     \tab \tab svd\cr
\link{corsten.interaction}       \tab 20  \tab 7  \tab     \tab    \tab     \tab \tab \cr
\link{crossa.wheat}              \tab 18  \tab 25 \tab     \tab    \tab     \tab \tab AMMI \cr
\link{crowder.seeds}             \tab 2   \tab    \tab 21  \tab    \tab 2   \tab \tab glm,jags \cr
\link{cox.stripsplit}            \tab     \tab    \tab  4  \tab    \tab 3,4,2 \tab \tab aov \cr
\link{cullis.earlygen}           \tab 532 \tab    \tab     \tab    \tab     \tab xy \tab asreml \cr
\link{darwin.maize}              \tab     \tab    \tab 12  \tab    \tab 2   \tab \tab t.test \cr
\link{denis.missing}             \tab 5   \tab 26 \tab     \tab    \tab     \tab \tab lme \cr
\link{denis.ryegrass}            \tab 21  \tab 7  \tab     \tab    \tab     \tab \tab aov \cr
\link{digby.jointregression}     \tab 10  \tab 17 \tab     \tab    \tab 4   \tab \tab lm \cr
\link{durban.competition}        \tab 36  \tab    \tab 3   \tab    \tab     \tab xy, competition \tab lm \cr
\link{durban.rowcol}             \tab 272 \tab    \tab 2   \tab    \tab     \tab xy \tab lm, gam, asreml \cr
\link{durban.splitplot}          \tab 70  \tab    \tab 4   \tab    \tab 2   \tab xy \tab lm, gam, asreml \cr
\link{eden.potato}               \tab     \tab    \tab 4   \tab 3  \tab 4-12 \tab xy, rcb, latin \tab aov \cr
\link{engelstad.nitro}           \tab     \tab 2  \tab     \tab 5  \tab 6   \tab rsm1 \tab nls quadratic plateau \cr
\link{fan.stability}             \tab 13  \tab 10 \tab     \tab 2  \tab     \tab 3-way \tab stability \cr
\link{federer.diagcheck}         \tab 122 \tab    \tab     \tab    \tab     \tab xy \tab lm, lmer, asreml \cr
\link{federer.tobacco}           \tab     \tab    \tab 8   \tab    \tab 7   \tab xy \tab lm \cr
\link{fisher.latin}              \tab     \tab    \tab 5   \tab    \tab 5   \tab xy,lating \tab lm \cr
\link{fox.wheat}                 \tab 22  \tab 14 \tab     \tab    \tab     \tab \tab lm\cr
\link{gathmann.bt}               \tab 2   \tab    \tab 8   \tab    \tab     \tab \tab TOST \cr
\link{gauch.soy}                 \tab 7   \tab 7  \tab 4   \tab 12 \tab     \tab \tab AMMI \cr
\link{gilmour.serpentine}        \tab 108 \tab    \tab 3   \tab    \tab     \tab xy, serpentine\tab asreml \cr
\link{gilmour.slatehall}         \tab 25  \tab    \tab 6   \tab    \tab     \tab xy \tab asreml \cr
\link{gomez.fractionalfactorial} \tab     \tab    \tab 2   \tab    \tab 6   \tab xy \tab lm \cr
\link{gomez.groupsplit}          \tab 45  \tab    \tab 3   \tab    \tab 2   \tab xy, 3 gen groups \tab aov \cr
\link{gomez.multilocsplitplot}   \tab 2   \tab 3  \tab 3   \tab    \tab     \tab rsm1,nitro \tab aov, lmer \cr
\link{gomez.nitrogen}            \tab     \tab    \tab 4   \tab    \tab 8   \tab \tab aov, contrasts \cr
\link{gomez.seedrate}            \tab     \tab    \tab 4   \tab    \tab 6   \tab rate \tab lm\cr
\link{gomez.splitplot.subsample} \tab     \tab    \tab 3   \tab    \tab 8,4 \tab subsample \tab aov \cr
\link{gomez.splitsplit}          \tab 3   \tab    \tab 3   \tab    \tab     \tab xy, nitro, mgmt \tab aov, lmer \cr
\link{gomez.stripplot}           \tab 6   \tab    \tab 3   \tab    \tab     \tab xy, nitro \tab aov \cr
\link{gomez.stripsplitplot}      \tab 6   \tab    \tab 3   \tab    \tab     \tab xy, nitro\tab aov \cr
\link{gotway.hessianfly}         \tab 16  \tab    \tab 4   \tab    \tab     \tab xy \tab lmer \cr
\link{goulden.latin}             \tab     \tab    \tab 5   \tab    \tab 5   \tab xy, latin \tab lm \cr
\link{graybill.heteroskedastic}  \tab 4   \tab 13 \tab     \tab    \tab     \tab hetero \tab \cr
\link{gumpertz.pepper}           \tab     \tab 2  \tab     \tab    \tab     \tab xy \tab glm\cr
\link{hanks.sprinkler}           \tab 3   \tab    \tab 3   \tab    \tab     \tab xy \tab asreml\cr
\link{hayman.tobacco}            \tab 8   \tab    \tab 2   \tab 2  \tab     \tab diallel\tab asreml\cr
\link{hazell.vegetables}         \tab 4   \tab    \tab     \tab 6  \tab     \tab \tab linprog\cr
\link{heady.fertilizer}          \tab     \tab    \tab 2   \tab    \tab 9*9 \tab rsm2 \tab lm,rgl\cr
\link{hernandez.nitrogen}        \tab     \tab 5  \tab 4   \tab    \tab     \tab rsm1 \tab lm, nls\cr
\link{hildebrand.systems}        \tab     \tab 14 \tab     \tab    \tab 4   \tab \tab asreml\cr
\link{holshouser.splitstrip}     \tab 4   \tab    \tab 4   \tab    \tab 2*4 \tab rsm1,pop \tab lmer\cr
\link{hughes.grapes}             \tab     \tab    \tab 3   \tab    \tab 6   \tab binomial \tab lmer, aod, glmm\cr
\link{hunter.corn}               \tab     \tab 12 \tab     \tab 3  \tab 1   \tab rsm1 \tab xyplot \cr
\link{ivins.herbs}               \tab 13  \tab    \tab 6   \tab    \tab     \tab 2 traits \tab lm, friedman\cr
\link{jansen.strawberry}         \tab 12  \tab    \tab 4   \tab    \tab     \tab ordinal \tab mosaicplot\cr
\link{jenkyn.mildew}             \tab     \tab    \tab 9   \tab    \tab 4   \tab \tab lm\cr
\link{john.alpha}                \tab 24  \tab    \tab 3   \tab    \tab     \tab alpha \tab lm, lmer \cr
\link{johnson.blight}            \tab     \tab    \tab     \tab 2  \tab     \tab \tab logistic \cr
\link{kang.maize}                \tab 17  \tab 4  \tab     \tab 3  \tab 2,4 \tab \tab \cr
\link{kang.peanut}               \tab 10  \tab 15 \tab 4   \tab    \tab     \tab \tab GGE \cr
\link{karcher.turfgrass}         \tab     \tab    \tab 4   \tab    \tab 2,4 \tab ordinal \tab polr \cr
\link{keen.potatodamage}         \tab 6   \tab    \tab 4   \tab    \tab 2,3,8 \tab ordinal \tab mosaicplot \cr
\link{kempton.competition}       \tab 36  \tab    \tab 3   \tab    \tab     \tab xy, competition \tab lme AR1 \cr
\link{kempton.rowcol}            \tab 35  \tab    \tab 2   \tab    \tab     \tab xy, row-col \tab lmer \cr
\link{kempton.slatehall}         \tab 25  \tab    \tab 6   \tab    \tab     \tab xy \tab asreml, lmer\cr
\link{lasrosas.corn}             \tab     \tab    \tab 3   \tab 2  \tab 6   \tab xy \tab lm\cr
\link{lee.potatoblight}          \tab 337 \tab    \tab 4   \tab 11 \tab     \tab xy, ordinal, repeated \tab \cr
\link{lonnquist.maize}           \tab 11  \tab    \tab     \tab    \tab     \tab diallel \tab asreml \cr
\link{lyons.wheat}               \tab     \tab 12 \tab     \tab 4  \tab     \tab \tab \cr
\link{mcconway.turnip}           \tab 2   \tab    \tab 4   \tab    \tab 2,4 \tab hetero \tab aov, lme\cr
\link{mcleod.barley}             \tab     \tab 8  \tab     \tab    \tab  6  \tab \tab aggregate\cr
\link{mead.cauliflower}          \tab     \tab    \tab     \tab 2  \tab     \tab poisson \tab glm \cr
\link{mead.cowpeamaize}          \tab 3,2 \tab    \tab 3   \tab    \tab 4   \tab intercrop \tab \cr
\link{mead.germination}          \tab     \tab    \tab 4   \tab    \tab 4,4 \tab binomial\tab glm\cr
\link{mead.strawberry}           \tab 8   \tab    \tab 4   \tab    \tab     \tab \tab \cr
\link{minnesota.barley.weather}  \tab     \tab 6  \tab     \tab 10 \tab     \tab \tab \cr
\link{minnesota.barley.yield}    \tab 22  \tab 6  \tab     \tab 10 \tab     \tab \tab dotplot\cr
\link{ortiz.tomato}              \tab 15  \tab 18 \tab     \tab   \tab 16   \tab env*gen~env*cov \tab pls \cr
\link{pacheco.soybean}           \tab 18  \tab 11 \tab     \tab    \tab     \tab \tab AMMI\cr
\link{perry.springwheat}         \tab 28  \tab 5  \tab     \tab 4  \tab     \tab gain \tab lm,lmer,asreml\cr
\link{piepho.cocksfoot}          \tab 25  \tab    \tab     \tab 7  \tab     \tab \tab lmer\cr
\link{ridout.appleshoots}        \tab     \tab    \tab 30  \tab    \tab 2,4 \tab ZIP \tab zeroinfl\cr
\link{rothamsted.brussels}       \tab     \tab    \tab 4   \tab    \tab 6   \tab \tab \cr
\link{ryder.groundnut}           \tab 5   \tab    \tab 4   \tab    \tab     \tab xy, rcb \tab lm \cr
\link{salmon.bunt}               \tab 10  \tab    \tab 2   \tab    \tab 20  \tab \tab betareg \cr
\link{senshu.rice}               \tab     \tab 40 \tab     \tab    \tab     \tab \tab lm,Fieller \cr
\link{shafii.rapeseed}           \tab 6   \tab 14 \tab 3   \tab 3  \tab     \tab \tab biplot \cr
\link{sinclair.clover}           \tab     \tab    \tab     \tab    \tab 5,5 \tab rsm2,mitzerlich \tab nls,rgl \cr
\link{snedecor.asparagus}        \tab     \tab    \tab 4   \tab 4  \tab 4   \tab \tab split-plot, antedependence \cr
\link{snijders.fusarium}         \tab 17  \tab    \tab     \tab 3  \tab 4   \tab percent \tab glm/gnm,AMMI \cr
\link{steel.soybean}             \tab 12  \tab 3  \tab 3   \tab    \tab     \tab \tab \cr
\link{streibig.competition}      \tab 2   \tab    \tab 3   \tab    \tab     \tab \tab glm \cr
\link{stroup.nin}                \tab 56  \tab    \tab 4   \tab    \tab     \tab xy \tab asreml \cr
\link{stroup.splitplot}          \tab     \tab    \tab 4   \tab    \tab     \tab \tab asreml, MCMCglmm \cr
\link{student.barley}            \tab 2   \tab 51 \tab     \tab 6  \tab     \tab \tab lmer \cr
\link{talbot.potato}             \tab 9   \tab 12 \tab     \tab    \tab     \tab gen*env~gen*trt \tab pls \cr
\link{theobald.barley}           \tab 3   \tab 5  \tab     \tab 2  \tab 5   \tab rsm1 \tab \cr
\link{theobald.covariate}        \tab 10  \tab 7  \tab 5   \tab    \tab     \tab cov \tab jags \cr
\link{thompson.cornsoy}          \tab     \tab 5  \tab     \tab 33 \tab     \tab repeated measures \tab aov \cr
\link{vargas.wheat1}             \tab 7   \tab    \tab     \tab 6  \tab     \tab gen*yr~gen*trt, yr*gen~yr*cov\tab pls \cr
\link{vargas.wheat2}             \tab 8   \tab 7  \tab     \tab    \tab     \tab env*gen~env*cov \tab pls \cr
\link{vargas.txe}                \tab     \tab    \tab     \tab 10 \tab 24  \tab yr*trt~yr*cov \tab pls \cr
\link{verbyla.lupin}             \tab 9   \tab 8  \tab     \tab 2  \tab     \tab rsm1, xy, density\tab \cr
\link{vold.longterm}             \tab     \tab    \tab     \tab 19 \tab 4   \tab rsm1 \tab nls,nlme \cr
\link{vsn.lupin3}                \tab 336 \tab 3  \tab     \tab    \tab     \tab xy \tab asreml\cr
\link{wedderburn.barley}         \tab 10  \tab 9  \tab     \tab    \tab     \tab percent \tab glm/gnm \cr
\link{weiss.incblock}            \tab 31  \tab    \tab 6   \tab    \tab     \tab xy,incblock \tab asreml \cr
\link{weiss.lattice}             \tab 49  \tab    \tab 4   \tab    \tab     \tab xy,lattice \tab lm,asreml \cr
\link{welch.bermudagrass}        \tab     \tab    \tab     \tab    \tab 4,4,4 \tab rsm3, factorial \tab lm, jags \cr
\link{yan.winterwheat}           \tab 18  \tab 9  \tab     \tab    \tab     \tab \tab GGE,biplot \cr
\link{yang.barley}               \tab 6   \tab 18 \tab     \tab    \tab     \tab \tab biplot \cr
\link{yates.missing}             \tab     \tab    \tab 10  \tab    \tab 3^2 \tab factorial \tab lm, pca \cr
\link{yates.oats}                \tab 3   \tab    \tab 6   \tab    \tab     \tab xy, nitro\tab lmer \cr
}

\bold{Time series}
\tabular{lllll}{
name                             \tab years \tab trt \tab other \tab model \cr
\link{byers.apple}               \tab     \tab    \tab \tab lme\cr
\link{broadbalk.wheat}           \tab 74  \tab 17 \tab \tab \cr
\link{hessling.argentina}        \tab 30  \tab    \tab temp,precip\tab \cr
\link{lambert.soiltemp}          \tab 1   \tab 7  \tab \tab \cr
\link{nass.barley}               \tab 146 \tab    \tab \tab \cr
\link{nass.corn}                 \tab 146 \tab    \tab \tab \cr
\link{nass.cotton}               \tab 146 \tab    \tab \tab \cr
\link{nass.hay}                  \tab 104 \tab    \tab \tab \cr
\link{nass.sorghum}              \tab 93  \tab    \tab \tab \cr
\link{nass.wheat}                \tab 146 \tab    \tab \tab \cr
\link{nass.rice}                 \tab 117 \tab    \tab \tab \cr
\link{nass.soybean}              \tab 88  \tab    \tab \tab \cr
\link{walsh.cottonprice}         \tab 34  \tab    \tab \tab cor\cr

}

\bold{Other}

\tabular{ll}{
name                       \tab model \cr
\link{cate.potassium}      \tab cate-nelson \cr
\link{cleveland.soil}      \tab loess 2D \cr
\link{harrison.priors}     \tab nls, prior \cr
\link{nebraska.farmincome} \tab choropleth \cr
\link{pearl.kernels}       \tab chisq \cr
\link{stirret.borers}      \tab lm, 4 trt \cr
\link{turner.herbicide}    \tab glm, 4 trt \cr
\link{wallace.iowaland}    \tab lm, choropleth \cr
\link{waynick.soil}        \tab spatial, nitro/carbon \cr
}

Box (1957) said, "I had hoped that we had seen the end of the obscene
tribal habit practiced by statisticians of continually exhuming and
massaging dead data sets after their purpose in life has long since been
forgotten and there was no possibility of doing anything useful as a
result of this treatment."
Massaging these dead data sets will not lead to any of the
genetics being released for commercial use.
The value of these data is:
1. Validating published analyses (reproducible research).
2. Providing data for testing new analysis methods.
3. Illustrating (and validating) the use of R.

White and van Evert (2008) present some guidelines for publication of data.

Some of the examples use the \code{asreml} package since it is the _only_
R tool for fitting mixed models with complex variance structures to
large datasets, and also the only option (even for small datasets) for
modelling AR1xAR1 residual variance structures.
A free trial version is available. Commercial use requires a license:
\url{http://www.vsni.co.uk/downloads/asreml/}.

\bold{Comments on the package structure}

The original sources for these data use several different words to refer to
genotypes including \emph{breed}, \emph{cultivar}, \emph{genotype}, \emph{hybrid},
\emph{line}, \emph{progeny}, \emph{stock}, \emph{type}, and \emph{variety}.
For consistency, these datasets mostly use \code{gen} (genotype).
Also for consistency \code{row} and \code{col} are often used for the
coordinates.

In dataframes, 'block', 'rep', and similar terms are almost always coded
like B1, B2, B3 instead of 1, 2, 3.  This causes R to treat the data as
a factor instead of a numeric covariate.

In almost all cases, the data are presented as data frames.  In a few
cases, the data are lists of matrices.

Although using \code{data()} is not necessary to access the data files,
the example sections do include the use of \code{data()} because
\code{devtools::run_examples()} needs it.

Note: In the U.S., raw data are generally not subject to copyright.  See
\url{http://www.lib.umich.edu/copyright-office-mpublishing/copyrightability-charts-tables-and-graphs}
and \url{http://sciencecommons.org/about/towards} for some discussion.

Nonetheless, substantial effort has been made to contact people to
secure permission to include data (published within the past few
decades) in this package.

Data produced from work of the United States government is not subject to
copyright. \url{http://en.wikipedia.org/wiki/Copyright_status_of_work_by_the_U.S._government}

}

\author{
  Kevin Wright, kw.stat@gmail.com

  The author is grateful to the many people who granted permission to
  include their data in this package.  If you use these data, please
  cite this package and the original source of the data.
}

\references{
  Box G. E. P. (1957), Integration of Techniques in Process Development,
  \emph{Transactions of the American Society for Quality Control}.

  J. White and Frits van Evert. (2008).
  Publishing Agronomic Data.
  \emph{Agron J.} 100, 1396-1400.
}

