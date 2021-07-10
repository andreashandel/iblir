#' iblir: A package to learn basic stats
#'
#' The package provides a number of shiny/learnr apps
#'
#' To learn more about how to use the package, see the vignette
#' or the short introduction on the package github repository.
#' https://github.com/andreashandel/iblir
#'
#' @docType package
#' @name iblir
#' @import learnr
NULL

.onAttach <- function(libname, pkgname){
  packageStartupMessage("Welcome to the iblir package. Type `run_tutorial('LabN', package = 'iblir')` to open each lab. \nReplace N with the number of the lab you want to run (1 - 13). \nSee the vignette for lab details.")
}
