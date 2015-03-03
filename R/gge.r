# gge.r
# Time-stamp: c:/x/rpack/agridat/R/gge.r

if(0){  # Tests

  # matrix data
  mat1 <- matrix(c(50, 55, 65, 50, 60, 65, 75,
                   67, 71, 76, 80, 82, 89, 95,
                   90, 93, 95, 102, 97, 106, 117,
                   98, 102, 105, 130, 135, 137, 133,
                   120, 129, 134, 138, 151, 153, 155),
                 ncol=5, byrow=FALSE)
  colnames(mat1) <- c("E1","E2","E3","E4","E5")
  rownames(mat1) <- c("G1","G2","G3","G4","G5","G6","G7")

  # One missing value in a matrix
  mat2 <- mat1 ; mat2[1,1] <- NA

  # Check 'plot' functions for complete/missing
  m11 = gge(mat1)
  plot(m11)
  m21 = gge(mat2)
  plot(m21)

  # Checking arguments of 'biplot'
  biplot(m11)
  biplot(m11, title="Example biplot", subtitle="GGE biplot")
  biplot(m11, cex.gen=2)
  biplot(m11, cex.env=2)
  biplot(m11, col.gen="blue")
  biplot(m11, col.gen=c("blue","red")) # With 1 group, only use first
  biplot(m11, pch.gen=20) # Ignored with 1 group
  biplot(m11, comps=2:3)
  biplot(m11, lab.env=FALSE)
  # Flips
  biplot(m11, flip="") # no flipping
  biplot(m11, flip=FALSE)
  biplot(m11, flip=TRUE)
  biplot(m11, flip=c(TRUE,FALSE))
  biplot(m11, flip=c(FALSE,TRUE))
  biplot(m11, flip=c(FALSE,FALSE))
  biplot(m11, flip=c(TRUE,TRUE))

  m31 <- gge(mat1, method="svd")
  biplot(m31)
  m32 <- gge(mat1, method="nipals")
  biplot(m32)
  m34 <- gge(mat2) # should switch to 'nipals'
  biplot(m34)
  m35 <- gge(mat2, method="svd") # should switch to 'nipals'

  # matrix data with env.group, gen.group
  m24 <- gge(mat2, env.group=c(1,1,1,2,2))
  biplot(m24)
  m25 <- gge(mat2, gen.group=c(1,1,1,1,2,2,2))
  biplot(m25, col.gen=c('blue','red'), pch.gen=1:2) # group colors, symbols

  # Create data.frame with env groups using the lattice::barley data
  bar <- transform(lattice::barley, env=paste0(site,year))
  m31 <- gge(yield~variety*site, bar, env.group=year) # errs, as it should
  m32 <- gge(yield~variety*env, bar)
  biplot(m32)
  m33 <- gge(yield~variety*env, bar, env.group=year) # env.group
  plot(m33)
  biplot(m33)
  biplot(m33, lab.env=FALSE) # label locs
  biplot(m33, lab.env=TRUE) # default is to label locs
  # Option to disable residual vectors
  biplot(m33, res.vec=TRUE) # default is to label locs
  biplot(m33, res.vec=FALSE) # default is to label locs

  # Custom colors for gen/env. Example matrix data from Laffont
  mat6 <- read.csv("c:/x/rpack/old/ggb/example1.csv")
  rownames(mat6) <- mat6[,1]
  mat6 <- as.matrix(mat6[, -1])
  # specify 'gen.group' and 'env.group' as a vector with matrix data
  m61 <- gge(mat6, scale=FALSE,
             env.group=c(rep("Blk1",3), rep("Blk2",5),rep("Blk3", 5), rep("Blk4", 7)),
             gen.group=rep(letters[1:3], each=5))
  biplot(m61, flip=c(1,1))

  # Corssa example
  require("reshape2")
  # CRAN check doesn't like data() loading into global envt, so keep
  # this commented out.
  # data(crossa.wheat, package="agridat")
  dat1 <- crossa.wheat
  mat1 <- acast(dat1, gen~loc)
  mat1 <- mat1[, c("SR","SG","CA","AK","TB","SE","ES","EB","EG",
                   "KN","NB","PA","BJ","IL","TC","JM","PI","AS","ID",
                   "SC","SS","SJ","MS","MG","MM")]
  tit1 <- "CYMMIT wheat"
  m7 <- gge(mat1, env.group=c(rep("Grp2",9), rep("Grp1", 16)), lab="Y",
            scale=FALSE, title=tit1)
  biplot(m7)
  plot(m7)

  # Specify env.group as column in data frame
  dat2 <- crossa.wheat
  dat2$eg <- ifelse(dat2$loc %in% c("KN","NB","PA","BJ","IL","TC","JM","PI","AS","ID",
                                   "SC","SS","SJ","MS","MG","MM"), "Grp1", "Grp2")
  m8 <- gge(yield~gen*loc, dat2, env.group=eg, scale=FALSE)
  biplot(m8)

  # No env.group
  m9 <- gge(yield~gen*loc, dat2, scale=FALSE)
  biplot(m9)

}

