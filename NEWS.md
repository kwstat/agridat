
Need to release desplot before agridat

## To do?

* Example for tai.potato
* Figure out best way to use jags
* JAGS code for lee.potatoblight
* JAGS code for theobald.barley
* JAGS code for besag.elbatan

## asreml4 todo
hanks.sprinkler
harris.wateruse
* john.alpha onward

# agridat 1.13 - unpublished

## New data for uniformity trials

christidis.wheat.uniformity, draper.safflower.uniformity,
holtsmark.timothy.uniformity, kalamkar.wheat.uniformity,
kiesselbach.oats.uniformity, lessman.sorghum.uniformity,
masood.rice.uniformity, mcclelland.corn.uniformity,
montgomery.wheat.uniformity, moore.polebean.uniformity,
moore.bushbean.uniformity, moore.sweetcorn.uniformity,
moore.carrots.uniformity, moore.springcauliflower.uniformity,
moore.fallcauliflower.uniformity, nonnecke.corn.uniformity,
nonnecke.peas.uniformity, parker.orange.uniformity,
polson.safflower.uniformity, sawyer.multi.uniformity, smith.beans.uniformity,
stickler.sorghum.uniformity, wiedemann.safflower.uniformity

## New data for stability, misc

lu.stability

becker.chicken, crampton.pig, battese.survey, christidis.competition,
gartner.corn, giles.wheat, gomez.heteroskedastic, gomez.nonnormal1,
gomez.nonnormal2, gomez.nonnormal3, gomez.wetdry, goulden.eggs,
goulden.splitsplit, gregory.cotton, hanover.whitepine, huehn.wheat,
kenward.cattle, kreusler.maize, lillemo.wheat, little.splitblock, mead.lambs,
omer.sorghum, onofri.winterwheat, tai.potato, wheatley.carrot

## Other notes

These data objects have been change from lists into tidy dataframes:
aastveit.barley, box.cork, ortiz.tomato, talbot.potato, vargas.txe,
vargas.wheat1, vargas.wheat2

Moved `desplot` function to package `desplot`.

Moved `gge` function to package `gge`.

Changed license to GPL-3 + file LICENSE.

Changed vignette from Rnw to Rmd.

Titles in Rd pages are more consistent.

Checked aspect ratio of field plot heatmaps where possible.

`devtools::run_examples()` now works even without suggested packages installed.

Fixed `dontrun` sections to work with  `devtools::run_examples(run=FALSE)`

Renamed besag.met to besag.corn.

Changed extensions in inst/files from .bug to .jag .

Added DOIs for most source references.

Removed most quote marks from data/*.txt files.

Changed all hyperlinks to plain text (faster checking, avoids re-direct errors).

# agridat 1.12 - Jun 2015

## New data

cochran.beets, cochran.lattice, jansen.apple, jansen.carrot

# agridat 1.11 - Mar 2015

## New data

besag.beans, besag.triticale, burgeuno.alpha, burgueno.rowcol,
burgueno.unreplicated, steptoe.morex.pheno

## Other

Removed `asreml` package from Suggests (due to CRAN check problems).

# agridat 1.10 - Nov 2014

## New data

beaven.barley, perry.springwheat, ridout.appleshoots

## Other

Move packages from Depends to Imports.

JAGS example added to welch.bermudagrass.

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

Use `if(require(lme4))` in examples.  Ripley request.

All data (almost) now have an example graphic.

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
gilmour.slatehall, john.alpha, ilra.sheep, kempton.slatehall, ryder.groundnut,
vsn.lupin3

# agridat 1.3 - Sep 2011

## New data

bridges.cucumber, cox.stripsplit, diggle.cow, eden.potato, gauch.soy,
graybill.heteroskedastic, hildebrand.systems, hanks.sprinkler,
mcconway.turnip, pearl.kernels, williams.barley.uniformity,
williams.cotton.uniformity

# agridat 1.2 - Jun 2011

## New data

aastveit.barley, gathmann.bt, kempton.competition, wedderburn.barley

# agridat 1.0 - Apr 2011

## First release to CRAN

## New data

allcroft.lodging, australia.soybean, batchelor.apple.uniformity,
batchelor.lemon.uniformity, batchelor.navel1.uniformity,
batchelor.navel2.uniformity, batchelor.valencia.uniformity,
batchelor.walnut.uniformity, besag.elbatan, besag.met, cochran.bib,
corsten.interaction, crowder.germination, denis.missing, durban.competition,
durban.rowcol, durban.splitplot, federer.tobacco, gilmour.serpentine,
gomez.fractionalfactorial, gomez.groupsplit, gomez.multilocsplitplot,
gomez.splitsplit, gomez.stripplot, gomez.stripsplitplot,
gomez.rice.uniformity, hughes.grapes, kempton.rowcol,
kempton.barley.uniformity, mead.strawberry, mercer.wheat.uniformity,
rothamsted.brussels, shafii.rapeseed, smith.uniformity3, stroup.nin,
stroup.splitplot, student.barley, talbot.potato, theobald.covariate,
thompson.cornsoy, vargas.wheat1, vargas.wheat2, verbyla.lupin, williams.trees,
wiebe.wheat.uniformity, yan.winterwheat, yates.missing, yates.oats,

# agridat 0.0 - Oct 2010

## Development begins
