# agridat 1.24 (unpublished)

## New datasets added

* haritonenko.sugarbeet.uniformity
* jegorow.oats.uniformity
* jurowski.wheat.uniformity
* roemer.sugarbeet.uniformity
* tulaikow.wheat.uniformity

## Other notes

* baker.strawberry.uniformity: inserted 3 blank columns to more closely align with the experiment layout.

* shafi.tomato.uniformity: Had incorrect yield scale, now divided by 1000.

* odland.soyhay.uniformity: Yields have been divided by 10 so that the yield values are now tons instead of 0.1 tons.



# agridat 1.23 (2024-01-30)

## New datasets added

## Other notes

* Removed suggested use of sf/terra packages in examples.

* Add `if(require("asreml", quietly=TRUE))` to example sections. This way we can allow people (or GitHub Actions) to force run the `dontrun` sections, even if `asreml` is not installed.

* cochran.eelworms - Fix a typo reported by U.Genschel, and added more columns for grain yield, straw yield, weeds. Updates to documentation.

* gartner.corn - Remove 'rgdal' package from example (Issue #11).


# agridat 1.22 (2023-08-24)

## New datasets added

* bailey.cotton.uniformity
* belamkar.augmented (augmented design at multiple locations)
* chakravertti.factorial (3 block, 3x5x3x3 factorial is a large factorial experiment)
* coombs.rice.uniformity 
* evans.sugarcane.uniformity (Data from Rothamsted archive)
* forster.wheat.uniformity
* goulden.barley.uniformity (expanded from the previously published 20x20 to 48x48)
* hansen.multi.uniformity (multi-year uniformity trials)
* heath.cabbage.uniformity
* hutchinson.cotton.uniformity (Data from Rothamsted archive)
* immer.sugarbeet.uniformity (add year 1931 results from Rothamsted archive)
* khan.brassica.uniformity
* kirk.potato (20 varieties with 15 reps)
* mckinstry.cotton.uniformity (Data from Rothamsted archive)
* payne.wheat (long term rotation experiment)
* riddle.wheat (Modified Latin Square, "significant" variety switches high/low)
* saunders.maize.uniformity (Data from Rothamsted archive)
* smith.wheat.uniformity (classic data for measuring field heterogeneity)
* summerby.multi.uniformity
* tesfaye.millet (GxE dataset with multiple reps, xy coordinates)
* vishnaadevi.rice.uniformity

## Other notes

* Switched the package to MIT license.

* Modified factorial-experiment datasets to separate the treatment factors into individual treatment factors.

* Add docType{package} fix for CRAN.

* Removed 'donttest' for some examples.


# agridat 1.21 (2022-06-15)

## New datasets added

* bachmaier.quadratic (confidence intervals for optimum of quadratic)
* ducker.groundnut.uniformity
* kling.augmented (augmented design)
* sharma.met (Finlay-Wilkinson regression)


# agridat 1.20 (2021-12-20)

## New datasets added

* arankacami.groundnut.uniformity
* barrero.maize
* buntaran.wheat
* gomez.heterogeneity
* grover.diallel
* grover.rcb.subsample
* hadasch.lettuce
* hadasch.lettuce.markers
* jones.corn.uniformity
* petersen.sorghum.cowpea
* woodman.pig

## Other notes

* Re-named mead.cowpeamaize to mead.cowpea.maize.

* Re-named correa.soybean.uniformity to dasilva.soybean.uniformity.

* There are more than 200 URLs in the vignettes and these were slow to check and generated too many false warnings. Stopped the Rmd to html conversion from creating URL links via an option in the Rmd YAML.


# agridat 1.18 (2021-01-12)

## New datasets added

* damesa.maize
* jayaraman.bamboo
* nair.turmeric.uniformity
* shafi.tomato.uniformity


# agridat 1.17 (2020-08-03)

## New datasets added

alwan.lamb, baker.strawberry.uniformity, besag.checks, bryan.corn.uniformity, davidian.soybean, devries.pine, edwards.oats, george.wheat, hartman.tomato.uniformity, heath.radish.uniformity, johnson.douglasfir, kayad.alfalfa, kerr.sugarcane.uniformity, laycock.tea.uniformity, lehmann.millet.uniformity, linder.wheat, loesell.bean.uniformity, miguez.biomass, obsi.potato.uniformity, paez.coffee.uniformity, pederson.lettuce.repeated, piepho.barley.uniformity, rothamsted.oats, shaw.oats, wyatt.multi.uniformity

## Other notes

* Examples now use asreml version 4.

* Re-named hutchinson.cotton.uniformity to panse.cotton.uniformity.

* Added INLA example to crowder.seeds.

* Wrapped most example sections with `dontrun`.

* New function `libs()`, which is basically the same as `pacman::p_load()`, but without the dependency on `pacman`.

* Example sections now use `library(agridat)` and then `libs()` to load all other packages on the fly if needed.

* Website built with `pkgdown`.



# agridat 1.16 (2018-07-06)

* Minor release to make a small change for the next release of the `broom` package.


# agridat 1.15 (2018-06-28)

## New datasets added

ansari.wheat.uniformity, baker.wheat.uniformity, bancroft.peanut.uniformity, bose.multi.uniformity, christidis.cotton.uniformity, dasilva.soybean.uniformity, davies.pasture.uniformity, eden.tea.uniformity, hutchinson.cotton.uniformity, igue.sugarcane.uniformity, kulkarni.sorghum.uniformity, lander.multi.uniformity, lord.rice.uniformity, magistad.pineapple.uniformity, nagai.strawberry.uniformity, narain.sorghum.uniformity, robinson.peanut.uniformity, sayer.sugarcane.uniformity, strickland.apple.uniformity, strickland.grape.uniformity, strickland.peach.uniformity, strickland.tomato.uniformity

dasilva.maize, mead.turnip

## Other notes

* nonnecke.corn.uniformity is renamed nonnecke.sweetcorn.uniformity

* moore.carrots.uniformity is renamed moore.carrot.uniformity

* Switch from `lsmeans` to `emmeans` in examples.



# agridat 1.13 (2017-11-30)

## New datasets added for uniformity trials

bradley.multi.uniformity, christidis.wheat.uniformity, day.wheat.uniformity, draper.safflower.uniformity, holtsmark.timothy.uniformity, iyer.wheat.uniformity, kadam.millet.uniformity, kalamkar.wheat.uniformity, khin.rice.uniformity, kiesselbach.oats.uniformity, kristensen.barley.uniformity, lessman.sorghum.uniformity, love.cotton.uniformity, masood.rice.uniformity, mcclelland.corn.uniformity, montgomery.wheat.uniformity, moore.polebean.uniformity, moore.bushbean.uniformity, moore.sweetcorn.uniformity, moore.carrot.uniformity, moore.springcauliflower.uniformity, moore.fallcauliflower.uniformity, nonnecke.corn.uniformity, nonnecke.peas.uniformity, parker.orange.uniformity, polson.safflower.uniformity, sawyer.multi.uniformity, smith.beans.uniformity, stickler.sorghum.uniformity, wiedemann.safflower.uniformity

## New datasets added for stability

fisher.barley, lu.stability, tai.potato

## New datasets added

acorsi.grayleafspot, becker.chicken, chinloy.fractionalfactorial, cramer.cucumber, crampton.pig, battese.survey, christidis.competition, depalluel.sheep. eden.nonnormal, gartner.corn, giles.wheat, gomez.heteroskedastic, gomez.nonnormal1, gomez.nonnormal2, gomez.nonnormal3, gomez.wetdry, goulden.eggs, goulden.splitsplit, gregory.cotton, hanover.whitepine, harvey.lsmeans, harville.lamb, huehn.wheat, kenward.cattle, kreusler.maize, lehner.soybeanmold, lillemo.wheat, lin.superiority, lin.unbalanced, little.splitblock, mead.lamb, omer.sorghum, onofri.winterwheat, reid.grasses, silva.cotton, urquhart.feedlot, usgs.herbicides, vaneeuwijk.fusarium, vaneeuwijk.nematodes, vaneeuwijk.drymatter, wheatley.carrot

## Other notes

* The following data objects have been changed from lists of 2 matrices into tidy dataframes: aastveit.barley, box.cork, ortiz.tomato, talbot.potato, vargas.txe, vargas.wheat1, vargas.wheat2

* Checked aspect ratio of field plot heatmaps where possible.

* `devtools::run_examples()` now works even without suggested packages installed.

* Changed extensions in inst/files from .bug to .jag .

* Changed all hyperlinks to plain text (for faster checking, avoids re-direct errors).

* Replaced use of `gam` package in examples, in favor of `mgcv` package.

* Added package logo on github.



# agridat 1.12 (2015-06-29)

## New datasets added

* cochran.beets
* cochran.lattice
* jansen.apple
* jansen.carrot


# agridat 1.11 (2015-03-03)

## New datasets added

* besag.beans
* besag.triticale
* burgeuno.alpha
* burgueno.rowcol
* burgueno.unreplicated
* steptoe.morex.pheno

## Other

* Removed `asreml` package from Suggests (due to CRAN check problems).



# agridat 1.10 (2014-11-26)

## New datasets added

beaven.barley, perry.springwheat, ridout.appleshoots

## Other

* Move packages from Depends to Imports.



# agridat 1.9 (2014-07-02)

## New datasets added

beall.webworms, besag.endive, brandt.switchback, butron.maize, carlson.germination, cochran.factorial, connolly.potato, cornelius.maize, cullis.earlygen, fisher.latin, foulley.calving, fox.wheat, gomez.splitplot.subsample, goulden.latin, gumpertz.pepper, harrison.priors, hazell.vegetables, heady.fertilizer, holland.arthropods, hunter.corn, jansen.strawberry, kalamkar.potato.uniformity, kang.maize, kang.peanut, karcher.turfgrass, keen.potatodamage, lasrosas.corn, lee.potatoblight, lonnquist.maize, lucas.switchback, maindonald.barley, mead.cauliflower, mercer.mangold.uniformity, patterson.switchback, piepho.cocksfoot, sinclair.clover, snijders.fusarium, stirret.borers, theobald.barley, turner.herbicide, vargas.txe, vold.longterm, wallace.iowaland, walsh.cottonprice, wassom.brome.uniformity, welch.bermudagrass, weiss.incblock, weiss.lattice, yang.barley

## Other

* Use `if(require(lme4))` in examples.  B.Ripley request.

* All data (almost) now have an example graphic.



# agridat 1.8 (2013-09-23)

## New datasets added

* brandle.rape
* salmon.bunt



# agridat 1.7 (2013-09-06)

## New datasets added

* baker.barley.uniformity
* bliss.borers
* bond.diallel
* harris.wateruse
* hayman.tobacco
* holshouser.splitstrip
* pearce.apple
* waynick.soil



# agridat 1.6 (2013-06-04)

## New datasets added

crossa.wheat, garber.multi.uniformity, gomez.nitrogen, harris.multi.uniformity, hughes.grapes, li.millet.uniformity, odland.soybean.uniformity, odland.soyhay.uniformity, ratkowsky.onions, stephens.sorghum.uniformity



# agridat 1.5 (2013-04-26)

## New datasets added

adugna.sorghum, ars.earlywhitecorn96, besag.bayesian, box.cork, broadbalk.wheat, byers.apple, caribbean.maize, carmer.density, cate.potassium, cleveland.soil, cochran.eelworms, cochran.wireworms, fan.stability, gomez.seedrate, gotway.hessianfly, goulden.barley.uniformity, henderson.milkfat, hernandez.nitrogen, hessling.argentina, immer.sugarbeet.uniformity, ivins.herbs, jenkyn.mildew, johnson.blight, lambert.soiltemp, lavoranti.eucalyptus, lyon.potato.uniformity, lyons.wheat, mead.cowpeamaize, mead.germination, minnesota.barley.weather, minnesota.barley.yield, nebraska.farmincome, nass.barley, nass.corn, nass.cotton, nass.hay, nass.rice, nass.sorghum, nass.soybean, nass.wheat, ortiz.tomato, pacheco.soybean, senshu.rice, snedecor.asparagus, streibig.competition, zuidhof.broiler



# agridat 1.4 (2012-03-14)

## New datasets added

archbold.apple, blackman.wheat, cochran.crd, cochran.latin, darwin.maize, denis.ryegrass, digby.jointregression, engelstad.nitro, federer.diagcheck, gilmour.slatehall, john.alpha, ilra.sheep, kempton.slatehall, ryder.groundnut, vsn.lupin3



# agridat 1.3 (2011-10-20)

## New datasets added

bridges.cucumber, cox.stripsplit, diggle.cow, eden.potato, gauch.soy, graybill.heteroskedastic, hildebrand.systems, hanks.sprinkler, mcconway.turnip, pearl.kernels, williams.barley.uniformity, williams.cotton.uniformity



# agridat 1.2 (2011-06-30)

## New datasets added

aastveit.barley, gathmann.bt, kempton.competition, wedderburn.barley



# agridat 1.0 (2011-04-27)

* First release to CRAN

## New datasets added

allcroft.lodging, australia.soybean, batchelor.apple.uniformity, batchelor.lemon.uniformity, batchelor.navel1.uniformity, batchelor.navel2.uniformity, batchelor.valencia.uniformity, batchelor.walnut.uniformity, besag.elbatan, besag.met, cochran.bib, corsten.interaction, crowder.germination, denis.missing, durban.competition, durban.rowcol, durban.splitplot, federer.tobacco, gilmour.serpentine, gomez.fractionalfactorial, gomez.groupsplit, gomez.multilocsplitplot, gomez.splitsplit, gomez.stripplot, gomez.stripsplitplot, gomez.rice.uniformity, hughes.grapes, kempton.rowcol, kempton.barley.uniformity, mead.strawberry, mercer.wheat.uniformity, rothamsted.brussels, shafii.rapeseed, smith.uniformity3, stroup.nin, stroup.splitplot, student.barley, talbot.potato, theobald.covariate, thompson.cornsoy, vargas.wheat1, vargas.wheat2, verbyla.lupin, williams.trees, wiebe.wheat.uniformity, yan.winterwheat, yates.missing, yates.oats



# agridat 0.0 (2010-10-01)

* Development begins