# ----------------------------------------------------------------------------

gge <- function(x, ...) UseMethod("gge")

gge.formula <- function(formula, data=NULL,
                        gen.group=NULL, env.group=NULL, ...) {
  # Author: Kevin Wright

  if(is.null(data))
    stop("This usage of gge requires a formula AND data frame.")

  # Get character representations of all necessary variables.
  # There is probably a more R-like (obscure) way to do this, but this works.
  vars <- all.vars(formula)
  # Check for valid names (in the data)
  if(!all(is.element(vars,names(data))))
    stop("Some of the terms in the formula are not found in the data.")
  .y <- vars[1]
  .gen <- vars[2] # Note that 'gen' may already a variable in the data
  .env <- vars[3]

  # Make gen.group & env.group either NULL or quoted name in the data
  gen.group <- substitute(gen.group)
  env.group <- substitute(env.group)
  if(!is.null(gen.group)) {
    gen.group <- deparse(gen.group) # convert to text
    if(!is.element(gen.group, names(data)))
      stop("The argument 'gen.group' refers to non-existant column of data.")

    if(any(colSums(table(data[[gen.group]], data[[.gen]])>0)>1)){
      warning("Some values of '", .gen, "' have multiple gen.group.  Ignoring gen.group.")
      gen.group <- NULL
    }
  }
  if(!is.null(env.group)) {
    env.group <- deparse(env.group)
    if(!is.element(env.group, names(data)))
      stop("The argument 'env.group' refers to non-existant column of data.")

    if(any(colSums(table(data[[env.group]], data[[.env]])>0)>1)){
      warning("Some values of '", .env, "' have multiple env.group.  Ignoring env.group.")
      env.group <- NULL
    }
  }

  # Finally, reshape data into a matrix, average values in each cell
  # require(reshape2) # Now in 'Depends'
  datm <- acast(data, formula(paste(.gen, "~", .env)), fun.aggregate=mean, value.var=.y)
  datm[is.nan(datm)] <- NA # Use NA instead of NaN

  # Make gen.group and env.group to be vectors corresponding to rows/cols of datm
  if(!is.null(gen.group)) {
    ix1 <- match(rownames(datm), data[[.gen]])
    gen.group <- data[[gen.group]][ix1]
  }
  if(!is.null(env.group)) {
    ix2 <- match(colnames(datm), data[[.env]])
    env.group <- data[[env.group]][ix2]
  }

  # Now call the matrix method and return the results
  invisible(gge.matrix(datm, gen.group=gen.group, env.group=env.group, ...))

}

