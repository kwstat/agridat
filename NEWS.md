
## Wish list

* JAGS code for lee.potatoblight
* JAGS code for theobald.barley
* JAGS code for besag.elbatan


# agridat 1.13 (unpublished)

## New data

gartner.corn, kenward.cattle, montgomery.wheat.uniformity, wheatley.carrot

## Other

* Switch to CC-BY-SA 4.0 + file LICENSE.  Similar to igraphdata package.
* Change vignette from Rnw/pdf to Rmd/html.
* New function `papcov()` to make nearest neighbor Papadakis covariates.
* `devtools::run_examples()` now works even without suggested packages installed.

# agridat 1.12 - Jun 2015

## New data

cochran.beets, cochran.lattice, jansen.apple, jansen.carrot
  
## Other

* Fixed bug with `desplot( , show.key=FALSE)`
* Changed Jstor links to be plain text.
* Add graphics, grDevices, stats to Imports.

# agridat 1.11 - Mar 2015

## New data

besag.beans, besag.triticale, burgeuno.alpha, burgueno.rowcol,
burgueno.unreplicated, steptoe.morex.pheno

## Other

* Removed non-CRAN package pcaMethods from Imports.
* R-code `nipals()` function for principal components with missing data.
* Removed (after adding) **asreml** package from Suggests (due to CRAN check problems).

# agridat 1.10 - Nov 2014

## New data

beaven.barley, perry.springwheat, ridout.appleshoots

## Other

* Move packages from Depends to Imports.
* JAGS example added to welch.bermudagrass.
* Moved `vc()` function to the **lucid** package.

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
walsh.cottonprice, wassom.brome1.uniformity, welch.bermudagrass,
weiss.incblock, weiss.lattice, yang.barley

## Other

* Function `vc()` to extract variance component estimates from mixed models.
* Function `gge()` to fit and plot GGE biplots.
* Use `if(require(lme4))` in examples.  Ripley request.
* hayman.diallel is now hayman.tobacco
* besag.met now includes missing values (to form complete rectangles).
* All data (almost) now have an example graphic.

# agridat 1.8 - Sep 2013

## New data

brandle.rape, salmon.bunt

# agridat 1.7 - Sep 2013

## New data

baker.barley.uniformity, bliss.borers, bond.diallel, harris.wateruse,
hayman.diallel, holshouser.splitstrip, pearce.apple, waynick.soil

# agridat 1.6 - June 2013

## New data

crossa.wheat, garber.multi.uniformity, gomez.nitrogen,
harris.multi.uniformity, li.millet.uniformity, odland.soybean.uniformity,
odland.soyhay.uniformity, ratkowsky.onions, stephens.sorghum.uniformity

## Other

* All uniformity trials now include `uniformity` in the data name.

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

## Other

* Removed rgl and rjags from Suggests to facilitate cross-platform checking

# agridat 1.4 - Mar 2012

## New data

archbold.apple, blackman.wheat, cochran.crd, cochran.latin, darwin.maize,
denis.ryegrass, digby.jointregression, engelstad.nitro, federer.diagcheck,
gilmour.slatehall, john.alpha, ilra.sheep, kempton.slatehall,
ryder.groundnut, steel.soybean, vsn.lupin3

# agridat 1.3 - Sep 2011

## New data

bridges.cucumber, cox.stripsplit, diggle.cow, eden.potato, gauch.soy,
graybill.heteroskedastic, hanks.sprinkler, mcconway.turnip, pearl.kernels,
williams.barley.uniformity, williams.cotton.uniformity

# agridat 1.2 - Jun 2011

## New data

aastveit, gathmann.bt, kempton.competition, wedderburn.barley

# agridat 1.0 - Apr 2011

## First release to CRAN.

# agridat 0.0 - Oct 2010

## Development begins.
