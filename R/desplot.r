# desplot.r
# Time-stamp: <21 May 2012 19:48:59 c:/x/rpack/agridat/R/desplot.r>
# Copyright 2011, Kevin Wright

# Needs grid, lattice, reshape2

RedGrayBlue <- colorRampPalette(c("firebrick", "lightgray", "#305a7f"))

desplot <- function(form=formula(NULL ~ x + y), data,
                    num=NULL, col=NULL, text=NULL, out1=NULL, out2=NULL,
                    col.regions=RedGrayBlue, col.text=NULL, text.levels=NULL,
                    out1.gpar=gpar(col="black", lwd=3),
                    out2.gpar=gpar(col="yellow", lwd=1, lty=1),
                    at, ticks=FALSE, flip=FALSE,
                    main=NULL, xlab, ylab,
                    shorten='abb',
                    show.key=TRUE,
                    key.cex, # left legend cex
                    cex=.4, # cell cex
                    strip.cex=.75, ...){

  # Use data name for default title
  if(missing(main)) main <- deparse(substitute(data))

  # Force character, in case we forgot to quote the argument
  dn <- names(data)
  cleanup <- function(x, dn){
    if(is.null(x)) return(x)

    if(!is.character(x)) x <- deparse(x)
    if(!is.element(x, dn))
      stop("Couldn't find '", x,"' in the data frame.")
    return(x)
  }
  num.var <- cleanup(substitute(num), dn)
  col.var <- cleanup(substitute(col), dn)
  text.var <- cleanup(substitute(text), dn)
  out1.var <- cleanup(substitute(out1), dn)
  out2.var <- cleanup(substitute(out2), dn)

  has.num <- !is.null(num.var)
  has.col <- !is.null(col.var)
  has.text <- !is.null(text.var)
  has.out1 <- !is.null(out1.var)
  has.out2 <- !is.null(out2.var)
  if(has.num & has.text) stop("Specify either 'num' or 'text'")

  data <- droplevels(data) # In case the user called with subset(obj, ...)

  # Split a formula like: resp~x*y|cond into a list of text strings called
  # resp, xy (vector like 'x' '*' 'y') , cond ('cond' could be a vector)
  ff <- latticeParseFormula(form, data)
  ff <- list(resp = ff$left.name,
             xy = strsplit(ff$right.name, " ")[[1]],
             cond = names(ff$cond))
  if(length(ff$resp)==0L) ff$resp <- NULL

  fill.var <- ff$resp
  x.var <- ff$xy[1]
  y.var <- ff$xy[3]
  panel.var <- ff$cond[1]

  # If ticks are requested, add axis labels
  if (missing(xlab))
    xlab <- ifelse(ticks, x.var, "")
  if (missing(ylab))
    ylab <- ifelse(ticks, y.var, "")

  # Determine what fills the cells: nothing, factor, or numeric
  if(is.null(fill.var)) fill.type="none"
  else fill.type <- ifelse(is.factor(data[[fill.var]]), "factor", "num")

  # Now get the fill values/length
  if(fill.type=="none") {
    fill.val <- rep(1, nrow(data))
    fill.n <- 1
    # Hack.  We need something to plot, call it .const
    form <- as.formula(paste(".const", form[[1]], deparse(form[[2]]), sep=""))
    data[['.const']] <- fill.val
  } else if(fill.type=="num"){
    fill.val <- data[[fill.var]]
  } else { # factor
    fill.val <- data[[fill.var]]
    fill.n <- nlevels(fill.val)
  }

  # Define fill colors and 'at' (if not given by the user)
  # at = # cut points for region colors
   if(fill.type=="none") {
    col.regions <- "transparent"
    at <- c(0.5,1.5)
  }
  else if(fill.type=="factor"){
    # If col.regions is a function, switch to default fill colors
    if(is.function(col.regions))
      col.regions <- c("#E6E6E6","#FFD9D9","#FFB2B2","#FFD7B2","#FDFFB2",
                       "#D9FFB2","#B2D6FF","#C2B2FF","#F0B2FF","#A6FFC9",
                       "#FF8C8C","#B2B2B2","#FFBD80","#BFFF80","#80BAFF",
                       "#9980FF","#E680FF","#D0D192","#59FF9C","#FFA24D",
                       "#FBFF4D","#4D9FFF","#704DFF","#DB4DFF","#808080",
                       "#9FFF40","#C9CC3D")
    col.regions <- rep(col.regions, length=fill.n)
    at <- c((0:fill.n)+.5)
  }
  else if(fill.type=="num") {
    # col.regions can be either a function, or vector.  Make it a vector.
    zrng <- lattice:::extend.limits(range(as.numeric(fill.val), finite = TRUE))
    if(is.function(col.regions)) {
      # if 'at' is not given, use 16 break points (15 colors)
      if(missing(at)) at <- seq(zrng[1], zrng[2], length.out = 16)
      col.regions <- col.regions(length(at)-1)
    } else {
      nbins <- length(col.regions)
      if(missing(at)) {
        at <- seq(zrng[1], zrng[2], length.out = nbins + 1)
      } else {
        if(nbins != length(at)-1) stop("Length of 'at' must be 1 more than length of 'col.regions'\n")
      }
    }
  }

  # Text colors
  if(is.null(col.text))
    col.text <- c("black", "red3", "darkorange2", "chartreuse4",
                  "deepskyblue4", "blue", "purple4", "darkviolet", "maroon")

  # Change x/y from factor to numeric if needed.  Add missing levels.
  fac2num <- function(x) as.numeric(levels(x))[x]
  if(is.factor(data[[x.var]])) data[[x.var]] <- fac2num(data[[x.var]])
  if(is.factor(data[[y.var]])) data[[y.var]] <- fac2num(data[[y.var]])
  data <- .addLevels(data, x.var, y.var, panel.var)

  # Check for multiple values
  if(is.null(panel.var)){
    tt <- table(data[[x.var]], data[[y.var]])
  } else {
    tt <- table(data[[x.var]], data[[y.var]], data[[panel.var]])
  }
  if(any(tt>1))
    warning("There are multiple data for each x/y/panel combination")

  # Calculate 'lr' rows in legend, 'lt' legend text strings
  lr <- 0
  lt <- NULL

  if(has.out1){ # out1
    lr <- lr + 1
    lt <- c(lt, out1.var)
  }
  if(has.out2){ # out2
    lr <- lr + 1
    lt <- c(lt, out2.var)
  }
  if(has.out1 | has.out2) lr <- lr + 1 # blank line

  if(fill.type=="factor") { # fill
    lt.fill <- levels(fill.val)
    lr <- lr + 2 + fill.n
    lt <- c(lt, lt.fill)
  }

  if(has.num) { # number
    num.val <- factor(data[[num.var]])
    lt.num <- levels(num.val)
    num.n <- length(lt.num)
    lr <- lr + 2 + num.n
    lt <- c(lt, lt.num)
  }

  if(has.col) { # color
    col.val <- factor(data[[col.var]]) # In case it is numeric
    lt.col <- levels(col.val)
    col.n <- length(lt.col)
    lr <- lr + 2 + col.n
    lt <- c(lt, lt.col)
    if(length(col.text) < col.n) col.text <- rep(col.text, length=col.n)
  } else {
    col.val <- rep(1, nrow(data)) # No color specified, use black by default
  }

  if(has.text) { # text
    text.val <- factor(data[[text.var]]) # in case not factor
    lt.text <- levels(text.val)
    text.n <- length(lt.text)
    lr <- lr + 2 + text.n
    lt <- c(lt, lt.text)
    #if(length(col.text) < text.n) col.text <- rep(col.text, length=text.n)
  }

  # Set up short version of text
  if(has.text & is.null(text.levels)){
    if(shorten=='no' | shorten=='none')
      text.levels <- lt.text
    else if (shorten=='abb')
      text.levels <- abbreviate(lt.text, 2, method='both')
    else if (shorten=='sub')
      text.levels <- substring(lt.text, 1, 3)
  } else {
    # Nothing.  Why is this here?
  }

  # We might not have a key, even though it was requested
  if (lr==0) show.key <- FALSE

  # ----- Now we can actually set up the legend grobs -----
  if(show.key) {
    longstring <- lt[which.max(nchar(lt))]
    if(missing(key.cex)) {
      if(lr < 30) key.cex <- 1
      else if(lr < 40) key.cex <- .75
      else key.cex <- 0.5
    }

    foo <- frameGrob(layout = grid.layout(nrow = lr, ncol = 2,
                       heights = unit(rep(key.cex, lr), "lines"),
                       widths = unit(c(1,1), c("cm","strwidth"),
                         data=list(NULL, longstring))))

    offset <- 1

    if(has.out1){ # outline
      foo <- placeGrob(foo, linesGrob(x = unit(c(.2, .8), "npc"),
                                      y = unit(.5, "npc"),
                                      gp=out1.gpar),
                       row = offset, col = 1)
      foo <- placeGrob(foo, textGrob(label = out1.var, gp=gpar(cex=key.cex)),
                       row = offset, col = 2)
      offset <- offset + 1
    }
    if(has.out2){
      foo <- placeGrob(foo, linesGrob(x=c(.2,.8), y=.5, gp=out2.gpar),
                       row = offset, col = 1)
      foo <- placeGrob(foo, textGrob(label = out2.var, gp=gpar(cex=key.cex)),
                       row = offset, col = 2)
      offset <- offset + 1
    }
    if(has.out1 | has.out2) offset <- offset + 1 # blank line

    if(fill.type=='factor') {  # fill
      foo <- placeGrob(foo, textGrob(label = fill.var, gp=gpar(cex=key.cex)),
                       row = offset, col = 2)
      for(kk in 1:fill.n){
        foo <- placeGrob(foo, rectGrob(width = 0.6,
                                       gp = gpar(col="#FFFFCC",
                                         fill=col.regions[kk], cex=key.cex)),
                         row = offset + kk, col = 1)
        foo <- placeGrob(foo, textGrob(label = lt.fill[kk],
                                       gp=gpar(cex=key.cex)),
                         row = offset+kk, col = 2)
      }
      offset <- offset + 1 + fill.n + 1
    }

    if(has.num) { # number
      foo <- placeGrob(foo, textGrob(label = num.var, gp=gpar(cex=key.cex)),
                       row = offset, col = 2)
      for(kk in 1:num.n){
        foo <- placeGrob(foo, textGrob(label = kk, gp=gpar(cex=key.cex)),
                         row = offset + kk, col = 1)
        foo <- placeGrob(foo, textGrob(label = lt.num[kk], gp=gpar(cex=key.cex)),
                         row = offset + kk, col = 2)
      }
      offset <- offset + 1 + num.n + 1
    }

    if(has.col) { # color
      foo <- placeGrob(foo, textGrob(label = col.var, gp=gpar(cex=key.cex)),
                       row = offset, col = 2)
      for(kk in 1:col.n){
        foo <- placeGrob(foo, pointsGrob(.5,.5, pch=19,
                                         gp=gpar(col=col.text[kk],
                                           cex=key.cex)),
                         row = offset + kk, col = 1)
        foo <- placeGrob(foo, textGrob(label = lt.col[kk], gp=gpar(cex=key.cex)),
                         row = offset + kk, col = 2)
      }
      offset <- offset + 1 + col.n + 1
    }

    if(has.text) { # text
      foo <- placeGrob(foo, textGrob(label = text.var, gp=gpar(cex=key.cex)),
                       row = offset, col = 2)
      for(kk in 1:text.n){
        foo <- placeGrob(foo, textGrob(label = text.levels[kk],
                                       gp=gpar(cex=key.cex)),
                         row = offset + kk, col = 1)
        foo <- placeGrob(foo, textGrob(label = lt.text[kk], gp=gpar(cex=key.cex)),
                         row = offset + kk, col = 2)
      }
      offset <- offset + 1 + text.n + 1
    }

  } else foo <- NULL

  # Cell text
  if(has.text) {
    cell.text <- text.levels[as.numeric(text.val)]
  } else if(has.num) {
    cell.text <- as.numeric(num.val)
  } else if(has.col) {
    cell.text <- rep("x", length=nrow(data))
  }

  out1.val <- if(has.out1) data[[out1.var]] else NULL
  out2.val <- if(has.out2) data[[out2.var]] else NULL

  out <-
    levelplot(form,
              data=data
              , out1f=out1.val, out1g=out1.gpar
              , out2f=out2.val, out2g=out2.gpar
              , flip=flip
              , col.regions=col.regions
              , colorkey = if(fill.type=="num") TRUE else FALSE
              , as.table=TRUE
              , at=at
              , legend=if(show.key) list(left=list(fun=foo)) else list()
              , main=main
              , xlab=xlab
              , ylab=ylab
              , scales=list(relation='free' # Different scales for each panel
                  , draw=ticks # Don't draw panel axes
                  )
              , prepanel = prepanel.desplot
              , panel=function(x, y, z, subscripts, groups, ...,
                  out1f, out1g, out2f, out2g){
                # First fill the cells and outline
                panel.outlinelevelplot(x, y, z, subscripts, at, ...,
                                       out1f=out1f, out1g=out1g,
                                       out2f=out2f, out2g=out2g)
                # Then, if we have numbers, colors, or text
                if(has.num|has.text|has.col)
                  panel.text(x[subscripts], y[subscripts],
                             cell.text[subscripts],
                             cex=cex,
                             col=col.text[as.numeric(col.val[subscripts])])
              },
              strip=strip.custom(par.strip.text=list(cex=strip.cex)), ...)

  # Use 'update' for any other modifications
  #if(!show.key) out <- update(out, legend=list(left=NULL))

  return(out)
}