gge.matrix <- function(x, center=TRUE, scale=TRUE,
                       gen.group=NULL, env.group = NULL,
                       comps=c(1,2), method="svd", ...) {

  # Author: Kevin Wright, based on S-Plus code by Jean-Louis Laffont.

  # x: matrix of rows=genotypes, cols=environments
  # env.group: vector having the group class for each loc

  if(!is.null(env.group) && (length(env.group) != ncol(x)))
     stop("'env.group' is the wrong length.")
  if(!is.null(gen.group) && (length(gen.group) != nrow(x)))
     stop("'gen.group' is the wrong length.")

  x.orig <- x

  # Check for missing values
  pctMiss <- sum(is.na(x))/(nrow(x)*ncol(x))
  if(pctMiss > 0)
    cat("Missing values detected: (", round(100*pctMiss,0), "%)\n", sep="")
  if(pctMiss > 0 & method=="svd") {
    cat("Switching to 'nipals' method.\n")
    method <- "nipals"
  }
  if(pctMiss > .10)
    warning("Biplots deteriorate for more than 10-15% missing values.")
  genPct <- apply(x, 1, function(xx) length(na.omit(xx)))/ncol(x)
  envPct <- apply(x, 2, function(xx) length(na.omit(xx)))/nrow(x)
  if(any(genPct<.2) || any(envPct<.2))
    warning("Missing data may be structured.")

  # Maximum number of PCs
  maxPCs <- min(nrow(x), ncol(x)-1)

  # Find principal components

  ## # If pcaMethods package is installed, use it
  ## #if(is.element("package:pcaMethods", search())){
  ## if(require("pcaMethods")){

  ##   pcameth <- TRUE

  ##   # cat("Using pcaMethods\n")

  ##   if(!is.element(method, c('bpca', 'nipals', 'ppca', 'rnipals', 'svd', 'svdImpute')))
  ##     stop("Unknown method type for pcaMethods::pca")

  ##   # ----- pcaMethods -----
  ##   # bpca does NOT require orthogonal PCs
  ##   # nipals can handle small amount of missing values
  ##   # ppca allows NA
  ##   # svd is the same as base R svd
  ##   # svdImpute allows NA

  ##   ## if(is.logical(scale) && scale) {
  ##   ##   # warning("Changing scale from TRUE to 'uv' for pcaMethods.\n")
  ##   ##   scale <- "uv"
  ##   ## }
  ##   ## if(is.logical(scale) && !scale) {
  ##   ##   # warning("Changing scale from FALSE to 'none' for pcaMethods.\n")
  ##   ##   scale <- "none"
  ##   ## }

  ##   x.svd <- NULL
  ##   pcascale <- ifelse(scale, 'uv', 'none') # Chg T/F to uv/none
  ##   x.pca <- pca(x, nPcs=min(nrow(x), ncol(x)-1), completeObs=TRUE,
  ##                center=center, scale=pcascale, verbose=TRUE, method=method)
  ##   R2 <- x.pca@R2
  ##   x <- x.pca@completeObs # missing values are replaced with estimates
  ##   x <- scale(x, center=center, scale=scale)

  ## } else { # Use built-in svd or our nipals

  pcameth <- FALSE

  if(!is.element(method, c('nipals', 'svd')))
    stop("Unknown method.  Use 'svd' or 'nipals'")

  # Scale data
  x <- scale(x, center=center, scale=scale)  # Center / scale each environment

  if(method=="svd"){ # ----- SVD -----

    x.pca <- NULL
    x.svd <- svd(x)
    R2 <- x.svd$d^2/sum(x.svd$d^2)

  } else if(method=="nipals"){ # ----- Nipals

    x.svd <- NULL
    x.pca <- nipals(x, completeObs=TRUE, center=FALSE, scale.=FALSE)
    R2 <- x.pca$R2
    x <- x.pca$completeObs # replaces missing values with estimates
    x <- scale(x, center=center, scale=scale)

  }

  ## }

	if(!is.null(x.svd) && length(x.svd$d) == 1)
		stop("Only one principal component.  Biplot not available.")

  # The matrices G,W,R of Laffont et al are here x.g, x.gb, x.r
  # x.g is a matrix of identical columns of genotype means

  genMeans <- rowMeans(x, na.rm=TRUE)
  x.g <-  genMeans %*% t(rep(1, ncol(x)))

  # x.gb is the same size as x, but has the G*B effect
  # First remove gen effects, then average by group, then expand back to size of x
  x.cc <- x - x.g # x.cc = x.orig - envmeans - genmeans
  x.grp <- NULL

  if(is.null(env.group)){
    x.gb <- x.cc # No groups (each loc is its own group)
  } else {
    groupNames <- names(table(env.group))
    for(i in groupNames) {
      # Need 'drop' so that a single-column is not converted to vector
      x.grp <- cbind(x.grp, rowMeans(x.cc[, env.group==i, drop=FALSE]))
    }
    colnames(x.grp) <- groupNames
    x.gb <- x.grp[,match(env.group, colnames(x.grp))]
  }
  # x.r is a matrix of residuals = x.orig - colmeans - rowmeans - G*B
  x.r <- x - x.g - x.gb

  # Orthogonal rotation matrix U
  #if(pcameth) { # pcaMethods package
  #  eval <- apply(x.pca@scores^2, 2, sum) # eigen values
  #  U <- x.pca@scores %*% diag(1/sqrt(eval))
  #} else {
  if(method=="svd") {
    U <- x.svd$u
  } else if (method=="nipals"){
    U <- x.pca$x %*% diag(1/sqrt(x.pca$eval))
  }

  # Partition SSG, SSGB, SSR along each axis
  # Ex: SSGk = diag(u'x.g * x.g'u)
  #          = diag(crossprod(crossprod(x.g, u)))
  #          = colSums(crossprod(x.g, u)^2)
  SSGk <- colSums(crossprod(x.g, U)^2)
  SSGBk <- colSums(crossprod(x.gb, U)^2)
  SSRk <- colSums(crossprod(x.r, U)^2)

  # Data for mosaic plot
  mosdat <- data.frame(G = SSGk, GB = SSGBk, R = SSRk)
  mosdat <- as.matrix(mosdat)
  rownames(mosdat) <- 1:nrow(mosdat)
  names(dimnames(mosdat)) <- c("PC","")

  # Calculate coordinates (along all kept components) for genotypes
  maxcomp <- 5
  maxcomp <- min(maxcomp, nrow(x), ncol(x)-1)
  ROT <- U[ , 1:maxcomp]
  n.gen <- nrow(x)
  genCoord <- ROT * sqrt(n.gen - 1)

  # Block coordinates
  blockCoord <- t(x.g + x.gb) %*% ROT / sqrt(n.gen - 1)

  # Loc coordinates = Block + Residual
  resCoord <- t(x.r) %*% ROT * (1/sqrt(n.gen - 1))
  locCoord <- blockCoord + resCoord
  # locCoord = t(x.g + x.gb + x.r) %*% ROT / sqrt(n.gen -1)
  #  = t(x) %*% ROT / sqrt(n.gen -1)

  # completeObs matrix lacks rownames ?
  rownames(genCoord) <- rownames(x.orig)
  rownames(locCoord) <- colnames(x.orig)
  rownames(blockCoord) <- env.group

  ret <- list(x=x,
              genCoord=genCoord, locCoord=locCoord, blockCoord=blockCoord,
              gen.group=gen.group, env.group=env.group,
              genMeans=genMeans, mosdat=mosdat, R2=R2,
              center=center, scale=scale, method=method,
              pctMiss=pctMiss, maxPCs=maxPCs)
  class(ret) <- "gge"

  return(ret)
}

