% agridat notes

## To do

* Add Baker 1953 Strawberry data
* UNL Library: Love, " 	Experimental methods in agricultural research". East Campus library: Call: S541 .L6 .
* Interactive datatable https://github.com/rstudio/DT
* Add CV function?
* Need graphic for tai.potato
* Need graphic for yang.barley
* Figure out best way to use jags
* JAGS code for edwards.oats
* JAGS code for lee.potatoblight
* JAGS code for theobald.barley
* JAGS code for besag.elbatan
* Note: R_MAX_NUM_DLLS=150
* Rcmd check --run-dontrun before release
  devtools::run_examples(run=FALSE, start="butron.maize")


Do NOT use Roxygen to document data, because it will complain about data/*.txt files with error messages like:
Error: 'uscrime' is not an exported object from 'namespace:agridat'


## Genomes To Fields project has 
public data for 500 genotypes in multiple environments.
    www.genomes2fields.org
https://www.genomes2fields.org/publications/
https://bmcresnotes.biomedcentral.com/articles/10.1186/s13104-018-3508-1    http://datacommons.cyverse.org/browse/iplant/home/shared/commons_repo/curated/Carolyn_Lawrence_Dill_G2F_Nov_2016_V.3
    



Meta analysis example
https://www.nature.com/articles/s41598-018-21284-2#Sec18

# ----------------------------------------------------------------------------

This document lists notes about data sources searched and additional sources of agricultural data.  Although this is an .md file, the formatting is best viewed in plain text mode.

---

QTL analysis using Integrated Breeding Platform.  https://www.integratedbreeding.net/165/training/bms-user-manual/qtl-analysis CC-BY-SA license

---

Henry Wallace archive at Univ Iowa Library
http://www.lib.uiowa.edu/sc/location-and-hours/
Henry Wallace research papers
http://aspace.lib.uiowa.edu/repositories/2/archival_objects/400608
500 Ear experiment. Might be the data for "What is in the corn judge's mind" paper
http://aspace.lib.uiowa.edu/repositories/2/archival_objects/400615

---

rpathanalysis
http://cucurbitbreeding.com/todd-wehner/publications/software-sas-r-project/

# wanted

Plant-level data for distinctness, uniformity and stability testing.  Most published data is for plot-means.
This page mentions an R version for DUS: http://www.bioss.ac.uk/knowledge/software.html



# stability


# done
adugna.sorghum 28g,13l,5y
brandle.rape 5g,9l,3y
denis.missing 5g,26e
digby.jointregression 10g,17l
fan.stability 13g,10l,2y
hildebrand.systems
huehn.wheat 20g,10e 
lu.stability 5g,6e
pieopho.cocksfoot 25g,7y
williams.trees 37g,6l

# todo ?
kamidi 11g,7l 
lin.balanced 33g,12l 
lin.unbalanced 33g,18l

Oakey, Cullis, Thompson
http://www.g3journal.org/content/early/2016/03/10/g3.116.027524
http://www.g3journal.org/content/6/5/1313/suppl/DC1

---

Jose Crossa papers http://repository.cimmyt.org/xmlui/handle/10883/1/browse?value=Crossa,%20J.&type=author 
Meta-r http://repository.cimmyt.org/xmlui/handle/10883/4130 
Data http://repository.cimmyt.org/xmlui/handle/10883/4036 
http://repository.cimmyt.org/xmlui/handle/10883/2976 
http://repository.cimmyt.org/xmlui/handle/10883/1380 
http://repository.cimmyt.org/xmlui/handle/10883/4128 http://repository.cimmyt.org/xmlui/handle/10883/4290

---

Review of meta-analyses in agronomy http://www6.versailles-grignon.inra.fr/agronomie/Meta-analysis-in-agronomy/References

Richard Plant http://www.plantsciences.ucdavis.edu/plant/qgislabs.htm CC-SA license

MapCalc http://www.innovativegis.com/basis/ Joseph Berry.  Looks interesting, free for education.  Center pivot data.

Analyzing Precision Ag Data <-- interesting workshop 
http://www.innovativegis.com/basis/Books/AnalyzingPAdata/Default.htm http://www.innovativegis.com/basis/Books/AnalyzingPAdata/PA_download/Support_materials/Default.htm http://www.innovativegis.com/basis/Books/AnalyzingPAdata/PA_download/Default.htm

http://www.innovativegis.com/basis/pfprimer/Appendix_D/Appendix_D.htm http://www.innovativegis.com/basis/pfprimer/Topic4/Topic4.htm

# Papers

Biplot/StdErr/
VanEeuwijk 1993 - Incorporating env info Biplot
Bartkowiak GxE table GE folder: Crossa 1997

Stability folder 
Fan 2007 - Yield stability of maize GxE 
Flores 1998 Flores 1998 - bean & pea yields, Flores 2012, Flores 2013


## Malosetti 2013
F2 data.
Folder: GE http://www.frontiersin.org/Plant_Physiology/10.3389/fphys.2013.00044/abstract CC license:


## da Silva
A Bayesian Shrinkage Approach for AMMI Models http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0131414#pone-0131414-t001 CC-BY. Partial code, data.


## Perez
Comparison Between Linear and Non-parametric Regression Models for Genome-Enabled Prediction in Wheat https://www.scienceopen.com/document/vid/4017fb51-381c-4374-93aa-608423df4004;jsessionid=0TLjjSbaooSUk1y3JKd4nUeb.master:so-app1-prd 
Data: http://www.g3journal.org/content/suppl/2012/12/05/2.12.1595.DC1 All content has CC license


# Other
Many interesting pages.  Non-open license...?
Lecture and data http://articles.extension.org/plant_breeding_genomics http://articles.extension.org/pages/68660/plant-breeding-and-genomics-learning-lessons http://articles.extension.org/pages/60430/introduction-to-the-augmented-experimental-design-webinar http://articles.extension.org/pages/61006/estimating-heritability-and-blups-for-traits-using-tomato-phenotypic-data <---
http://articles.extension.org/pages/68019/genomic-relationships-and-gblup
http://pbgworks.org/node/1440


# Items below have been reviewed for data sources

# Journals

## Agronomy Journal
Skimmed Vol 1


## The American Statistician
Vol 1-13


## Biometrics. Skimmed 1947-2006
http://www.jstor.org/action/showPublication?journalCode=biometrics


## The Empire Journal of Experimental Agriculture
http://archive.org  Vol 3-5, 23-24 26


## Field Crops Research. 
http://www.sciencedirect.com/science/journal/03784290/157 Vol 1-40


## IASRI newsletters
http://www.iasri.res.in/NewsLetters/nl.HTM

## Indian Journal of Agricultural Science
```
Vol 1. 309
Vol 2. 53 694
Vol 3. 544 5 varieties, 2 blocks, 4 reps/block
Vol 4. 
Vol 5. 579. Multi-year uniformity trial. agridat::bose.multi.uniformity
Vol 6. Pg 85 has 4-way factorial with whole-plot date, but non-contiguous sub-plots.
Vol 9.
Vol 10.
Vol 11. 
Vol 12. 240. Wheat uniformity trial. agridat::iyer.wheat.uniformity
Vol 14. 315 
Vol 16.
Vol 17.
Vol 19.
```

## JABES
Vol 6.


## Journal of the American Society of Agronomy

Vol 23.

## Journal of the Indian Society of Agricultural Statistics
http://www.isas.org.in/jsp/onlinejournal.jsp Skimmed: Vol 50-56


## JRSSA


## JRSSB 1940-1997
http://www.jstor.org/action/showPublication?journalCode=jroyastatsocise4 Datasets 1998-2015 http://onlinelibrary.wiley.com/journal/10.1111/(ISSN)1467-9868/homepage/seriesb_datasets.htm http://onlinelibrary.wiley.com/journal/10.1111/%28ISSN%291467-985X/homepage/datasets_all_series.htm


## JRSSC Applied Statistics datasets
http://onlinelibrary.wiley.com/journal/10.1111/%28ISSN%291467-985X/homepage/datasets_all_series.htm 1998-2015


## Tidsskrift for Planteavl 1895-1992
http://dca.au.dk/publikationer/historiske/planteavl/


# Books

## Maize International Testing 1982. CIMMYT.
http://pdf.usaid.gov/pdf_docs/PNAAQ389.pdf


## Nebraska Agricultural Experiment Station Annual Report
Vol 19-24, 1906-1911 https://books.google.com/books?id=HBlJAAAAMAAJ
Vol 25, 1912 https://books.google.com/books?id=M-5BAQAAMAAJ


## Iowa State University Library Special Collections

Helen Elizabeth Conners (1951).
Field plot techniques for sweet potatoes obtained from uniformity trial data. Master's Thesis.
No data given.

Robert LeRoy Plaisted (1954).
Field plot techniques for estimating onion yields. Master's Thesis.
No data given.

Michael Holle. 1960.
Plot technique for field evaluation of three characters in the lima bean. Master's Thesis.
No data given.

Howard Lewis Taylor (1951).
The effect of plot shape on experimental error. Master's Thesis.
No data given. Used data from a corn uniformity trial, oats uniformity, and the data of Fairfield Smith. Smaller experimental errors were found for long narrow plots.

# Classes


## Hernandez
http://www.soils.umn.edu/academics/classes/soil4111/hw/ 
Available on Wayback. Yield monitor data for two fields with soils layer.


## Jack Weiss
Ecol 563 Stat Meth in Ecology 
http://www.unc.edu/courses/2010fall/ecol/563/001/ 
Env Studies 562 Stat for Envt Science 
http://www.unc.edu/courses/2010spring/ecol/562/001/ 
Ecol 145 
http://www.unc.edu/courses/2006spring/ecol/145/001/docs/lectures.htm


# Journals / Proceedings


## Applied Statistics in Agriculture
http://newprairiepress.org/agstatconference/ 
1989-2014


## Computers and Electronics in Agriculture.
http://www.sciencedirect.com/science/journal/01681699/103 
Vol 1-110


## Journal of Agricultural Science
https://www.cambridge.org/core/journals/journal-of-agricultural-science/all-issues
1900-2016


## Experimental Agriculture
https://www.cambridge.org/core/journals/experimental-agriculture
1965-2016


## SAS Global Forum
http://support.sas.com/events/sasglobalforum/previous/online.html 
22-31, 2007-2013

------------------------------------------------------------------------------

# Uniformity trials

## Checked
Sands 1954. A Determination ot Optimum Plot Size for Estimating Mean Number of Bolls. 
Stickler 1960. Estimates of optimum plot size from grain sorghum uniformity trial data. 

## Not found
bonazzi 1933 errors in field experimentation with ratoon cane
