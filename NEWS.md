
## Wish list / To do

* Example for tai.potato
* Figure out best way to use jags
* JAGS code for lee.potatoblight
* JAGS code for theobald.barley
* JAGS code for besag.elbatan

# agridat 1.13 (unpublished)

## New data for uniformity trials

draper.safflower.uniformity, holtsmark.timothy.uniformity,
lessman.sorghum.uniformity, masood.rice.uniformity,
montgomery.wheat.uniformity, moore.polebean.uniformity,
moore.bushbean.uniformity, moore.sweetcorn.uniformity,
moore.carrots.uniformity, moore.springcauliflower.uniformity,
moore.fallcauliflower.uniformity, nonnecke.corn.uniformity,
nonnecke.peas.uniformity, parker.orange.uniformity,
polson.safflower.uniformity, sawyer.multi.uniformity,
smith.beans.uniformity, wiedemann.safflower.uniformity

## New data for stability, misc

lu.stability

crampton.pig, battese.survey, gartner.corn, giles.wheat, goulden.eggs,
huehn.wheat, kenward.cattle, kreusler.maize, lillemo.wheat,
onofri.winterwheat, tai.potato, wheatley.carrot

## Other

* Moved `desplot` function to package `desplot`.
* Moved `gge` function to package `gge`.
* Examples now use `desplot` and `gge` packages.
* Switch to CC-BY-SA 4.0 + file LICENSE.  Similar to `igraphdata` package.
* Changed vignette from Rnw/pdf to Rmd/html.
* Improvements to titles in Rd pages.
* Added DOIs for most source references.
* Changed all hyperlinks to plain text (faster checking, avoids re-direct errors).
* Checked aspect of field plot heatmaps where possible.
* `devtools::run_examples()` now works even without suggested packages installed.
* Fixed `dontrun` sections to work with  `devtools::run_examples(run=FALSE)`

# agridat 1.12 - Jun 2015

## New data

cochran.beets, cochran.lattice, jansen.apple, jansen.carrot

# agridat 1.11 - Mar 2015

## New data

besag.beans, besag.triticale, burgeuno.alpha, burgueno.rowcol,
burgueno.unreplicated, steptoe.morex.pheno

## Other

* Removed (after adding) **asreml** package from Suggests (due to CRAN check problems).

# agridat 1.10 - Nov 2014

## New data

beaven.barley, perry.springwheat, ridout.appleshoots

## Other

* Move packages from Depends to Imports.
* JAGS example added to welch.bermudagrass.

# agridat 1.9 - Jul 2014

## New data

beall.webworms, besag.endive, brandt.switchback, butron.maize,
carlson.germination, cochran.factorial, connolly.potato, cornelius.maize,
cullis.earlygen, fisher.latin, foulley.calving, fox.wheat,
gomez.splitplot.subsample, goulden.latin, gumpertz.pepper, harrison.priors,
hazell.vegetables, heady.fertilizer, holland.arthropods, hunter.corn,
jansen.strawberry, kalamkar.potato.uniformity, kang.maize, kang.peanut,
karcher.turfgrass, keen.potatodamage, lasrosas.corn, lee.potatoblight,
lonnquist.maize, lucas.switchback, maindonald.barley, mead.cauliflower,
mercer.mangold.uniformity, patterson.switchback, piepho.cocksfoot,
sinclair.clover, snijders.fusarium, stirret.borers, theobald.barley,
turner.herbicide, vargas.txe, vold.longterm, wallace.iowaland,
walsh.cottonprice, wassom.brome.uniformity, welch.bermudagrass,
weiss.incblock, weiss.lattice, yang.barley

## Other

* Use `if(require(lme4))` in examples.  Ripley request.
* All data (almost) now have an example graphic.

# agridat 1.8 - Sep 2013

## New data

brandle.rape, salmon.bunt

# agridat 1.7 - Sep 2013

## New data

baker.barley.uniformity, bliss.borers, bond.diallel, harris.wateruse,
hayman.tobacco, holshouser.splitstrip, pearce.apple, waynick.soil

# agridat 1.6 - June 2013

## New data

crossa.wheat, garber.multi.uniformity, gomez.nitrogen,
harris.multi.uniformity, hughes.grapes, li.millet.uniformity, odland.soybean.uniformity,
odland.soyhay.uniformity, ratkowsky.onions, stephens.sorghum.uniformity

# agridat 1.5 - Apr 2013

## New data

adugna.sorghum, ars.earlywhitecorn96, besag.bayesian, box.cork,
broadbalk.wheat, byers.apple, caribbean.maize, carmer.density, cate.potassium,
cleveland.soil, cochran.eelworms, cochran.wireworms, fan.stability,
gomez.seedrate, gotway.hessianfly, goulden.barley.uniformity,
henderson.milkfat, hernandez.nitrogen, hessling.argentina,
immer.sugarbeet.uniformity, ivins.herbs, jenkyn.mildew, johnson.blight,
lambert.soiltemp, lavoranti.eucalyptus, lyon.potato.uniformity, lyons.wheat,
mead.cowpeamaize, mead.germination, minnesota.barley.weather,
minnesota.barley.yield, nebraska.farmincome, nass.barley, nass.corn,
nass.cotton, nass.hay, nass.rice, nass.sorghum, nass.soybean, nass.wheat,
ortiz.tomato, pacheco.soybean, senshu.rice, snedecor.asparagus,
streibig.competition, zuidhof.broiler

# agridat 1.4 - Mar 2012

## New data

archbold.apple, blackman.wheat, cochran.crd, cochran.latin, darwin.maize,
denis.ryegrass, digby.jointregression, engelstad.nitro, federer.diagcheck,
gilmour.slatehall, john.alpha, ilra.sheep, kempton.slatehall,
ryder.groundnut, steel.soybean, vsn.lupin3

# agridat 1.3 - Sep 2011

## New data

bridges.cucumber, cox.stripsplit, diggle.cow, eden.potato, gauch.soy,
graybill.heteroskedastic, hildebrand.systems,
hanks.sprinkler, mcconway.turnip, pearl.kernels,
williams.barley.uniformity, williams.cotton.uniformity

# agridat 1.2 - Jun 2011

## New data

aastveit.barley, gathmann.bt, kempton.competition, wedderburn.barley

# agridat 1.0 - Apr 2011

## First release to CRAN.

# agridat 0.0 - Oct 2010

## Development begins.