prepanel.desplot <- function (x, y, subscripts, flip, ...) {
  # based on lattice:::prepanel.default.levelplot
  pad <- lattice.getOption("axis.padding")$numeric

  # Note: x and y are NOT factors
  
  if (length(subscripts) > 0) {
    x <- x[subscripts]
    y <- y[subscripts]
    
    ux <- sort(unique(x[is.finite(x)]))
    if ((ulen <- length(ux)) < 2) 
      xlim <- ux + c(-1, 1)
    else {
      diffs <- diff(as.numeric(ux))[c(1, ulen - 1)]
      xlim <- c(ux[1] - diffs[1]/2, ux[ulen] + diffs[2]/2)
    }
    uy <- sort(unique(y[is.finite(y)]))
    if ((ulen <- length(uy)) < 2) 
      ylim <- uy + c(-1, 1)
    else {
      diffs <- diff(as.numeric(uy))[c(1, ulen - 1)]
      ylim <- c(uy[1] - diffs[1]/2, uy[ulen] + diffs[2]/2)
    }

    # This is returned
    ret <- list(xlim = lattice:::extend.limits(xlim, prop = -pad/(1 + 2 * pad)),
                ylim = lattice:::extend.limits(ylim, prop = -pad/(1 + 2 * pad)),
                dx = length(ux),
                dy = length(uy))
    if(flip) ret$ylim <- rev(ret$ylim)
    
    ret
  }
  else {
    # This is the value of the prepanel.null() function
    list(xlim = rep(NA_real_, 2), ylim = rep(NA_real_, 2), dx = NA_real_, 
        dy = NA_real_)
  }
}