extend <- function(x,y,xlim,ylim){
  # Given a vector of points (x,y) this function extends the points outward
  # along a vector from (0,0) to the border of the box defined by (xlim,ylim).
  # This box has four 'quadrants' bottom,right,top,left.
  # The 'right' quadrant is a triangle bound by:
  # (0, bottom-right corner, top-right corner)

  xmin <- xlim[1]; xmax <- xlim[2]
  ymin <- ylim[1]; ymax <- ylim[2]

  tr <- atan2(ymax, xmax) # Angle to top-right corner
  tl <- atan2(ymax, xmin) #   top-left
  bl <- atan2(ymin, xmin) #   bottom-left
  br <- atan2(ymin, xmax) #   bottom-right
  phi <- atan2(y, x)      # Angle to each point

  # Instead of many "if-else" terms, just sum(quadrant_indicator * ordinate)
  xb <- (bl < phi & phi <= br) * (ymin*x/y) + # bottom edge
        (br < phi & phi <= tr) * (xmax) +     # right
        (tr < phi & phi <= tl) * (ymax*x/y) + # top
        (phi <= bl | phi > tl) * (xmin)       # left

  yb <- (bl < phi & phi <= br) * (ymin) +
        (br < phi & phi <= tr) * (xmax*y/x) +
        (tr < phi & phi <= tl) * (ymax) +
        (phi <= bl | phi > tl) * (xmin*y/x)

  return(cbind(xb, yb))
}

