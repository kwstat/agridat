#' Load multiple packages and install if needed
#'
#' Install and load packages "on the fly".
#' 
#' The 'agridat' package uses dozens of packages in the examples for each dataset.
#' The 'libs' function provides a simple way to load multiple packages at once,
#' and can install any missing packages on-the-fly.
#'
#' This is very similar to the `pacman::p_load` function.
#'
#' @param ... Comma-separated unquoted package names
#' @return None
#' @author Kevin Wright
#' @examples 
#' \dontrun{
#' libs(dplyr,reshape2)
#' }
#' @references 
#' None
#' @importFrom utils install.packages installed.packages
#' @export 
libs <- function (...) {
  args <- as.list(match.call())[-1]
  packs <- sapply(args, function(x)
    if (is.character(x)) x else deparse(x))
  ip <- rownames(installed.packages())
  for (p in packs) {
    if (!(p %in% ip)) 
      install.packages(p)
    library(p, character.only = TRUE)
  }
}
