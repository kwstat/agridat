# defunct.r
# Time-stamp: c:/x/rpack/agridat/R/defunct.r

.onAttach <- function(lib,pkg,...){
  packageStartupMessage("The desplot and gge functions are now in the 'agrifun' package.\n")
  invisible()
}

## desplot <- .Deprecated("agrifun::desplot",
##                        msg="The 'desplot' function is now in the agrifun package.")

## gge <- .Deprecated("agrifun::gge",
##                    msg="The 'gge' function is now in the agrifun package.")
