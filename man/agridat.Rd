\name{agridat}
\alias{agridat}
\docType{package}
\title{
  Datasets from agricultural experiments
}
\description{
  This package contains datasets from publications relating to agriculture,
  including field crops, tree crops, animal studies, and a few others.
}

\details{

  If you use these data, please cite both the agridat package and the
  original source of the data.

  Abbreviations in the 'other' column include:
  xy = coordinates,
  pls = partial least squares,
  rsm = response surface methodology,
  row-col = row-column design,
  ts = time series,

\bold{Uniformity trials with a single genotype}

\tabular{llll}{
name                                      \tab dimensions \tab other \tab model \cr
\link{ansari.wheat.uniformity}            \tab 96 x 8 \tab xy \tab \cr
\link{baker.barley.uniformity}            \tab 3 x 19 \tab xy, 10 years \tab \cr
\link{baker.strawberry.uniformity}        \tab 10 x 50 \tab xy \tab \cr
\link{baker.wheat.uniformity}             \tab 12 x 12 \tab xy \tab \cr
\link{bancroft.peanut.uniformity}         \tab 6 x 18 \tab xy, 2 blocks \tab \cr
\link{batchelor.apple.uniformity}         \tab 8 x 28 \tab xy \tab \cr
\link{batchelor.lemon.uniformity}         \tab 14 x 16 \tab xy \tab \cr
\link{batchelor.navel1.uniformity}        \tab 20 x 50 \tab xy \tab \cr
\link{batchelor.navel2.uniformity}        \tab 15 x 33 \tab xy \tab \cr
\link{batchelor.valencia.uniformity}      \tab 12 x 20 \tab xy \tab \cr
\link{batchelor.walnut.uniformity}        \tab 10 x 28 \tab xy \tab \cr
\link{bose.multi.uniformity}              \tab 15 x 26 \tab xy, 3 years \tab \cr
\link{bradley.multi.uniformity}           \tab 10 x 11 \tab xy \tab \cr
\link{bryan.corn.uniformity}              \tab 6 x 48 \tab xy \tab \cr
\link{christidis.cotton.uniformity}       \tab 16 x 16 \tab xy, 4 blocks \tab \cr
\link{christidis.wheat.uniformity}        \tab 12 x 24 \tab xy \tab \cr
\link{dasilva.soybean.uniformity}         \tab 24 x 48 \tab xy \tab \cr
\link{davies.pasture.uniformity}          \tab 19 x 40 \tab xy \tab \cr
\link{day.wheat.uniformity}               \tab 31 x 100 \tab xy \tab \cr
\link{draper.safflower.uniformity}        \tab 18 x 16 \tab xy, 2 expt \tab smith\cr
\link{eden.tea.uniformity}                \tab 12 x 12 \tab xy \tab \cr
\link{evans.sugarcane.uniformity}         \tab 142 x 5 \tab xy \tab \cr
\link{garber.multi.uniformity}            \tab 45 x 6 \tab xy, 2 years/crops \tab \cr
\link{gomez.rice.uniformity}              \tab 18 x 36 \tab xy \tab aov,smith \cr
\link{goulden.barley.uniformity}          \tab 48 x 48 \tab xy \tab \cr
\link{harris.multi.uniformity}            \tab 2 x 23 \tab xy, 23 crops \tab corrgram\cr
\link{hartman.tomato.uniformity}          \tab 12 x 32 \tab xy \tab \cr
\link{heath.raddish.uniformity}           \tab 10 x 10 \tab xy \tab \cr
\link{holtsmark.timothy.uniformity}       \tab 6 x 40 \tab xy \tab \cr
\link{igue.sugarcane.uniformity}          \tab 36 x 42 \tab xy \tab \cr
\link{immer.sugarbeet.uniformity}         \tab 10 x 60 \tab xy, 3 traits \tab \cr
\link{iyer.wheat.uniformity}              \tab 25 x 80 \tab xy \tab \cr
\link{kadam.millet.uniformity}            \tab 8 x 20 \tab xy, 2 expts \tab \cr
\link{kalamkar.potato.uniformity}         \tab 6 x 96 \tab xy \tab \cr
\link{kalamkar.wheat.uniformity}          \tab 16 x 80 \tab xy, 2 traits \tab \cr
\link{kempton.barley.uniformity}          \tab 7 x 28 \tab xy \tab \cr
\link{kerr.sugarcane.uniformity}          \tab 12 x 12 \tab xy \tab, 4 fields \cr
\link{khin.rice.uniformity}               \tab 30 x 36 \tab xy \tab \cr
\link{kiesselbach.oats.uniformity}        \tab 3 x 69 \tab xy \tab \cr
\link{kristensen.barley.uniformity}       \tab 22 x 11 \tab xy \tab \cr
\link{kulkarni.sorghum.uniformity}        \tab 4 x 40 \tab xy, 3 years \tab \cr
\link{lander.multi.uniformity}            \tab 5 x 39 \tab xy, 4 years \tab \cr
\link{laycock.tea.uniformity}             \tab 6 x 9  \tab xy, 2 locations \tab \cr
\link{lehmann.millet.uniformity}          \tab 6 x 22 \tab xy, 3 years \tab \cr
\link{lessman.sorghum.uniformity}         \tab 46 x 60 \tab xy \tab \cr
\link{li.millet.uniformity}               \tab 6 x 100 \tab xy \tab \cr
\link{loesell.bean.uniformity}            \tab 21 x 90 \tab xy \tab \cr
\link{lord.rice.uniformity}               \tab 5 x 14 \tab xy, 8 fields \tab \cr
\link{love.cotton.uniformity}             \tab 16 x 10 \tab xy \tab \cr
\link{lyon.potato.uniformity}             \tab 34 x 6 \tab xy \tab \cr
\link{magistad.pineapple.uniformity}      \tab 5 x 5 \tab xy \tab \cr
\link{masood.rice.uniformity}             \tab 12 x 24 \tab xy \tab \cr
\link{mcclelland.corn.uniformity}         \tab 2 x 219 \tab xy \tab \cr
\link{mercer.mangold.uniformity}          \tab 10 x 20 \tab xy \tab \cr
\link{mercer.wheat.uniformity}            \tab 25 x 20 \tab xy, 2 traits \tab spplot \cr
\link{montgomery.wheat.uniformity}        \tab 14 x 16 \tab xy, 2 years \tab lm \cr
\link{moore.polebean.uniformity}          \tab 12 x 12 \tab xy \tab \cr
\link{moore.bushbean.uniformity}          \tab 24 x 24 \tab xy \tab \cr
\link{moore.sweetcorn.uniformity}         \tab 24 x 12 \tab xy \tab \cr
\link{moore.carrot.uniformity}            \tab 24 x 12 \tab xy \tab \cr
\link{moore.springcauliflower.uniformity} \tab 12 x 20 \tab xy \tab \cr
\link{moore.fallcauliflower.uniformity}   \tab 12 x 20 \tab xy \tab \cr
\link{nagai.strawberry.uniformity}        \tab 18 x 24 \tab xy \tab \cr
\link{nagai.strawberry.uniformity}        \tab 18 x 24 \tab xy \tab \cr
\link{nair.turmeric.uniformity}           \tab 72 x 12 \tab xy \tab \cr
\link{narain.sorghum.uniformity}          \tab 10 x 16 \tab xy \tab \cr
\link{nonnecke.peas.uniformity}           \tab 15 x 18 \tab xy, 2 traits \tab \cr
\link{nonnecke.sweetcorn.uniformity}      \tab 32 x 18 \tab xy, 3 loc \tab \cr
\link{obsi.potato.uniformity}             \tab 63 x 26, 49 x 19 \tab xy \tab \cr
\link{odland.soybean.uniformity}          \tab 25 x 42 \tab xy \tab \cr
\link{odland.soyhay.uniformity}           \tab 28 x 55 \tab xy \tab \cr
\link{panse.cotton.uniformity}            \tab 32 x 40 \tab xy \tab \cr
\link{parker.orange.uniformity}           \tab 10 x 27 \tab xy, 6 yr \tab \cr
\link{paez.coffee.uniformity}             \tab 32 x 36 \tab xy, 5 yr \tab \cr
\link{piepho.barley.uniformity}           \tab 30 x 36 \tab xy \tab \cr
\link{polson.safflower.uniformity}        \tab 52 x 33 \tab xy \tab smith\cr
\link{robinson.peanut.uniformity}         \tab 16 x 36 \tab xy \tab \cr
\link{sawyer.multi.uniformity}            \tab 8 x 6   \tab xy, 3 year \tab \cr
\link{sayer.sugarcane.uniformity}         \tab 8 x 136, 8 x 121 \tab xy, 2 year \tab \cr
\link{shafi.tomato.uniformity}            \tab 10 x 20 \tab xy \tab \cr
\link{smith.beans.uniformity}             \tab 18 x 12, 16 x 15 \tab xy, 2 yr, 2 crops \tab \cr
\link{smith.corn.uniformity}              \tab 6 x 20 \tab xy, 3 years \tab rgl \cr
\link{smith.wheat.uniformity}             \tab 36 x 30 \tab xy, 2 traits \tab \cr
\link{stephens.sorghum.uniformity}        \tab 100 x 20 \tab xy \tab \cr
\link{stickler.sorghum.uniformity}        \tab 20 x 20 \tab xy, 4 expts, 2 years \tab \cr
\link{strickland.apple.uniformity}        \tab 11 x 18 \tab xy \tab \cr
\link{strickland.grape.uniformity}        \tab 5 x 31 \tab xy \tab \cr
\link{strickland.peach.uniformity}        \tab 8 x 18 \tab xy \tab \cr
\link{strickland.tomato.uniformity}       \tab 30 x 6 \tab xy \tab \cr
\link{wassom.brome.uniformity}            \tab 36 x 36 \tab xy, 3 expts \tab \cr
\link{wiebe.wheat.uniformity}             \tab 12 x 125 \tab xy \tab medianpolish, loess \cr
\link{wiedemann.safflower.uniformity}     \tab 54 x 33 \tab xy \tab smith \cr
\link{williams.barley.uniformity}         \tab 48 x 15 \tab xy \tab loess \cr
\link{williams.cotton.uniformity}         \tab 24 x 12 \tab xy \tab loess \cr
\link{wyatt.multi.uniformity}             \tab 43 x 3 \tab xy \tab \cr
}

% ------------------------------------------------------------------------------

\bold{Yield monitor}
\tabular{llllll}{
name                             \tab reps\tab years \tab trt \tab other \tab model \cr
\link{gartner.corn}              \tab     \tab       \tab     \tab xy,ym \tab \cr
\link{lasrosas.corn}             \tab 3   \tab 2     \tab 6   \tab xy,ym \tab lm \cr
\link{kayad.alfalfa}             \tab     \tab 4     \tab     \tab xy,ym \tab \cr
}

% ------------------------------------------------------------------------------

\bold{Animals}

\tabular{llllll}{
name                             \tab gen  \tab years \tab trt \tab other \tab model \cr
\link{alwan.lamb}                \tab 34   \tab 2  \tab        \tab ordinal \tab clmm \cr
\link{becker.chicken}            \tab 5,12 \tab    \tab        \tab heritability \tab lmer \cr
\link{crampton.pig}              \tab      \tab    \tab 5      \tab 2 cov\tab lm \cr
\link{brandt.switchback}         \tab 10   \tab    \tab 2      \tab \tab aov \cr
\link{depalluel.sheep}           \tab 4    \tab    \tab 4      \tab latin \tab \cr
\link{diggle.cow}                \tab      \tab    \tab 4      \tab ts \tab \cr
\link{foulley.calving}           \tab      \tab    \tab        \tab ordinal \tab polr \cr
\link{goulden.eggs}              \tab      \tab    \tab        \tab controlchart \tab \cr
\link{harvey.lsmeans}            \tab 3,3  \tab    \tab        \tab \tab lm\cr
\link{harville.lamb}             \tab 5    \tab    \tab        \tab \tab lmer\cr
\link{henderson.milkfat}         \tab      \tab    \tab        \tab \tab nls,lm,glm,gam\cr
\link{holland.arthropods}        \tab 5    \tab    \tab        \tab \tab \cr
\link{ilri.sheep}                \tab 4    \tab 6  \tab        \tab diallel \tab lmer, asreml \cr
\link{kenward.cattle}            \tab      \tab    \tab 2      \tab \tab asreml \cr
\link{lucas.switchback}          \tab 12   \tab    \tab 3      \tab \tab aov \cr
\link{mead.lamb}                 \tab 3    \tab    \tab 3      \tab \tab glm \cr
\link{patterson.switchback}      \tab 12   \tab    \tab 4      \tab \tab aov \cr
\link{urquhart.feedlot}          \tab 11   \tab    \tab 3      \tab  \tab lm \cr
\link{woodman.pig}               \tab      \tab    \tab 3      \tab cov \tab lm \cr
\link{zuidhof.broiler}           \tab      \tab    \tab        \tab ts \tab
}

% ------------------------------------------------------------------------------

\bold{Trees}

\tabular{llllllll}{
name                             \tab gen \tab loc\tab reps\tab years \tab trt \tab other \tab model \cr
\link{box.cork}                  \tab     \tab    \tab     \tab    \tab     \tab repeated \tab radial, asreml \cr
\link{devries.pine}              \tab     \tab    \tab 4   \tab    \tab 3,3 \tab xy,graeco \tab aov \cr
\link{harris.wateruse}           \tab 2   \tab    \tab     \tab    \tab 2   \tab repeated \tab asreml,lme \cr
\link{hanover.whitepine}         \tab 7*4 \tab    \tab 4   \tab    \tab     \tab heritability \tab lmer \cr
\link{johnson.douglasfir}        \tab     \tab    \tab     \tab    \tab     \tab xy \tab \cr
\link{lavoranti.eucalyptus}      \tab 70  \tab 7  \tab     \tab    \tab     \tab  \tab svd \cr
\link{pearce.apple}              \tab     \tab    \tab 4   \tab    \tab 6   \tab cov \tab lm,lmer \cr
\link{williams.trees}            \tab 37  \tab 6  \tab     \tab    \tab 2   \tab \tab
}

% ------------------------------------------------------------------------------

\bold{Field and horticulture crops}

\tabular{llllllll}{
name                               \tab gen \tab loc\tab reps\tab years \tab trt \tab other \tab model \cr

\link{acorsi.grayleafspot}         \tab 36  \tab 9  \tab  2  \tab 5  \tab       \tab nonnormal \tab gnm,ammi \cr
\link{adugna.sorghum}              \tab 28  \tab 13 \tab     \tab 5  \tab       \tab \tab \cr
\link{aastveit.barley}             \tab 15  \tab    \tab     \tab 9  \tab       \tab yr*gen~yr*trt\tab pls \cr
\link{allcroft.lodging}            \tab 32  \tab 7  \tab     \tab    \tab       \tab percent \tab tobit \cr
\link{archbold.apple}              \tab 2   \tab    \tab 5   \tab    \tab 24    \tab split-split \tab lmer \cr
\link{ars.earlywhitecorn96}        \tab 60  \tab 9  \tab     \tab    \tab       \tab 6 traits \tab dotplot \cr
\link{australia.soybean}           \tab 58  \tab 4  \tab     \tab 2  \tab       \tab 4-way, 6 traits \tab biplot \cr
\link{bachmaier.nitrogen}          \tab     \tab    \tab 4   \tab    \tab 2,11  \tab \tab quadratic lm\cr
\link{barrero.maize}               \tab 847 \tab 16 \tab 4   \tab 11 \tab 6     \tab \tab asreml\cr
\link{battese.survey}              \tab     \tab 12 \tab 1-5 \tab    \tab 2     \tab \tab lmer \cr
\link{beall.webworms}              \tab     \tab    \tab 15  \tab    \tab 2,2   \tab xy, split-block \tab glm poisson,nb\cr
\link{beaven.barley}               \tab  8  \tab    \tab 20  \tab    \tab       \tab xy \tab \cr
\link{besag.bayesian}              \tab 75  \tab    \tab 3   \tab    \tab       \tab xy \tab asreml \cr
\link{besag.beans}                 \tab 6   \tab    \tab 4*6 \tab    \tab       \tab xy \tab lm,competition \cr
\link{besag.checks}                \tab 2   \tab    \tab     \tab    \tab       \tab xy \tab \cr
\link{besag.elbatan}               \tab 50  \tab    \tab 3   \tab    \tab       \tab xy \tab lm, gam \cr
\link{besag.endive}                \tab     \tab    \tab     \tab    \tab       \tab xy,binary \tab autologistic \cr
\link{besag.met}                   \tab 64  \tab 6  \tab 3   \tab    \tab       \tab xy, incblock\tab asreml, lme \cr
\link{besag.triticale}             \tab 3   \tab    \tab     \tab    \tab 2,2,3 \tab xy \tab lm, asreml \cr
\link{bliss.borers}                \tab     \tab    \tab     \tab    \tab 4     \tab \tab glm \cr
\link{blackman.wheat}              \tab 12  \tab 7  \tab     \tab    \tab 2     \tab \tab biplot \cr
\link{bond.diallel}                \tab 6*6 \tab    \tab     \tab    \tab 9     \tab diallel \tab \cr
\link{bridges.cucumber}            \tab 4   \tab 2  \tab 4   \tab    \tab       \tab xy, latin, hetero\tab asreml \cr
\link{brandle.rape}                \tab 5   \tab 9  \tab     \tab 3  \tab       \tab \tab lmer \cr
\link{buntaran.wheat}              \tab 30  \tab 18 \tab 2   \tab    \tab       \tab alpha \tab asreml \cr
\link{burgueno.alpha}              \tab 15  \tab    \tab 3   \tab    \tab       \tab xy, alpha \tab asreml,lmer \cr
\link{burgueno.rowcol}             \tab 64  \tab    \tab 2   \tab    \tab       \tab xy, row-col \tab asreml,lmer \cr
\link{burgueno.unreplicated}       \tab 280 \tab    \tab     \tab    \tab       \tab xy \tab asreml \cr
\link{butron.maize}                \tab 49  \tab 3  \tab     \tab 2  \tab       \tab diallel,pedigree \tab biplot,asreml \cr
\link{caribbean.maize}             \tab     \tab 17 \tab 4   \tab    \tab 3     \tab \tab \cr
\link{carmer.density}              \tab 8   \tab    \tab     \tab    \tab 4     \tab \tab nls,nlme \cr
\link{carlson.germination}         \tab 15  \tab    \tab     \tab    \tab 8     \tab \tab glm\cr
\link{chinloy.fractionalfactorial} \tab     \tab    \tab 9   \tab    \tab 1/3 3^5 \tab xy \tab aov\cr
\link{christidis.competition}      \tab 9   \tab    \tab 5   \tab    \tab       \tab xy \tab \cr
\link{cochran.beets}               \tab     \tab    \tab 6   \tab    \tab 7     \tab \tab \cr
\link{cochran.bib}                 \tab 13  \tab 13 \tab     \tab    \tab       \tab bib \tab aov, lme \cr
\link{cochran.crd}                 \tab     \tab    \tab     \tab    \tab 7     \tab xy, crd\tab aov \cr
\link{cochran.factorial}           \tab     \tab    \tab 2   \tab    \tab 4^2   \tab factorial \tab aov \cr
\link{cochran.latin}               \tab     \tab    \tab 6   \tab    \tab 6     \tab xy, latin\tab aov \cr
\link{cochran.lattice}             \tab     \tab    \tab 5   \tab    \tab 16    \tab xy, latin\tab lmer \cr
\link{cochran.wireworms}           \tab     \tab    \tab 5   \tab    \tab 5     \tab xy, latin\tab glm \cr
\link{cochran.eelworms}            \tab     \tab    \tab 4   \tab    \tab 5     \tab xy \tab aov \cr
\link{connolly.potato}             \tab 20  \tab    \tab 4   \tab    \tab       \tab xy, competition \tab lm \cr
\link{cornelius.maize}             \tab 9   \tab 20 \tab     \tab    \tab       \tab \tab svd\cr
\link{corsten.interaction}         \tab 20  \tab 7  \tab     \tab    \tab       \tab \tab \cr
\link{cramer.cucumber}             \tab     \tab    \tab 8   \tab    \tab       \tab \tab pathcoef \cr
\link{crossa.wheat}                \tab 18  \tab 25 \tab     \tab    \tab       \tab \tab ammi \cr
\link{crowder.seeds}               \tab 2   \tab    \tab 21  \tab    \tab 2     \tab \tab glm,INLA,jags \cr
\link{cox.stripsplit}              \tab     \tab    \tab  4  \tab    \tab 3,4,2 \tab split-block \tab aov \cr
\link{cullis.earlygen}             \tab 532 \tab    \tab     \tab    \tab       \tab xy \tab asreml \cr
\link{damesa.maize}                \tab 22  \tab 4  \tab 3   \tab    \tab       \tab xy,incblock,twostage \tab asreml \cr
\link{dasilva.maize}               \tab 55  \tab 9  \tab 3   \tab    \tab       \tab \tab \cr
\link{darwin.maize}                \tab     \tab    \tab 12  \tab    \tab 2     \tab \tab t.test \cr
\link{davidian.soybean}            \tab 2   \tab    \tab     \tab 3  \tab       \tab \tab nlme \cr
\link{denis.missing}               \tab 5   \tab 26 \tab     \tab    \tab       \tab \tab lme \cr
\link{denis.ryegrass}              \tab 21  \tab 7  \tab     \tab    \tab       \tab \tab aov \cr
\link{digby.jointregression}       \tab 10  \tab 17 \tab     \tab    \tab 4     \tab \tab lm \cr
\link{durban.competition}          \tab 36  \tab    \tab 3   \tab    \tab       \tab xy, competition \tab lm \cr
\link{durban.rowcol}               \tab 272 \tab    \tab 2   \tab    \tab       \tab xy \tab lm, gam, asreml \cr
\link{durban.splitplot}            \tab 70  \tab    \tab 4   \tab    \tab 2     \tab xy \tab lm, gam, asreml \cr
\link{eden.potato}                 \tab     \tab    \tab 4   \tab 3  \tab 4-12  \tab xy, rcb, latin \tab aov \cr
\link{eden.nonnormal}              \tab     \tab    \tab 4   \tab    \tab 4     \tab \tab aov \cr
\link{edwards.oats}                \tab 80  \tab 5  \tab 3   \tab 7  \tab       \tab \tab \cr
\link{engelstad.nitro}             \tab     \tab 2  \tab     \tab 5  \tab 6     \tab rsm1 \tab nls quadratic plateau \cr
\link{fan.stability}               \tab 13  \tab 10 \tab     \tab 2  \tab       \tab 3-way \tab stability \cr
\link{federer.diagcheck}           \tab 122 \tab    \tab     \tab    \tab       \tab xy \tab lm, lmer, asreml \cr
\link{federer.tobacco}             \tab     \tab    \tab 8   \tab    \tab 7     \tab xy \tab lm \cr
\link{fisher.barley}               \tab 5   \tab 6  \tab     \tab 2  \tab       \tab  \tab  \cr
\link{fisher.latin}                \tab     \tab    \tab 5   \tab    \tab 5     \tab xy,latin \tab lm \cr
\link{fox.wheat}                   \tab 22  \tab 14 \tab     \tab    \tab       \tab \tab lm\cr
\link{gathmann.bt}                 \tab 2   \tab    \tab 8   \tab    \tab       \tab \tab tost \cr
\link{gauch.soy}                   \tab 7   \tab 7  \tab 4   \tab 12 \tab       \tab \tab ammi \cr
\link{george.wheat}                \tab 211 \tab 9  \tab 4   \tab 15 \tab       \tab \tab \cr
\link{giles.wheat}                 \tab 19  \tab    \tab     \tab 13 \tab       \tab 2 traits\tab gnm \cr
\link{gilmour.serpentine}          \tab 108 \tab    \tab 3   \tab    \tab       \tab xy, serpentine\tab asreml \cr
\link{gilmour.slatehall}           \tab 25  \tab    \tab 6   \tab    \tab       \tab xy \tab asreml \cr
\link{gomez.fractionalfactorial}   \tab     \tab    \tab 2   \tab    \tab 1/2 2^6 \tab xy \tab lm \cr
\link{gomez.groupsplit}            \tab 45  \tab    \tab 3   \tab    \tab 2     \tab xy, 3 gen groups \tab aov \cr
\link{gomez.heteroskedastic}       \tab 35  \tab    \tab 3   \tab    \tab       \tab hetero \tab \cr
\link{gomez.multilocsplitplot}     \tab 2   \tab 3  \tab 3   \tab    \tab       \tab rsm1,nitro \tab aov, lmer \cr
\link{gomez.nitrogen}              \tab     \tab    \tab 4   \tab    \tab 8     \tab \tab aov, contrasts \cr
\link{gomez.nonnormal1}            \tab     \tab    \tab 4   \tab    \tab 9     \tab log10 \tab lm \cr
\link{gomez.nonnormal2}            \tab 14  \tab    \tab 3   \tab    \tab       \tab sqrt \tab lm \cr
\link{gomez.nonnormal3}            \tab 12  \tab    \tab 3   \tab    \tab       \tab arcsin \tab lm \cr
\link{gomez.seedrate}              \tab     \tab    \tab 4   \tab    \tab 6     \tab rate \tab lm\cr
\link{gomez.splitplot.subsample}   \tab     \tab    \tab 3   \tab    \tab 8,4   \tab subsample \tab aov \cr
\link{gomez.splitsplit}            \tab 3   \tab    \tab 3   \tab    \tab       \tab xy, nitro, mgmt \tab aov, lmer \cr
\link{gomez.stripplot}             \tab 6   \tab    \tab 3   \tab    \tab       \tab xy, nitro \tab aov \cr
\link{gomez.stripsplitplot}        \tab 6   \tab    \tab 3   \tab    \tab       \tab xy, nitro\tab aov \cr
\link{gomez.wetdry}                \tab     \tab    \tab 3   \tab 2  \tab 5     \tab nitro\tab lmer \cr
\link{gotway.hessianfly}           \tab 16  \tab    \tab 4   \tab    \tab       \tab xy \tab lmer \cr
\link{goulden.latin}               \tab     \tab    \tab 5   \tab    \tab 5     \tab xy, latin \tab lm \cr
\link{goulden.splitsplit}          \tab 2   \tab    \tab 4   \tab    \tab 2*5   \tab xy, split \tab aov \cr
\link{graybill.heteroskedastic}    \tab 4   \tab 13 \tab     \tab    \tab       \tab hetero \tab \cr
\link{gregory.cotton}              \tab     \tab    \tab     \tab 2  \tab 4*3*2*2 \tab polar \tab \cr
\link{grover.diallel}              \tab     \tab    \tab 4   \tab    \tab 6*6   \tab diallel \tab lmDiallel \cr
\link{grover.rcb.subsample}        \tab     \tab    \tab 4   \tab 2  \tab 9     \tab subsample \tab aov \cr
\link{gumpertz.pepper}             \tab     \tab    \tab     \tab    \tab       \tab xy \tab glm\cr
\link{hadasch.lettuce}             \tab 89  \tab 3  \tab 3   \tab    \tab       \tab markers \tab asreml\cr
\link{hanks.sprinkler}             \tab 3   \tab    \tab 3   \tab    \tab       \tab xy \tab asreml\cr
\link{hayman.tobacco}              \tab 8   \tab    \tab 2   \tab 2  \tab       \tab diallel\tab asreml\cr
\link{hazell.vegetables}           \tab 4   \tab    \tab     \tab 6  \tab       \tab \tab linprog\cr
\link{heady.fertilizer}            \tab     \tab    \tab 2   \tab    \tab 9*9   \tab rsm2 \tab lm,rgl\cr
\link{hernandez.nitrogen}          \tab     \tab 5  \tab 4   \tab    \tab       \tab rsm1 \tab lm, nls\cr
\link{hildebrand.systems}          \tab     \tab 14 \tab     \tab    \tab 4     \tab \tab asreml\cr
\link{holshouser.splitstrip}       \tab 4   \tab    \tab 4   \tab    \tab 2*4   \tab rsm1,pop \tab lmer\cr
\link{huehn.wheat}                 \tab 20  \tab 10 \tab     \tab    \tab       \tab  \tab huehn\cr
\link{hughes.grapes}               \tab     \tab    \tab 3   \tab    \tab 6     \tab binomial \tab lmer, aod, glmm\cr
\link{hunter.corn}                 \tab     \tab 12 \tab     \tab 3  \tab 1     \tab rsm1 \tab xyplot \cr
\link{ivins.herbs}                 \tab 13  \tab    \tab 6   \tab    \tab       \tab 2 traits \tab lm, friedman\cr
\link{jansen.apple}                \tab 3   \tab    \tab 4   \tab    \tab 3     \tab binomial \tab glmer\cr
\link{jansen.carrot}               \tab 16  \tab    \tab 3   \tab    \tab 2     \tab binomial \tab glmer\cr
\link{jansen.strawberry}           \tab 12  \tab    \tab 4   \tab    \tab       \tab ordinal \tab mosaicplot\cr
\link{jayaraman.bamboo}            \tab 6   \tab 2  \tab 3   \tab    \tab       \tab heritability \tab lmer \cr
\link{jenkyn.mildew}               \tab     \tab    \tab 9   \tab    \tab 4     \tab \tab lm\cr
\link{john.alpha}                  \tab 24  \tab    \tab 3   \tab    \tab       \tab xy, alpha \tab lm, lmer \cr
\link{johnson.blight}              \tab     \tab    \tab     \tab 2  \tab       \tab \tab logistic \cr
\link{kang.maize}                  \tab 17  \tab 4  \tab     \tab 3  \tab 2,4   \tab \tab \cr
\link{kang.peanut}                 \tab 10  \tab 15 \tab 4   \tab    \tab       \tab \tab gge \cr
\link{karcher.turfgrass}           \tab     \tab    \tab 4   \tab    \tab 2,4   \tab ordinal \tab polr \cr
\link{keen.potatodamage}           \tab 6   \tab    \tab 4   \tab    \tab 2,3,8 \tab ordinal \tab mosaicplot,clmm \cr
\link{kempton.competition}         \tab 36  \tab    \tab 3   \tab    \tab       \tab xy, competition \tab lme AR1 \cr
\link{kempton.rowcol}              \tab 35  \tab    \tab 2   \tab    \tab       \tab xy, row-col \tab lmer \cr
\link{kling.augmented}             \tab 53  \tab    \tab 6   \tab    \tab       \tab xy, augmented \tab lmer\cr
\link{kempton.slatehall}           \tab 25  \tab    \tab 6   \tab    \tab       \tab xy \tab asreml, lmer\cr
\link{kirk.potato}                 \tab 21  \tab    \tab 15  \tab    \tab       \tab xy \tab \cr
\link{lee.potatoblight}            \tab 337 \tab    \tab 4   \tab 11 \tab       \tab xy, ordinal, repeated \tab \cr
\link{lehner.soybeanmold}          \tab     \tab 35 \tab     \tab 4  \tab 11    \tab \tab metafor, lmer \cr
\link{lillemo.wheat}               \tab 24  \tab 13 \tab     \tab 7  \tab       \tab qq \tab medpolish, huehn\cr
\link{lin.superiority}             \tab 33  \tab 12 \tab     \tab    \tab       \tab \tab superiority \cr
\link{lin.unbalanced}              \tab 33  \tab 18 \tab     \tab    \tab       \tab \tab superiority \cr
\link{linder.wheat}                \tab  9  \tab  7 \tab  4  \tab    \tab       \tab \tab gge\cr
\link{little.splitblock}           \tab     \tab    \tab 4   \tab    \tab 4,5   \tab xy, split-block\tab aov\cr
\link{lonnquist.maize}             \tab 11  \tab    \tab     \tab    \tab       \tab diallel \tab asreml \cr
\link{lyons.wheat}                 \tab     \tab 12 \tab     \tab 4  \tab       \tab \tab \cr
\link{lu.stability}                \tab 5   \tab 6  \tab     \tab    \tab       \tab \tab huehn\cr
\link{mcconway.turnip}             \tab 2   \tab    \tab 4   \tab    \tab 2,4   \tab hetero \tab aov, lme\cr
\link{mcleod.barley}               \tab     \tab 8  \tab     \tab    \tab  6    \tab \tab aggregate\cr
\link{mead.cauliflower}            \tab     \tab    \tab     \tab 2  \tab       \tab poisson \tab glm \cr
\link{mead.cowpea.maize}           \tab 3,2 \tab    \tab 3   \tab    \tab 4     \tab intercrop \tab \cr
\link{mead.germination}            \tab     \tab    \tab 4   \tab    \tab 4,4   \tab binomial\tab glm\cr
\link{mead.strawberry}             \tab 8   \tab    \tab 4   \tab    \tab       \tab \tab \cr
\link{mead.turnip}                 \tab     \tab    \tab 3   \tab    \tab 5,4   \tab \tab aov \cr
\link{miguez.biomass}              \tab 3   \tab    \tab 4   \tab    \tab       \tab \tab \cr
\link{minnesota.barley.weather}    \tab     \tab 6  \tab     \tab 10 \tab       \tab \tab \cr
\link{minnesota.barley.yield}      \tab 22  \tab 6  \tab     \tab 10 \tab       \tab \tab dotplot\cr
\link{omer.sorghum}                \tab 18  \tab 6  \tab 4   \tab    \tab       \tab \tab jags\cr
\link{onofri.winterwheat}          \tab 8   \tab    \tab 3   \tab 7  \tab       \tab \tab ammi\cr
\link{ortiz.tomato}                \tab 15  \tab 18 \tab     \tab    \tab 16     \tab env*gen~env*cov \tab pls \cr
\link{pacheco.soybean}             \tab 18  \tab 11 \tab     \tab    \tab       \tab \tab ammi\cr
\link{pederson.lettuce.repeated}   \tab     \tab    \tab 18  \tab    \tab 3     \tab \tab nlme\cr
\link{perry.springwheat}           \tab 28  \tab 5  \tab     \tab 4  \tab       \tab gain \tab lm,lmer,asreml\cr
\link{petersen.sorghum.cowpea}     \tab 2   \tab    \tab 4   \tab 7  \tab 4     \tab intercrop \tab \cr
\link{piepho.cocksfoot}            \tab 25  \tab    \tab     \tab 7  \tab       \tab \tab mumm\cr
\link{ratkowsky.onions}            \tab     \tab    \tab     \tab    \tab       \tab  \tab lm\cr
\link{reid.grasses}                \tab 4   \tab    \tab     \tab 3  \tab 21    \tab \tab nlme SSfpl \cr
\link{ridout.appleshoots}          \tab     \tab    \tab 30  \tab    \tab 2,4   \tab zip \tab zeroinfl\cr
\link{rothamsted.brussels}         \tab     \tab    \tab 4   \tab    \tab 6     \tab \tab \cr
\link{rothamsted.oats}             \tab     \tab    \tab 8   \tab    \tab 9     \tab rcb \tab \cr
\link{ryder.groundnut}             \tab 5   \tab    \tab 4   \tab    \tab       \tab xy, rcb \tab lm \cr
\link{salmon.bunt}                 \tab 10  \tab    \tab 2   \tab    \tab 20    \tab \tab betareg \cr
\link{senshu.rice}                 \tab     \tab 40 \tab     \tab    \tab       \tab \tab lm,Fieller \cr
\link{shafii.rapeseed}             \tab 6   \tab 14 \tab 3   \tab 3  \tab       \tab \tab biplot \cr
\link{shaw.oats}                   \tab 13  \tab 2  \tab 5   \tab 3  \tab       \tab \tab aov \cr
\link{sharma.met}                  \tab 7   \tab 3  \tab 3   \tab 2  \tab       \tab \tab FinlayWilkinson \cr
\link{silva.cotton}                \tab     \tab    \tab 5   \tab    \tab 5     \tab 5 traits \tab glm,poisson \cr
\link{sinclair.clover}             \tab     \tab    \tab     \tab    \tab 5,5   \tab rsm2,mitzerlich \tab nls,rgl \cr
\link{snedecor.asparagus}          \tab     \tab    \tab 4   \tab 4  \tab 4     \tab \tab split-plot, antedependence \cr
\link{snijders.fusarium}           \tab 17  \tab    \tab     \tab 3  \tab 4     \tab percent \tab glm/gnm,gammi \cr
\link{steptoe.morex.pheno}         \tab 152 \tab 16 \tab     \tab    \tab       \tab 10 traits \tab \cr
\link{steptoe.morex.geno}          \tab 150 \tab    \tab     \tab    \tab       \tab 223 markers, qtl \tab \cr
\link{streibig.competition}        \tab 2   \tab    \tab 3   \tab    \tab       \tab \tab glm \cr
\link{stroup.nin}                  \tab 56  \tab    \tab 4   \tab    \tab       \tab xy \tab asreml \cr
\link{stroup.splitplot}            \tab     \tab    \tab 4   \tab    \tab       \tab \tab asreml, MCMCglmm \cr
\link{student.barley}              \tab 2   \tab 51 \tab     \tab 6  \tab       \tab \tab lmer \cr
\link{tai.potato}                  \tab 8   \tab 3  \tab     \tab 2  \tab       \tab \tab tai \cr
\link{talbot.potato}               \tab 9   \tab 12 \tab     \tab    \tab       \tab gen*env~gen*trt \tab pls \cr
\link{theobald.barley}             \tab 3   \tab 5  \tab     \tab 2  \tab 5     \tab rsm1 \tab \cr
\link{theobald.covariate}          \tab 10  \tab 7  \tab 5   \tab    \tab       \tab cov \tab jags \cr
\link{thompson.cornsoy}            \tab     \tab 5  \tab     \tab 33 \tab       \tab repeated measures \tab aov \cr
\link{vaneeuwijk.fusarium}         \tab 20  \tab    \tab     \tab 4  \tab 7     \tab 3-way \tab aov \cr
\link{vaneeuwijk.drymatter}        \tab 6   \tab 4  \tab     \tab 7  \tab       \tab 3-way \tab aov,lmer \cr
\link{vaneeuwijk.nematodes}        \tab 11  \tab    \tab     \tab    \tab       \tab nonnormal,poisson \tab gnm, gammi \cr
\link{vargas.wheat1}               \tab 7   \tab    \tab     \tab 6  \tab       \tab gen*yr~gen*trt, yr*gen~yr*cov\tab pls \cr
\link{vargas.wheat2}               \tab 8   \tab 7  \tab     \tab    \tab       \tab env*gen~env*cov \tab pls \cr
\link{vargas.txe}                  \tab     \tab    \tab     \tab 10 \tab 24    \tab yr*trt~yr*cov \tab pls \cr
\link{verbyla.lupin}               \tab 9   \tab 8  \tab 3   \tab 2  \tab 7     \tab rsm1, xy, density\tab asreml\cr
\link{vold.longterm}               \tab     \tab    \tab     \tab 19 \tab 4     \tab rsm1 \tab nls,nlme \cr
\link{vsn.lupin3}                  \tab 336 \tab 3  \tab     \tab    \tab       \tab xy \tab asreml\cr
\link{wedderburn.barley}           \tab 10  \tab 9  \tab     \tab    \tab       \tab percent \tab glm/gnm \cr
\link{weiss.incblock}              \tab 31  \tab    \tab 6   \tab    \tab       \tab xy,incblock \tab asreml \cr
\link{weiss.lattice}               \tab 49  \tab    \tab 4   \tab    \tab       \tab xy,lattice \tab lm,asreml \cr
\link{welch.bermudagrass}          \tab     \tab    \tab     \tab    \tab 4,4,4 \tab rsm3, factorial \tab lm, jags \cr
\link{wheatley.carrot}             \tab     \tab    \tab 3   \tab    \tab 11    \tab \tab glm-binomial \cr
\link{yan.winterwheat}             \tab 18  \tab 9  \tab     \tab    \tab       \tab \tab gge,biplot \cr
\link{yang.barley}                 \tab 6   \tab 18 \tab     \tab    \tab       \tab \tab biplot \cr
\link{yates.missing}               \tab     \tab    \tab 10  \tab    \tab 3^2   \tab factorial \tab lm, pca \cr
\link{yates.oats}                  \tab 3   \tab    \tab 6   \tab    \tab       \tab xy,split,nitro\tab lmer
}

\bold{Time series}
\tabular{lllll}{
name                             \tab years \tab trt \tab other \tab model \cr
\link{byers.apple}               \tab     \tab    \tab \tab lme\cr
\link{broadbalk.wheat}           \tab 74  \tab 17 \tab \tab \cr
\link{hessling.argentina}        \tab 30  \tab    \tab temp,precip\tab \cr
\link{kreusler.maize}            \tab 4   \tab 5  \tab plant growth \tab \cr
\link{lambert.soiltemp}          \tab 1   \tab 7  \tab \tab \cr
\link{nass.barley}               \tab 146 \tab    \tab \tab \cr
\link{nass.corn}                 \tab 146 \tab    \tab \tab \cr
\link{nass.cotton}               \tab 146 \tab    \tab \tab \cr
\link{nass.hay}                  \tab 104 \tab    \tab \tab \cr
\link{nass.sorghum}              \tab 93  \tab    \tab \tab \cr
\link{nass.wheat}                \tab 146 \tab    \tab \tab \cr
\link{nass.rice}                 \tab 117 \tab    \tab \tab \cr
\link{nass.soybean}              \tab 88  \tab    \tab \tab \cr
\link{walsh.cottonprice}         \tab 34  \tab    \tab \tab cor

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
\link{usgs.herbicides}     \tab non-detect \cr
\link{wallace.iowaland}    \tab lm, choropleth \cr
\link{waynick.soil}        \tab spatial, nitro/carbon
}

Summaries:

Multi-environment trials with multi-genotype,loc,rep,year:
\tabular{llllllll}{
  name                               \tab gen \tab loc\tab reps\tab years \tab trt \tab other \tab model \cr
  \link{barrero.maize}               \tab 847  \tab 16 \tab 4  \tab 11  \tab 6  \tab \tab asreml\cr
  \link{edwards.oats}                \tab 80  \tab 5  \tab 3   \tab 7  \tab       \tab \tab \cr
  \link{gauch.soy}                   \tab 7   \tab 7  \tab 4   \tab 12 \tab       \tab \tab ammi \cr
  \link{george.wheat}                \tab 211 \tab 9  \tab 4   \tab 15 \tab       \tab \tab \cr
  \link{shafii.rapeseed}             \tab 6   \tab 14 \tab 3   \tab 3  \tab       \tab \tab biplot \cr
  \link{shaw.oats}                   \tab 13  \tab 2  \tab 5   \tab 3  \tab       \tab \tab aov \cr
  \link{verbyla.lupin}               \tab 9   \tab 8  \tab 3   \tab 2  \tab 7     \tab rsm1, xy, density\tab asreml
}

Data with markers:
hadasch.lettuce.markers,
steptoe.morex.geno

Data with pedigree:
butron.maize

}

\author{
  Kevin Wright, with support from many people who granted permission to include their data in this package.
}

\references{
  J. White and Frits van Evert. (2008).
  Publishing Agronomic Data.
  \emph{Agron J.} 100, 1396-1400.
  https://doi.org/10.2134/agronj2008.0080F
}

