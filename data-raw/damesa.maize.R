# damesa.maize.R

Tigist Mideksa Damesa, Jens Möhring, Mosisa Worku, Hans‐Peter Piepho (2017).
One Step at a Time: Stage‐Wise Analysis of a Series of Experiments.
Agronomy J, 109, 845-857.
https://doi.org/10.2134/agronj2016.07.0395

# Maize example 1

libs(asreml,desplot,dplyr,lucid,purrr,readr,stringr)
d1 <- read_csv("damesa.maize.csv")

d1 <- rename(d1, gen=genotype)
d1 <- mutate(d1,
             site=paste0("S",site),
             rep=paste0("R",rep),
             block=paste0("B",block),
             gen = paste0("G", kw::pad(gen)))
d1 <- mutate(d1, gen=factor(gen), rep=factor(rep),
             block=factor(block), site=factor(site))

Trial Name: Evaluation of CIMMYT Drought tolerant hybrids (EVCDTH12)
Source: Ethiopian Institute of Agricultural Research (EIAR)
Coordinating center: Melkassa
Conducted: In main rainy season July 1, 2012 to December 25, 2012
Mega Environment: low-moisture stress areas (LMSA)
Number of genotypes = 22 non-quality protein maize genotypes (non-QPM)
Number of sites = 4
Site1: Melkassa     
Site2: Dhera
Site3: Zewai
Site4: Mieso   
Experimental design = 11 by 2 alpha-lattice in 2 replicates (REP) with eleven blocks per replicate at all 4 sites; plot size= 7.5 m2
Response variable: Grain yield (GY) in t/ha

Experiment at 4 sites (Dhera, Melkassa, Mieso, Ziway), 3 reps, with 11 incomplete blocks in each replicate.

damesa.maize <- d1
kw::agex(damesa.maize)
# ----------------------------------------------------------------------------



# Single-stage analysis

## proc mixed data=example1 lognote;
##     class genotype site rep block;
##     model GY=genotype ;
##     random int genotype/sub=site;
##     random int block/sub=rep group=site;
##     repeated/group=site;
##     lsmeans genotype/pdiff;
##     parms / pdata=cp_twostage_full_1 noiter;
## run;

m0 <- asreml(data=d1,
             fixed = yield ~ gen,
             random = ~ site + gen:site + at(site):rep/block,
             residual = ~ dsum( ~ units|site) )
vc(m0) # match table 1 column 3

p0 <- predict(m0, classify="gen")
p0$pvals # Match table 2 column 5