plot.gge <- function(x, title=substitute(x), ...) {

  # For now, only a mosaic plot.
  # heatmap

  op1 <- par(mfrow=c(2,2))
  R2 <- x$R2

  # Scree plot
  op2 <- par(pty='s', mar=c(3,5,2,1))
  plot(1:length(R2), R2, type="b", axes=FALSE,
       main="", xlab="", ylab="Scree plot - Pct SS")
  axis(1, at=pretty(1:length(R2)), cex.axis=0.75)
  axis(2, at=pretty(c(0,max(R2))), cex.axis=0.75)

  # Mosaic
  par(pty='s', mar=c(2,1,2,1))
  mosaicplot(x$mosdat, main="",
             col=c("darkgreen","lightgreen","gray70"), off=c(0,0))
  mtext(title, line=.5, cex=1)

  # Heatmap
  Y <- x$x
  #par(pty = "m", mar = c(2, 3, 3, 1))
  image(t(Y), col=RedGrayBlue(12), axes=FALSE)
  axis(2, seq(from=0, to=1, length=nrow(Y)), labels=rownames(Y),
       tick=FALSE, cex.axis=.4, col.axis="black", las=2, line=-.8)
  axis(3, seq(from=0, to=1, length=ncol(Y)), labels=colnames(Y),
       tick=FALSE, cex.axis=.4, col.axis="black", las=2, line=-0.8)

  par(op2)
  par(op1)

  invisible()
}


