#' @title Get a zip file with all labs for deployment
#'
#' @description This function opens a file explorer
#' pointing the user to the location of zip file with all labs
#'
#' @return nothing
#' @export



get_labs <- function()
{

  zipdir = system.file("alllabs", package = 'iblir')
  fs::file_show(zipdir)


} #end main function
