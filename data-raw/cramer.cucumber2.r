# cucumber.r
# Time-stamp: <09 Apr 2017 21:07:51 c:/x/rpack/agridat/data-raw/cramer.cucumber2.r>

# this r code was taken from the rpathanalysis package and cleaned somewhat
# http://cucurbitbreeding.com/todd-wehner/publications/software-sas-r-project/

# NOTE: There are 3 different datasets
# 1. Data from the Quantitative Gentics book: agridat::cramer.cucumber
# 2. The 'cucumber' data in the rpathanalysis package
# 3. Unavailable data used in the PATHSAS paper.

require(boot)

#     R-PATH 1.0                                                                                 #
#     Program for Analysis of Path Coefficients Using R                                          #
#     12/03/2011                                                                                 #
#     Author: Guixian Lin, Todd Wehner, Kyle Vandenlangenberg                                    #
# reference: Cramer, C.S., T.C. Wehner, and S.B. Donaghy. 1999. PATHSAS: a SAS computer program  #
# for path coefficient analysis of quantitative data. J. Heredity 90:260-262 .                   #

#compute PathCorr for one level defined by the parameter bylist#
#data= data[,bylist=level];  if printcorr=1, correlation is returned instead;

PathCorr<-function(data,indices,indep,dep0, dep, bci="no", digits=2, printcorr=0){
  #Parameters are:
  #data =name of dataset to analyse
  #indices=for bootstrap confidence intervals
  #indep=list of independent variables
  #dep0=primary dependent variable - for total correlation
  #dep=secondary dependent variables - for total correlation
  #bootconf= indictor for computing bootstrap conf. intervals for total corr.
  #         variables?(value is either yes or no)

  #browser()
  if(!is.null(indices)) 
    data=data[indices,c(indep,dep0, dep)] ##subset data
  
  ##standardize the data 
  ## sdata=pls::stdize(data[,c(indep,dep0,dep)])
  ## sdata=sapply(sdata,as.matrix)	 
  ## sdata=data.frame(sdata)
  sdata = data.frame(scale(data[,c(indep,dep0,dep)]))
  
  noind=0
  nodep=0
  nodep0=0
  noind=length(indep)
  nodep0=length(dep0)	
  nodep=length(dep)	


  # regression by bylist for
  # &dep0=&indep
  
  lmcoef <- lm(as.formula(paste(dep0,"~",paste(indep,collapse="+"))),
               data=sdata)
  estdep=coef(lmcoef)[-1] ##no intercept		  
  
  #model &dep=&dep0
  lmcoef1=NULL
  estind2=NULL
  HaveSecondDep=(nodep>=1)
  if( HaveSecondDep) { ##dependent variables are not empty
		for (i in 1:length(dep)) {
			lmcoef1=cbind(lmcoef1,coef(lm(as.formula(paste(dep[i],"~",dep0)), data=sdata)))
		}			  
    estind2=lmcoef1[-1,]
  }

  # Correlation coefficients for Independent variables'
  corrind=cor(data[,indep])

  #'Correlation coefficients for dependent variables'
  if(HaveSecondDep)  
    corrdep=cor(data[,c(dep0, dep)])
  else
    corrdep=NULL
  
  if(printcorr==1) {
	  corrResults=list("Correlation coefficients for independent variables"=corrind, "Correlation coefficients for dependent variables"=corrdep) 
	  return(corrResults)
	}

  # get direct and indirect effects for dep0 and covariates
  result=corrind
  nvar=dim(corrind)[2]
  resdep0=rep(0,nvar)
  if (nodep>=1)
    resdep=array(0, c(nvar,nodep))	
  else
    resdep=NULL
  
  for(i in 1:nvar) {
    for(j in 1:nvar) {
      if (i==j) {
        result[i,j]=estdep[j]
      } else  {
        result[i,j]=result[i,j]*estdep[j]
      }
      resdep0[i]=resdep0[i]+ result[i,j]
    }
  }
		
  if(	HaveSecondDep) {
    for(i in 1:nvar)
      for(j in 1:nodep) {
        resdep[i,j]=resdep0[i]* estind2[j]
      }
  }


  if(bci=="no") { ##no confidence intervals are computed
    if (HaveSecondDep) colnames(resdep)<-dep
    effects=cbind(result,resdep0,resdep)
    colnames(effects)[nvar+1]<-dep0
    
    
  } else {  ##compute confidence intervals
    ##Reorder the results as a vector so that 
    ##the order of the vector will be dep0 dep1 dep2 for the first independent variable then ... for the second indep var.
    effects=as.vector(t(cbind(resdep0,resdep)))     
  }
  effects=round(effects,digits)	  
  return(effects)
  
}