# Based on panel.levelplot
panel.outlinelevelplot <- function(x, y, z, subscripts, at, ...,
           alpha.regions = 1, out1f, out1g, out2f, out2g) {
    dots=list(...)
    col.regions=dots$col.regions

    # parent function forces x,y to be numeric, not factors
    
    if (length(subscripts) == 0L) return()
    
    z <- as.numeric(z)
    zcol <- level.colors(z, at, col.regions, colors = TRUE)
    x <- x[subscripts]
    y <- y[subscripts]

    zlim <- range(z, finite = TRUE)
    z <- z[subscripts]
    zcol <- zcol[subscripts]
    
    ux <- sort(unique(x[!is.na(x)])) 
    bx <- if (length(ux) > 1L) { # breakpoints
      c(3 * ux[1] - ux[2], ux[-length(ux)] + ux[-1],
        3 * ux[length(ux)] - ux[length(ux) - 1])/2
    } else ux + c(-0.5, 0.5)
    lx <- diff(bx) # lengths? I think this is same as rep(1, length(ux))
    cx <- (bx[-1] + bx[-length(bx)])/2  # centers

    uy <- sort(unique(y[!is.na(y)]))
    by <- if (length(uy) > 1) {
      c(3 * uy[1] - uy[2], uy[-length(uy)] + uy[-1],
        3 * uy[length(uy)] - uy[length(uy) - 1])/2
    } else uy + c(-0.5, 0.5)
    ly <- diff(by)
    cy <- (by[-1] + by[-length(by)])/2

    idx <- match(x, ux)
    idy <- match(y, uy)

    # Fill the cells
    grid.rect(x = cx[idx], y = cy[idy],
              width=lx[idx],
              height = ly[idy],
              default.units = "native",
              gp = gpar(fill = zcol, lwd = 1e-05, col="transparent",
                alpha = alpha.regions))

    draw.outline <- function(x, y, lab, gp) {
      # x,y are coords, lab=grouping for outline, gp=graphics par
      out1 <- data.frame(x=x, y=y, lab=lab, stringsAsFactors = FALSE)
      out1 <- melt(out1, id.var=c('x','y'))
      # reshape melts char vector to char, reshape 2 melts to factor!
      # both packages could be attached, hack to fix this...
      out1$value <- as.character(out1$value)
      out1 <- acast(out1, y~x)
      # Careful.  The 'out' matrix is upside down from the levelplot

      # Since 'out' could be 1 row or column, surround it with NAs
      out1 <- cbind(NA, rbind(NA, out1, NA), NA)
      
      # Horizontal lines above boxes
      hor <- out1[2:nrow(out1)-1, ] != out1[2:nrow(out1), ]
      hor <- melt(hor)
      hor <- hor[!(hor$value==FALSE | is.na(hor$value)),]
      if(nrow(hor)>0) {
        hx <- hor[,2] # reshape uses X2, reshape2 uses Var2
        hy <- hor[,1]
        grid.polyline(x=c(hx-.5, hx+.5), y=c(hy+.5, hy+.5),
                      id=rep(1:length(hx), 2), default.units="native", gp=gp)
      }
      # Vertical lines along right side of boxes
      vert <- out1[ , 2:ncol(out1)-1] != out1[ , 2:ncol(out1)]
      vert <- melt(vert)
      vert <- vert[!(vert$value==FALSE | is.na(vert$value)),]
      if(nrow(vert)>0) {
        vx <- vert[,2]
        vy <- vert[,1]
        grid.polyline(x=c(vx+.5, vx+.5), y=c(vy-.5, vy+.5),
                      id=rep(1:length(vx), 2), default.units="native", gp=gp)
      }

    }

    # Outline factor 1
    if(!is.null(out1f))
      draw.outline(x, y, as.character(out1f[subscripts]), out1g)

    # Outline factor 2
    if(!is.null(out2f))
      draw.outline(x, y, as.character(out2f[subscripts]), out2g)

    return()
}

