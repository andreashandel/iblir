#' @title Deploy all labs to shinyapps.io
#'
#' @description This function sends each lab to shinyapps.io
#'
#' @param labvec vector with numbers indicating which labs to deploy. default is all.
#' @return nothing
#' @export



deploy_labs <- function(labvec = 1:13)
{


  for (n in labvec)
  {
    labdir = fs::path_package(package = 'iblir', dir = paste0("tutorials/Lab",n))
    rsconnect::deployApp(labdir, launch.browser = FALSE)
  }

} #end main function