path<-function(data,indep,dep0, dep, bylist, bci="no", level=.95, random=2058,samples=500, digits=2) {
  #Parameters are:
  #data =name of dataset to analyse	 
  #indep=list of independent variables
  #dep0=primary dependent variable - for total correlation.
  #dep=secondary dependent variables - for total correlation
  #bci= indictor for computing bootstrap conf. intervals for total corr.
  #         variables?(value is either yes or no)
  #level= confidence level must be between 0 and 1
  #random= seed for random number generator
  #samples= the number of bootstrap samples
  
  
  ###obtain the variable name for indep, dep0 and dep from the user's input (seperated by blank)
  if(missing(data))  stop("Data set was not specified.")
  
  bci=sub('^[ \t]+', '\\1',sub('[ \t]+$','',bci))
  
  if(!missing(bylist)) {
    bylist0=sub('^[ \t]+', '\\1',sub('[ \t]+$','',bylist))
    bylist0=unlist(strsplit(bylist,'[[:blank:]]+'))
    bylist0=bylist0[bylist0!=""]
    noby=length(bylist0)
  } else noby=0
  
  set.seed(random)
  resCI=NULL
  
  noind=0
  nodep=0
  nodep0=0
  noind=length(indep)
  nodep0=length(dep0)	
  nodep=length(dep)	
  
  if(noby>0 ) {
    if (noby>1) {
      bylist=as.list(data[, bylist0])
    } else {
      bylist=list(data[, bylist0])
      names(bylist)<-bylist0	   
	  }
    pathCoef=by(data[,c(indep,dep0, dep)], bylist, PathCorr,
                indices=NULL, indep,dep0, dep, bci="no", digits=digits) ##compute the Path Coef. by specifying bci="no"
    
    corrResult=by(data[,c(indep,dep0, dep)], bylist, PathCorr,
                  indices=NULL, indep,dep0, dep, bci="no", digits=digits, printcorr=1) ##compute correlation by specifying bci="no" and printcorr=1   
    
    if(level<=0 || level>=1) {  
      print("confidence level must be between  0 and 1. It is set to .95")
      level=.95
    }
    if(samples<10) {  
      print("The number of bootstrap sample should be greater than 10. It is set to 500")
      samples=500
    }		
    ###obtain the factor levels
    
    d <- dim(pathCoef)
    dn <- dimnames(pathCoef)
    dnn <- names(dn)
    byvarO=NULL ##output by variable in the confidence interval table
    for( i in seq_along(pathCoef)) {
	    ii <- i - 1L
      for (j in seq_along(dn)) {
        iii <- ii%%d[j] + 1L
        ii <- ii%/%d[j]
        #cat(dnn[j], ": ", dn[[j]][iii], "\n", sep = "")
        #print(dn[[j]][iii])
        byvarO=c(byvarO,dn[[j]][iii])
      }  
    }
    
    byvarO=matrix(byvarO,ncol=noby,byrow=T)
    byvarO=byvarO[rep(1:dim(byvarO)[1], each=noind*(nodep0+nodep)),] #repeat noind times
    
    
    indvarO=rownames(pathCoef[[1]])  ##obtain the indepent variable names
    indvarO=rep(indvarO, each=(nodep+nodep0)) ##for one bylist
    indvarO=rep(indvarO, prod(d))   ##
    NAME=rep(c(dep0,dep),prod(d)*noind)
    
    if(tolower(bci)=="yes") {
      res=by(data[,c(indep,dep0, dep)], bylist, boot, PathCorr, R = samples, indep=indep,dep0=dep0, dep=dep, bci=bci,digits=digits)
      ##call bootci to get the confidence intervals
      
      
      for(iby in 1:prod(d)) { ##number of combination of factors from bylist
        idx=0
        for( iind in 1:noind)
          for( idep in 1: (nodep+nodep0)) {
            idx=idx+1 
            resCI=rbind(resCI, c(res[[iby]]$t0[idx], boot.ci(res[[iby]], conf = c(level), type = c("perc"), index=idx)$percent[,4:5])) ##default level=.95
          }				   
      }
      resCI=round(resCI,digits)	
      colnames(resCI)=c("Observed Statistic", "Lower Confidence Limit","Upper Confidence Limit") 	
      resCI=data.frame(byvarO, indvarO, NAME, resCI[,c(2,1,3)])	
      colnames(resCI)[1:noby]<-bylist0
      colnames(resCI)[noby+1]="Independent Variables"
      
    } 
    
  } else {
    
    pathCoef=PathCorr(data[,c(indep,dep0, dep)], indices=NULL, indep,dep0, dep, bci="no",digits=digits)
    corrResult=PathCorr(data[,c(indep,dep0, dep)], indices=NULL, indep,dep0, dep, bci="no",digits=digits, printcorr=1) ##compute correlation by specifying bci="no" and printcorr=1   
    
    indvarO=rownames(pathCoef)
    indvarO=rep(indvarO, each=(nodep+nodep0)) ##for one bylist
    NAME=rep(c(dep0,dep),noind)
    
    if(bci=="yes") {
      res=boot(data[,c(indep,dep0, dep)], PathCorr, R = samples, indep=indep,dep0=dep0, dep=dep, bci=bci,digits=digits)
      ##call bootci to get the confidence intervals
      
      idx=0
      for( idep in 1: (nodep+nodep0))
        for(iind  in 1:noind) {
          idx=idx+1
          resCI=rbind(resCI, c(res$t0[idx], boot.ci(res, conf = c(level), type = c("perc"), index=idx)$percent[,4:5]))
        }
      resCI=round(resCI,digits) 		  
      colnames(resCI)=c("Observed Statistic", "Lower Confidence Limit","Upper Confidence Limit") 
      resCI=data.frame(indvarO, NAME, resCI[,c(2,1,3)])	 
      colnames(resCI)[1]<-"Independent Variables"
      #resCI=data.frame(NAME,resCI)		  
    }
  }
  
  
  corrStatic=list(pathCoef=pathCoef, confidence=resCI, boot=bci, level=level, random=random, samples=samples, corr=corrResult)
  class(corrStatic)<-"path"
  return (corrStatic)
  
}