.addLevels <- function(dat, xvar='x', yvar='y', locvar=NULL){
  # For each loc, we want x/y coords to be complete.
  # NO: 1,2,4.  YES: 1,2,3,4.
  # Add one NA datum for each missing x and each missing y
  # This does NOT completely fill in the grid (as needed by asreml)

  # Original values
  ox <- dat[[xvar]]
  oy <- dat[[yvar]]

  x.is.factor <- is.factor(ox)
  y.is.factor <- is.factor(oy)
  if(x.is.factor | y.is.factor) stop("FIXME: x or y are factors.")

  if(is.null(locvar)) {
    loclevs <- factor("1") # hack alert
  } else {
    oloc <- factor(dat[[locvar]]) # In case loc is character
    loclevs <- levels(oloc)
  }

  for(loc.i in loclevs){

    if(is.null(locvar)){
      ux <- sort(unique(ox))
      uy <- sort(unique(oy))
    } else {
      ux <- sort(unique(ox[oloc==loc.i]))
      uy <- sort(unique(oy[oloc==loc.i]))
    }
    # Add new rows and columns. Fill with missing data
    xnew <- setdiff(seq(from=min(ux), to=max(ux), by=1), ux)
    ynew <- setdiff(seq(from=min(uy), to=max(uy), by=1), uy)
    if(length(xnew) > 0){
      newrows <- nrow(dat) + 1:length(xnew)
      dat[newrows, xvar] <- xnew # R creates these rows
      if(!is.null(locvar))
        dat[newrows, locvar] <- rep(loc.i, length(xnew))
    }
    if(length(ynew) > 0){
      newrows <- nrow(dat) + 1:length(ynew)
      dat[newrows, yvar] <- ynew
      if(!is.null(locvar))
        dat[newrows, locvar] <- rep(loc.i, length(ynew))
    }
  }
  return(dat)
}