biplot.gge <- function(x, title = substitute(x), subtitle="",
                       cex.gen=0.6, cex.env=.5,
                       col.gen="darkgreen", col.env="orange3",
                       pch.gen=1,
                       lab.env = TRUE,
                       comps=1:2,
                       flip="auto",
                       res.vec=TRUE, ...){

  # x: A model object of class 'gge'
  # Must include ... because the generic 'biplot' does

  gen.group <- x$gen.group
  env.group <- x$env.group
  genCoord <- x$genCoord
  locCoord <- x$locCoord
  blockCoord <- x$blockCoord
  genMeans <- x$genMeans
  R2 <- x$R2
  pctMiss <- x$pctMiss

  groupNames <- names(table(env.group))
  n.gen.grp <- length(unique(gen.group)) # 0 for NULL
  n.env.grp <- length(unique(env.group))

  # Add options to subtitle
  if(subtitle != "") subtitle <- paste0(subtitle, ", ")
  subtitle <- paste0(subtitle, "method=", x$method)
  subtitle <- paste0(subtitle, ", center=", x$center)
  subtitle <- paste0(subtitle, ", scale=", x$scale)
  subtitle <- paste0(subtitle, ", missing: ", round(pctMiss*100,1), "%")

  # Environment (group) colors (first one is used for environments)
  # Replicate colors if not enough have been specified
  col.env <- c(col.env, "blue","black","purple","darkgreen", "red",
               "dark orange", "deep pink", "#999999", "#a6761d")
  if(n.env.grp < 2) {
    col.env <- col.env[1]
  } else {
    col.env <- rep(col.env, length=n.env.grp)
  }

  # If alpha transparency is supported, use 70%=180
  if(.Device != "windows") {
    col.env <- col2rgb(col.env)
    col.env <- rgb(col.env[1,], col.env[2,], col.env[3,],
                   alpha=180, maxColorValue=255)
    col.gen <- col2rgb(col.gen)
    col.gen <- rgb(col.gen[1,], col.gen[2,], col.gen[3,],
                   alpha=180, maxColorValue=255)
  }

  # Flip. If 'auto', flip the axis so that genotype ordinate is positively
  # correlated with genotype means.
  if(length(flip)<length(comps)) flip <- rep(flip,length=length(comps))
  for(i in 1:length(comps)){
    ix <- comps[i]
    if(flip[i]==TRUE | (flip[i]=="auto" & cor(genMeans, genCoord[,ix]) < 0)){
      locCoord[, ix] <-  - locCoord[, ix]
      genCoord[, ix] <-  - genCoord[, ix]
      blockCoord[, ix] <- - blockCoord[, ix]
    }
  }

  # Set up plot
  par(pty='s')

  xcomp <- comps[1] # Component for x axis
  ycomp <- comps[2] # Component for y axis

  # Axis labels
  labs <- paste("PC ", c(xcomp, ycomp),
                  " (", round(100*R2[c(xcomp,ycomp)],0), "% TSS)", sep="")
  xlab <- labs[1]
  ylab <- labs[2]

  expand.range <- function(xx) { # Make sure range includes origin
    if(xx[1] > 0) xx[1] <-  - xx[1]
    else if(xx[2] < 0) xx[2] <-  - xx[2]
    return(xx)
  }

  # We are most interested in the genotypes, so fit the plotting window to
  # the genotypes first, making genotypes fill as much of the window as
  # possible.  Then find the scaling factor to make locations fill the window.
  rg1 <- expand.range(range(genCoord[, xcomp]))
  rg2 <- expand.range(range(genCoord[, ycomp]))
  xmid <- mean(range(rg1))
  ymid <- mean(range(rg2))
  # Half-width (and half-height) of box. Make axes same length.
  half <- 1.05 * max(diff(rg1), diff(rg2))/2 # Add 5% on each side
  xlimg <- c(xmid-half, xmid+half)
  ylimg <- c(ymid-half, ymid+half)
  # Block coord are always 'inside' loc coord box
  re1 <- expand.range(range(locCoord[, xcomp]))
  re2 <- expand.range(range(locCoord[, ycomp]))
  ratio <- max(c(re1, re2)/c(xlimg, ylimg)) * 1.1 # Why 1.1 ?
  xlime <- xlimg*ratio
  ylime <- ylimg*ratio

  # Set up plot for environment vectors
  plot(NULL, type = "n", xaxt="n", yaxt="n", xlab="", ylab="",
       xlim=xlime, ylim=ylime)

  # Add the margin axis labels and titles
  mtext(xlab, side=1, line=.5, cex=.8)
  mtext(ylab, side=2, line=.5, cex=.8)
  mtext(title, side=3, line=2.5)
  mtext(subtitle, side=3, line=0.9, cex=.7)
  # abline(v = 0, h=0, lty = 3, col="gray80") # dashed lines through the 'origin'

  # Add a circle of unit radius to standardized biplots.
  # Do this first so we don't overwrite group/genotype labels and so that
  # the unit circle is on the locCoord scale, not the genCoord scale.
  if(x$scale) {
    angles <- seq(from=0,to=2*pi,length=100)
    radius <- 1  # sqrt(nrow(genCoord - 1))
    xc <- radius * sin(angles)
    yc <- radius * cos(angles)
    lines(xc,yc,col="tan")
  }

  # Plot locs first (points OR labels, but not both) colored by group
  if(is.null(env.group)) {
    eix <- rep(1, nrow(locCoord))
  } else eix <- as.numeric(factor(env.group))

  if(lab.env == TRUE) {
    text(locCoord[ , c(xcomp, ycomp), drop = FALSE],
         rownames(locCoord), cex=cex.env, col = col.env[eix])
  } else points(locCoord[ , c(xcomp, ycomp), drop = FALSE],
                cex = cex.env, col = col.env[eix]) # pch = (1:n.env.grp)[eix])

  # Draw vectors.  Shorten by 5% to reduce over-plotting the label
  if(n.env.grp < 2){
    # Draw vector to each loc
    segments(0, 0, .95*locCoord[,xcomp], .95*locCoord[,ycomp], col = col.env[1])
  } else {
    # Short residual vectors from group mean to each loc
    if(res.vec) {
      segments(blockCoord[ , xcomp], blockCoord[ , ycomp],
               locCoord[ , xcomp], locCoord[ , ycomp],
               col = col.env[eix], lwd = .5)
    }

    # Draw solid-line part of the group vector
    ubc <- blockCoord[groupNames,] # Get unique row for each group
    segments(0, 0, ubc[ , xcomp], ubc[ , ycomp], lwd = 2, col=col.env) # no 'eix'
    # End point
    # points(ubc[ , c(xcomp,ycomp)], pch = 16, col=col.env) # no 'eix'
    # The 'xy' variable extends the vector to the edge of plot
    xy <- extend(ubc[ , xcomp], ubc[ , ycomp], xlime, ylime)
    # Now the extended dashed-line part of the group vector.  Shorten by 5%
    # to reduce over-plotting.
    segments(ubc[ , xcomp], ubc[ , ycomp],
             .95*xy[,1], .95*xy[,2], lty = 3, col=col.env)
    # Group label
    text(xy[,1], xy[,2], rownames(ubc), cex = 1, col=col.env)
  }

  pch.gen <- c(pch.gen, setdiff(1:20, pch.gen))
  if(n.gen.grp < 2) {
    col.gen <- col.gen[1] # in case there are multiple colors
    pch.gen <- pch.gen[1]
  } else {
    col.gen <- rep(col.gen, length=n.gen.grp)
    pch.gen <- rep(pch.gen, length=n.gen.grp)
  }

  # New coordinate system for genotypes
  par(new = TRUE)
  plot(NULL, type = "n", xaxt="n", yaxt="n", xlab="", ylab="",
       xlim=xlimg, ylim=ylimg)

  # Now overlay genotype labels and/or points
  if(n.gen.grp < 2) {
    text(genCoord[, c(xcomp, ycomp)], rownames(genCoord), cex=cex.gen, col=col.gen)
  } else {
    gix <- as.numeric(as.factor(gen.group))
    points(genCoord[, c(xcomp, ycomp)], cex=cex.gen, col=col.gen[gix], pch=pch.gen[gix])
    text(genCoord[, c(xcomp, ycomp)], paste(" ",rownames(genCoord)),
         cex=cex.gen, col=col.gen[gix], adj=c(0,.5))
  }

  invisible()

}