print.path=function(x,detail=0,...) {
  # print the result from pathCorr
  # the correlations for independent vars and dependent vars will be printed if detail=1 
  if (!is.null(cl <- x$call)) {
    cat("Call:\n")
    dput(cl)
  }
	cat("\n## Direct Effects, Indirect Effects, and Total Correlations ##\n")
	print(x$pathCoef)
	if(tolower(x$boot)=="yes") {
    cat(paste("\nBootstrap", x$level*100, "% Confidence Intervals--using BC method", "\nRandom Seed=",x$random, "\nNumber of Resamples=", x$samples,"\n"))
    print(x$confidence)
	}
	if(detail==1) {
    cat("\n  Correlation Coefficients  \n")
    print(x$corr)
	}
  invisible(x)
}

# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

setwd("c:/x/rpack/agridat/data-raw/")
load("cramer.cucumber2.Rdata")

## plotnum
## year 1,2 1995,96
## season 1,2 spring,summer
## pop : 8 pickling/slicing cucumber population
## rep 1..16. 4 reps in each of 2 years, 2 seasons
## cyc: 3 cycles of selection, early, intermediate, late
## stdct 4..30 standardized to 30 ?
## numplts 1..39 number of plants per plot
## pistflrw pistaillate flowers 1..281
## numbran number of branches per palnt 1..291
## numleav number of leaves 1..1716
## frttot total fruit number per plant 1..87
## frtearl 1..48 early fruit per plant