# ----------------------------------------------------------------------------
if(FALSE){
  data(yates.oats, package="agridat")
  oats35 <- yates.oats

  desplot(yield~x+y, oats35)
  desplot(yield~x+y|block, oats35)

  # Text over continuous colors
  desplot(yield~x+y, oats35, out1=block, text=gen, cex=1,
          xlab="x axis", ylab="y axis", ticks=TRUE)

  desplot(yield~x+y, oats35, out2=block)
  desplot(yield~x+y, oats35, out1=block, out2=gen)
  desplot(gen~x+y, oats35, col=block, num=nitro, cex=1, out1=block)

  # Test 'at' and 'col.regions' for the ribbon
  RedYellowBlue <-
    colorRampPalette(c("#D73027", "#F46D43", "#FDAE61", "#FEE090", "#FFFFBF",
                       "#E0F3F8", "#ABD9E9", "#74ADD1", "#4575B4"))
  eightnum <- function(x) {
    x <- x[!is.na(x)]
    st <- boxplot.stats(x)$stats
    # eps <- .Machine$double.eps
    eps <- 10^(log10(127.4)-6)
    c(min(x)-eps, st[1:2], st[3]-eps, st[3]+eps, st[4:5], max(x)+eps)
  }
  desplot(yield~x+y, oats35, col.regions=RedYellowBlue(7))
  desplot(yield~x+y, oats35, at=eightnum(oats35$yield))
  desplot(yield~x+y, oats35, col.regions=RedYellowBlue(7),
          at=eightnum(oats35$yield))


  # Test abbreviations
  desplot(block~x+y, oats35, col=nitro, text=gen, cex=1, shorten='abb') # def
  desplot(block~x+y, oats35, col=nitro, text=gen, cex=1, shorten='sub')
  desplot(block~x+y, oats35, col=nitro, text=gen, cex=1, shorten='no')


  # Show actual yield values
  desplot(block~x+y, oats35, text=yield, shorten='no')

  desplot(block~x+y, oats35, col=nitro, text=gen, cex=1, out1=block)
  desplot(block~x+y, oats35, col=nitro, text=gen, cex=1, out1=block, out2=gen)
  desplot(block~x+y, oats35, num="gen", col="nitro", cex=1)

  # Test custom labels
  desplot(block~x+y, oats35, text="gen", col="nitro", cex=1, text.levels=c('V','G','M'))
  desplot(nitro~x+y, oats35, text="gen", cex=.9)
  desplot(nitro~x+y, oats35)
  desplot(nitro~x+y|block, oats35, text="gen", cex=.9)

  # No fill color at all
  desplot(~x+y|block, oats35, text="gen", cex=1)
  desplot(~x+y, oats35, col="gen", cex=1)

  desplot(nitro~x+y|block, oats35, text="gen", cex=1)
  desplot(block~x+y|block, oats35, col="nitro", text="gen", cex=1)

  # stop

  # Check the 'cleanup' function.  These all err (as they should)
  desplot(yield~x+y, oats35, num=junk)
  desplot(yield~x+y, oats35, col=junk)
  desplot(yield~x+y, oats35, text=junk)
  desplot(yield~x+y, oats35, out1=junk)
  desplot(yield~x+y, oats35, out2=junk)

}
