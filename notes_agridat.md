---
title: "agridat notes"
---

# Cochran uniformity done

goulden.barley.uniformity
ducker.groundnut.uniformity
immer.sugarbeet.uniformity (1931)
smith.wheat.uniformity

  This data was made available with special help from the staff at
  Rothamsted Research Library.

\source{
  Rothamsted Research Library, Box STATS17  WG Cochran, Folder 5.
}


## data-raw/cochran_folder1_genstat_data

Genstat data 01.pdf    # series F multicrop 1925-1934
Genstat data 02.pdf    # series G multicrop 1925-1934
Genstat data 03.pdf # Done. Same as goulden.barley.uniformity
Genstat data 04.pdf    # nuts per plot 1919-1928
Genstat data 05.pdf # Done. Same as panse.cotton.uniformity
Genstat data 06.pdf    # cotton, gatooma 480 plots
Genstat data 07.pdf    # maize potchefstroom 1930
Genstat data 08.pdf    # B5a B5a
Genstat data 09.pdf    # maie potchefstroom 1929
Genstat data 10.pdf # immer.sugarbeet.uniformity 1931
Genstat data 11.pdf # Done. Sames as evans.sugarcane.uniformity SQUARED values
Genstat data 12.pdf # Done. Same as sayer.sugarcane.uniformity 1932
Genstat data 13.pdf # Done. Same as christidis.wheat.uniformity
Genstat data 14.pdf # Done. Same as smith.wheat.uniformity

## data-raw/cochran_folder2_data_received_since_publiction

2632_001.pdf
2633_001.pdf
2634_001.pdf
2635_001.pdf
2636_001.pdf # oats 1923
2637_001.pdf # cotton 1940, 40 rows, 50 columns
2638_001.pdf
2639_ducker_groundnut.R
2639_ducker_groundnut.pdf
2639_ducker_groundnut.xlsx
2640_001.pdf # oats 1921
2641_001.pdf # letter summerby
2642_001.pdf
2643_001.pdf # ribes
2644_001.pdf
2645_001.pdf # green cloves, tree yields, 5 years
2645_015.pdf # individual trees 1933-1938
2646_001.pdf steiner wireworms
2647_001.pdf # sugar beets MN 1937 LeClerg
2648_001.pdf # sugar beet MN 1933 LeClerg
2649_001.pdf

## data-raw/cochran_folder3/:

Cochran links to journal articles in files - Archives STATS17.docx
Journal of the american society of Agronomy 1930 Swanson Variety of grain p833.pdf
Letter to Cochran from Freda Thurman April 91936.pdf

## data-raw/cochran_folder4_uniformity_trials_1936_1936/

This folder contains correspondence

2652_001.pdf
2653_001.pdf
2654_001.pdf
2655_001.pdf
2656_001.pdf
2657_001.pdf
2658_001.pdf
2659_001.pdf
2660_001.pdf konigsberger
2661_001.pdf demandt
2662_001.pdf
2663_001.pdf
2664_001.pdf
2665_001.pdf
2666_001.pdf
2667_001.pdf
2668_001.pdf
2669_001.pdf
2670_001.pdf
2671_001.pdf

## data-raw/cochran_folder5_uniformity_data/:

2705_metzger.pdf
2706_001.pdf
2707_001.pdf
2708_goulden_barley.pdf    # Done. goulden.barley.uniformity
2709_beckett_coconut.pdf
2710_001.pdf
2711_001.pdf
2712_001.pdf                   # Gatooma
2713_pansee.pdf            # Done. Same as pansee.cotton.uniformity
2714_christidis.pdf        # Done. Same as christidis.wheat.uniformity
2715_singh.pdf             # Done. sayer.sugarcane.uniformity 1932, 48 rows, 20 columns
2716_maize.pdf             # todo 5 col, 300 row = 1500 plots potchefstroom
2717_maize.pdf             # todo potchefstroom 29-30  see folder 1, file 7
2718_hastings.pdf          # todo potchefstroom 28-29  see folder 1, file 9
2719_immer.pdf #  60 row, 10 col todo todo 2nd year of data
2720_sugarcane.pdf
2721_macdonald_cotton.pdf  # field B2a B5b. See folder 1, file 8
2722_rothamsted.pdf

## data-raw/cochran_folder6_ovs_health_cotton_uniformity

2679_001.pdf
2680_001.pdf
2681_001.pdf
2682_001.pdf
2683_001.pdf
2684_001.pdf
2685_001.pdf
2686_001.pdf
2687_001.pdf

## data-raw/cochran_folder7_yield_of_grain_per_foot

2672_smith_correspondence.pdf # done
2673_smith_reference.pdf      # done
2674_smith_ears_copy_B.pdf    # done
2675_smith_grain_copy_B.pdf   # done
2676_smith_grain_copy_A.pdf   # done
2677_smith_reference.pdf      # done
2678_smith_ears_copy_A.pdf    # done

## data-raw/cochran_folder8_catalog_of_uniformity_data

2688_001.pdf
2689_001.pdf
2690_001.pdf
2691_001.pdf
2692_001.pdf
2693_evans_sugarcane_letter.pdf # done evans.sugarcane.uniformity
2694_evans_sugarcane_data.pdf   # done evans.sugarcane.uniformity

---------------------------------------------------------------------------


## To do

* change theobald.covariate from JAGS to brms?
* brms examples for crowder.seeds
* Figure out best way to use jags
* JAGS code for edwards.oats
* JAGS code for lee.potatoblight
* JAGS code for theobald.barley
* JAGS code for besag.elbatan
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

* Plant-level data for distinctness, uniformity and stability testing.  Most published data is for plot-means.
This page mentions an R version for DUS: http://www.bioss.ac.uk/knowledge/software.html
* Yield-monitor data for a split-planter field
* Yield-monitor data for a strip trial.

---

Jose Crossa papers http://repository.cimmyt.org/xmlui/handle/10883/1/browse?value=Crossa,%20J.&type=author 
Meta-r http://repository.cimmyt.org/xmlui/handle/10883/4130 
Data http://repository.cimmyt.org/xmlui/handle/10883/4036 
http://repository.cimmyt.org/xmlui/handle/10883/2976 
http://repository.cimmyt.org/xmlui/handle/10883/1380 
http://repository.cimmyt.org/xmlui/handle/10883/4128 http://repository.cimmyt.org/xmlui/handle/10883/4290

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

https://plant-breeding-genomics.extension.org/genomic-relationships-and-gblup  <--- review this

https://plant-breeding-genomics.extension.org/rrblup-package-in-r-for-genomewide-selection/


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
  34. 4-way factorial with whole-plot date, but non-contiguous sub-plots. todo fixme
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

# Classes


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
Vol 1-110 180-191


## Journal of Agricultural Science
https://www.cambridge.org/core/journals/journal-of-agricultural-science/all-issues
1900-2016


## Experimental Agriculture
https://www.cambridge.org/core/journals/experimental-agriculture
1965-2016


## SAS Global Forum
http://support.sas.com/events/sasglobalforum/previous/online.html 
22-31, 2007-2013
