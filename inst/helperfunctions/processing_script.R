#run this script to do some cleaning and processing automatically

  library('here')
  library('devtools')
  library('pkgdown')
  library('zip')
  library('dplyr')


  basepath = here::here()


  ###################################################
  # put all labs in a zip file
  # FOR SOME REASON IT'S NOT WORKING, DOING IT MANUALLY JUST NOW
  ##################################################

  #zipfilename = paste0(basepath,"/inst/alllabs/alllabs.zip")
  #lab_files = list.files(path = paste0(basepath,"/inst/tutorials/"), recursive=TRUE, full.names = TRUE)

  #remove previous zip file
  #file.remove(zipfilename)

  # create zip file
  #zip::zipr(zipfile = zipfilename, files = lab_files, include_directories = TRUE, mode = "mirror")


  ###################################################
  # recreate documentation for exported functions
  ##################################################
  devtools::document(roclets = c('rd', 'collate', 'namespace'))

  ###################################################
  # re-build vignette
  ###################################################
  devtools::build_vignettes()

  ###################################################
  #update the pkgdown website
  ###################################################
  pkgdown::build_site()

