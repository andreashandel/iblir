#' @title Deploy all labs to shinyapps.io
#'
#' @description This function sends each lab to shinyapps.io
#' @details You need to make sure you have your shinyapps.io account set up and connected
#' The \code{rsconnect} package needs to be installed.
#'
#' @param labvec optional vector with numbers indicating which labs to deploy. Default is all. Ignored if \code{labfolder} is provided.
#' @param labfolder optional string pointing to a folder in which the labs are located. if not provided, the location for the default labs is used.
#' @return nothing
#' @export



deploy_labs <- function(labvec = 1:13, labfolder = NULL)
{

  if (!is.null(labfolder)) #process labs in custom location
  {
    labdirs <- fs::dir_ls(labfolder, type = "directory") #find all folders/labs in main folder
      for (n in length(labdirs)) #deploy each lab
      {
        rsconnect::deployApp(labdirs[n], launch.browser = FALSE)
      }
  } else #if no custom labs/folder is provided, send the default labs to shinyapps.io
  {
    for (n in labvec)
      {
        labdir = fs::path_package(package = 'iblir', dir = paste0("tutorials/Lab",n))
        rsconnect::deployApp(labdir, launch.browser = FALSE)
      }
  } #end else statement processing default labs
} #end main function

