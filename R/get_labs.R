#' @title Get a zip file with all labs for deployment
#'
#' @description This function gives the user a zip file with all labs
#' this can be deployed to a shiny server
#'
#' @return Location of the zip file which the user can save.
#' @export



get_labs <- function()
{

  zipdir = system.file("alllabs", package = 'iblir')
  fs::file_show(zipdir)


} #end main function
