#' @title The main menu for the iblir package
#'
#' @description This function opens a menu that will allow the user to run the different simulations.
#'
#' @details Run this function with no arguments to start the main menu
#' @examples
#' \dontrun{iblirmenu()}
#' @author Andreas Handel
#' @import learnr
#' @export

iblirmenu <- function() {


    #appDir <- system.file( "iblir", package = "iblir") #get directory for main menu app
    #shiny::runApp(appDir = appDir, launch.browser = TRUE) #run main menu app

    #utils::browseURL(paste0(appDir,"/iblirmenu.html"))

    #print('*************************************************')
    #print('Exiting the main menu.')
    #print('I hope you had a fun and educational experience!')
    #print('*************************************************')
}

#needed to prevent NOTE messages on CRAN checks
#most of those are from the ggplot commands in the generate_ functions,
#the last one is from the subset function in the fit functions
#utils::globalVariables(c("xvals", "yvals", "varnames","IDvar","style","Condition", "simfunction","flu1918data","norodata"))