nipals <- function(x, maxcomp=min(nrow(x), ncol(x)-1),
                    completeObs=TRUE,
                    maxiter=50*nrow(x),
                    tol=1e-6, propvar=1,
                    center=TRUE, scale.=FALSE, verbose=FALSE) {
  # Calculate principal components using NIPALS
  # Author: Kevin Wright

  # A nice summary of NIPALS is here:
  # http://statmaster.sdu.dk/courses/ST02/module06/index.html

  # This currently produces an object of class 'prcomp', but maybe it
  # would be better to return objects the same way that svd does???

  x <- as.matrix(x)
  x.orig <- x # Save x for replacing missing values
  x <- scale(x, center=center, scale=scale.)
  cen <- attr(x, "scaled:center")
  sc <- attr(x, "scaled:scale")
  if (any(sc == 0))
    stop("cannot rescale a constant/zero column to unit variance")

  nr <- nrow(x)
  nc <- ncol(x)

  # sum(NA, na.rm=TRUE) is 0, but we want NA
  sum.na <- function(x){ ifelse(all(is.na(x)), NA, sum(x, na.rm=TRUE))}

  n.missing <- sum(is.na(x))

  # Check for a column/row with all NAs
  col.count <- apply(x, 2, function(x) sum(!is.na(x)))
  if(any(col.count==0)) warning("At least one column is all NAs")
  row.count <- apply(x, 1, function(x) sum(!is.na(x)))
  if(any(row.count==0)) warning("At least one row is all NAs")

  # Find a starting column (with fewest number of NAs)
  # startingColumn <- which.max(col.count)
  startingColumn <- ncol(x)
  # Choose the column with maximum variation.
  # Maybe we should do this inside the loop for each PC
  #startingColumn <-
  #  which.max(apply(x, 2, function(z) {
  #    z <- na.omit(z)
  #    ifelse(length(z)==1, NA, var(z))
  #  }))
  if(verbose >= 2) cat("Starting column: ", startingColumn, "\n")

  TotalSS <- sum(x*x, na.rm=TRUE)

  eval <- R2cum <- scores <- loadings <- NULL
  anotherPC <- TRUE
  comp <- 1

  while(anotherPC) {
    iter <- 0
    u <- x[,startingColumn]
    continue <- TRUE
    if(verbose >= 1) cat(paste("\nCalculating PC", comp, ": ", sep=""))

    while(continue) {
      iter <- iter+1

      # Calculate LOADINGS v=x'u, then normalize
      # Note x*u is column-wise multiplication
      v <- apply(x*u, 2, sum.na)
      v <- v / sqrt(sum(v*v, na.rm=TRUE))

      # Calculate SCORES u = xv
      # Cute trick: To get row-wise multiplication, use t(x)*v, then
      # be sure to use apply(,2,) and NOT apply(,1,)!
      u.old <- u
      u <- apply(t(x)*v, 2, sum.na)

      # Check convergence criteria
      if (iter > maxiter) stop("Exceeding ", maxiter, " iterations, quitting")
      if( sum((u.old-u)^2, na.rm=TRUE)<tol ) continue=FALSE

      if (verbose >= 1) cat("*")
    }
    if (verbose >= 1) cat(" Done\n")

    # Remove the estimated principal component from x, x-uv'
    x <- x - (u %*% t(v))
    scores <- cbind(scores, u)
    loadings <- cbind(loadings, v)
    eval <- c(eval, sum(u*u))
    if(verbose >= 2) {
      cat("scores\n")
      print(head(u))
      cat("loadings\n")
      print( head(v))
    }

    # Cumulative proportion of variance
    R2cum <- c(R2cum, 1 - (sum(x*x,na.rm=TRUE) / TotalSS))
    if(comp==maxcomp)
      anotherPC <- FALSE
    else if(R2cum[comp] >= propvar) {
      # Maybe I should set maxcomp=comp here?  Will the user be confused
      # if he requests 10 comps and only 9 are returned?
      # maxcomp <- comp
      anotherPC <- FALSE
    } else
      comp <- comp + 1

  } # Done finding PCs

  # Un-cumulate R2
  R2 <- c(R2cum[1], diff(R2cum))

  # This is a re-construction of x using maxcomp principal components
  fitted.values <- scores[ , 1:maxcomp] %*% t(loadings[ , 1:maxcomp])
  if(scale.) fitted.values <- fitted.values * attr(x, "scaled:scale")
  if(center) fitted.values <- fitted.values + attr(x, "scaled:center")

  # Replace missing values in the original matrix with fitted values
  completeObs <- x.orig
  completeObs[is.na(x.orig)] <- fitted.values[is.na(x.orig)]

  # Prepare output
  rownames(scores) <- rownames(x)
  colnames(scores) <- paste("PC", 1:ncol(scores), sep="")
  rownames(loadings) <- colnames(x)
  colnames(loadings) <- paste("PC", 1:ncol(loadings), sep="")
  out <- list(x=scores, rotation=as.matrix(loadings),
              completeObs=completeObs,
              maxcomp=maxcomp,
              center=if(is.null(cen)) FALSE else cen,
              scale=if(is.null(sc)) FALSE else sc,
              sdev=apply(scores, 2, sd),
              R2=R2, nr=nr, nc=nc,
              eval=eval,
              propvar=propvar,
              n.missing=n.missing)
  class(out) <- c("nipals","prcomp")
  return(out)
}
