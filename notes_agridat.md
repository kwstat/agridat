---
title: "agridat notes"
---

# License note

Substantial effort has been made to contact authors of papers published within the past few decades to secure permission to use data in this package.

In the U.S., raw data are not generally subject to copyright. See
\url{http://www.lib.umich.edu/copyright-office-mpublishing/copyrightability-charts-tables-and-graphs}
and \url{http://sciencecommons.org/about/towards} for some discussion.

Data produced from work of the United States government
(including the U.S. Department of Agriculture) are not subject to copyright.
\url{http://en.wikipedia.org/wiki/Copyright_status_of_work_by_the_U.S._government}

Creative Commons licenses can apply to the \emph{structure} of a database, but not to the factual data. \url{https://wiki.creativecommons.org/wiki/Data}

---------------------------------------------------------------------------


## To do

* change theobald.covariate from JAGS to brms?
* Figure out best way to use jags
* Note: R_MAX_NUM_DLLS=150
* Rcmd check --run-dontrun before release
  devtools::run_examples(run=FALSE, start="butron.maize")
  build_site(lazy=TRUE, run=TRUE)

Do NOT use Roxygen to document data, because it will complain about data/*.txt files with error messages like:
Error: 'uscrime' is not an exported object from 'namespace:agridat'

This document lists notes about data sources searched and additional sources of agricultural data.
Although this is an .md file, the formatting is best viewed in plain text mode.

---

Henry Wallace archive at Univ Iowa Library
http://www.lib.uiowa.edu/sc/location-and-hours/
Henry Wallace research papers
http://aspace.lib.uiowa.edu/repositories/2/archival_objects/400608
500 Ear experiment. Might be the data for "What is in the corn judge's mind" paper
http://aspace.lib.uiowa.edu/repositories/2/archival_objects/400615



# wanted

* Yield-monitor data for a split-planter field
* Yield-monitor data for a strip trial.

---

Jose Crossa papers http://repository.cimmyt.org/xmlui/handle/10883/1/browse?value=Crossa,%20J.&type=author 
Meta-r http://repository.cimmyt.org/xmlui/handle/10883/4130 
Data http://repository.cimmyt.org/xmlui/handle/10883/4036 
http://repository.cimmyt.org/xmlui/handle/10883/2976 
http://repository.cimmyt.org/xmlui/handle/10883/1380 
http://repository.cimmyt.org/xmlui/handle/10883/4128
http://repository.cimmyt.org/xmlui/handle/10883/4290

---

Review of meta-analyses in agronomy http://www6.versailles-grignon.inra.fr/agronomie/Meta-analysis-in-agronomy/References


# Papers

Biplot/StdErr/
VanEeuwijk 1993 - Incorporating env info Biplot
Bartkowiak GxE table GE folder: Crossa 1997

## Malosetti 2013
F2 data.
Folder: GE http://www.frontiersin.org/Plant_Physiology/10.3389/fphys.2013.00044/abstract CC license:


## Perez
Comparison Between Linear and Non-parametric Regression Models for Genome-Enabled Prediction in Wheat https://www.scienceopen.com/document/vid/4017fb51-381c-4374-93aa-608423df4004;jsessionid=0TLjjSbaooSUk1y3JKd4nUeb.master:so-app1-prd 
Data: http://www.g3journal.org/content/suppl/2012/12/05/2.12.1595.DC1 All content has CC license

# Extension

https://plant-breeding-genomics.extension.org/plant-breeding-and-genomics-learning-lessons 

https://plant-breeding-genomics.extension.org/estimating-heritability-and-blups-for-traits-using-tomato-phenotypic-data/

https://plant-breeding-genomics.extension.org/genomic-relationships-and-gblup  <--- todo review this

https://plant-breeding-genomics.extension.org/rrblup-package-in-r-for-genomewide-selection/


# ---------------------------------------------------------------------------

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
Vol 1.
Vol 2.
Vol 3. https://archive.org/details/in.ernet.dli.2015.271738/page/n653/mode/2up
  544 5 varieties, 2 blocks, 4 reps/block
Vol 4. 
Vol 5.
  579. agridat::bose.multi.uniformity
Vol 6. 
https://archive.org/details/in.ernet.dli.2015.271737
  34. 4-way factorial (3 gen, 5 date, 3 spacing, 3 pop) non-contiguous sub-plots. agridat::chakravertti.factorial
  460. agridat::kulkarni.sorghum.uniformity
  917. agridat::sayer.sugarcane.uniformity
Vol 9.
Vol 10.
Vol 11. 
Vol 12. 
  240. Wheat uniformity trial. agridat::iyer.wheat.uniformity
Vol 14.
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

# Journals / Proceedings


## Applied Statistics in Agriculture Conference
http://newprairiepress.org/agstatconference/ 
1989-2014


## Computers and Electronics in Agriculture.
http://www.sciencedirect.com/science/journal/01681699/103 
Vol 1-110 180-191


## Journal of Agricultural Science
https://www.cambridge.org/core/journals/journal-of-agricultural-science/all-issues
1900-2016


## Experimental Agriculture
https://www.cambridge.org/core/journals/experimental-agriculture
1965-2016