# Electronic version of the data obtained from the pathanalysis package. Used under GPL.
dat <- cucumber
names(dat) <- c('plot','year','season','population','rep','cycle','stdct','plants','flowers','branches','leaves','tfruit','efruit')
head(dat)
##   plot year season population rep cycle stdct plants flowers branches leaves tfruit efruit
## 1    1    1      1          1   1     1    30     28      52       77    486     30      0
## 2    3    1      1          1   2     1    29     27      77       44    383     13      0
## 3    5    1      1          1   3     1    30     30     104       42    375     30      0
## 4    7    1      1          1   4     1    30     25      92       43    463     21      3
## 5    9    1      1          1   4     2    26     24       1       56    479     18      6
## 6   11    1      1          1   3     2    25     24      14       35    347      0      0

indep <- c('stdct','branches','leaves','plants','flowers')
dep0 <- 'tfruit'
dep <- 'efruit'

# Not correct source
# Cramer, C. S., T. C. Wehner, and S. B. Donaghy. 1999.
# PATHSAS: a SAS computer program for path coefficient analysis of quantitative data.
# \epmh{J. Hered}, 90, 260-262
# https://doi.org/10.1093/jhered/90.1.260

library(boot)
#library(pathanalysis) # use source code above instead

resEx1=path(data=dat, indep=indep, dep0=dep0, dep=dep, bci="yes")
print(resEx1, detail=1)

##############################################################

## Direct Effects, Indirect Effects, and Total Correlations ##

         STDCT NUMBRAN NUMLEAV NUMPLTS PISTFLRW FRTTOT FRTEARL
STDCT     0.11    0.13    0.03    0.04     0.07   0.38    0.19
NUMBRAN   0.04    0.35    0.06    0.02     0.14   0.61    0.30
NUMLEAV   0.04    0.26    0.08    0.02     0.14   0.54    0.27
NUMPLTS   0.09    0.14    0.03    0.05     0.07   0.37    0.19
PISTFLRW  0.02    0.14    0.03    0.01     0.35   0.56    0.28

#############################################################################

Bootstrap 95pct Confidence Intervals--using BC method 
Random Seed= 2058 
Number of Resamples= 500 

   Independent Variables    NAME Lower.Confidence.Limit Observed.Statistic   Upper.Confidence.Limit
1                  STDCT  FRTTOT                   0.30               0.38                     0.46
2                  STDCT FRTEARL                   0.15               0.19                     0.24
3                NUMBRAN  FRTTOT                   0.54               0.61                     0.67
4                NUMBRAN FRTEARL                   0.24               0.30                     0.36
5                NUMLEAV  FRTTOT                   0.46               0.54                     0.61
6                NUMLEAV FRTEARL                   0.21               0.27                     0.32
7                NUMPLTS  FRTTOT                   0.29               0.37                     0.46
8                NUMPLTS FRTEARL                   0.14               0.19                     0.24
9               PISTFLRW  FRTTOT                   0.47               0.56                     0.63
10              PISTFLRW FRTEARL                   0.21               0.28                     0.34

############################

  Correlation Coefficients  

$`Correlation coefficients for independent variables`
             STDCT   NUMBRAN   NUMLEAV   NUMPLTS  PISTFLRW
STDCT    1.0000000 0.3846509 0.3740740 0.8244587 0.1876819
NUMBRAN  0.3846509 1.0000000 0.7461810 0.3920171 0.4126680
NUMLEAV  0.3740740 0.7461810 1.0000000 0.3926499 0.4028384
NUMPLTS  0.8244587 0.3920171 0.3926499 1.0000000 0.1898909
PISTFLRW 0.1876819 0.4126680 0.4028384 0.1898909 1.0000000

$`Correlation coefficients for dependent variables`
          FRTTOT  FRTEARL
FRTTOT  1.000000 0.495771
FRTEARL 0.495771 1.000000
