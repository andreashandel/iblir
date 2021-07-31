#' iblir: A package to learn basic stats
#'
#' @description
#'
#' The package provides a number of shiny/learnr apps
#' To learn more about how to use the package, see the vignette
#' or the short introduction on the package github repository.
#' https://github.com/andreashandel/iblir
#'
#' @section Running a tutorial:
#'
#' To run a tutorial execute:
#'
#' \code{learnr::run_tutorial("name_of_tutorial", package = "adventr")}
#'
#' replacing \emph{name_of_tutorial} with the name of the tutorial (i.e., LAbN, whith N the lab number). For example, to run lab 2:
#'
#' \code{learnr::run_tutorial("Lab2", package = "iblir")}
#'
#'
#'
#' @docType package
#' @name iblir
#' @import learnr
NULL

.onAttach <- function(libname, pkgname){
  packageStartupMessage("Welcome to the iblir package. Type `run_tutorial('LabN', package = 'iblir')` to open each lab. \nReplace N with the number of the lab you want to run (1 - 13). \nSee the vignette for lab details.")
}
