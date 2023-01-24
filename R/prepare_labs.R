#' @title Prepare all labs for use
#'
#' @description This function makes a zip folder of all labs and generates a landing page
#' @details This only needs to be run during development of the labs, or if you make changes.
#'
#' @param labfolder optional string pointing to a folder in which the labs are located. if not provided, the location for the default labs is used.
#' @return nothing
#' @export
#'

prepare_labs <- function(labfolder = NULL)
{

  if (!is.null(labfolder)) #process labs in custom location
  {
    labdirs <- fs::dir_ls(labfolder, type = "directory") #find all folders/labs in main folder
   } else #if no custom labs/folder is provided, use the default labs folder
  {
       labdirs = fs::dir_ls(fs::path_package(package = 'iblir', dir = "tutorials"))
  }

  for (n in length(labdirs)) #zip each lab
  {
    # TO BE WRITTEN
  }
 } #end main function
