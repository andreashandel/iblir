##############################################
#Set up some variables, define all as global (the <<- notation)
#name of R package
packagename <<- "iblir"
appdir <<- system.file("appinformation", package = packagename) #find path to apps
#load app table that has all the app information
at <<- read.table(file = paste0(appdir,"/apptable.tsv"), sep = '\t', header = TRUE)
appNames <<- at$appid

##############################################
#define functions
##############################################

#simple function that creates app buttons for UI
#specify data frame containing app info and the id of the app
make_button <- function(at,appid)
{
  id = which(at$appid == appid)
  actionButton(at$appid[id], paste0(at$apptitle[id]), class="mainbutton")
}


##############################################
#main server function of the app
##############################################
server <- function(input, output, session)
{
  #to get plot engine to be an object that is always be processed
  output$plotengine <- renderText('ggplot')
  outputOptions(output, "plotengine", suspendWhenHidden = FALSE)



  #######################################################
  #start code that listens to model selection buttons and creates UI for a chosen model
  #placing it here in hopes it can fix some weird error message on some systems about appName not found
  #not sure if that works might have to do with order in which app is built
  #######################################################
  lapply(appNames, function(appName)
  {
    observeEvent(input[[appName]],
                 {

                   browser()

                   output$lab <- renderUI({

                     callr::r_bg(learnr::run_tutorial(appName, package = packagename))

                   }) # End renderUI for analyze tab



                   #once UI for the model in the analyze tab is created, switch to that tab
                   updateNavbarPage(session, packagename, selected = "RunLab")
                 },
                 priority = -100
    ) #end observeEvent for the analyze tab

  }) #end lapply function surrounding observeEvent to build app

  #######################################################
  #end code that listens to model selection buttons and creates UI for a chosen model
  #######################################################



  #######################################################
  #Exit main menu
  observeEvent(input$Exit, {
    stopApp('Exit')
  })

} #ends the server function for the app

#######################################################
#This is the UI for the Main Menu
#######################################################

ui <- fluidPage(
  #tags$head(includeHTML(("google-analytics.html"))), #this is only needed for Google analytics when deployed as app to the UGA server. Should not affect R package use.
  includeCSS("packagestyle.css"), #use custom styling
  tags$style(HTML("
        input[type=number] {
              -moz-appearance:textfield;
        }
        input[type=number]::{
              -moz-appearance:textfield;
        }
        input[type=number]::-webkit-outer-spin-button,
        input[type=number]::-webkit-inner-spin-button {
              -webkit-appearance: none;
              margin: 0;
        }
    ")), #meant to remove the selector arrows on numeric input boxes: https://community.rstudio.com/t/how-to-remove-numeric-inputs-spin-button-in-r-shiny/13769/3
  #tags$div(id = "shinyheadertitle", "DSAIDE - Dynamical Systems Approach to Infectious Disease Epidemiology"),
  #tags$div(id = "shinyheadertext", "A collection of Shiny/R Apps to explore and simulate infectious disease models."),
    br(),
  tags$div(id = "infotext", paste0('This is ', packagename,  ' version ',utils::packageVersion(packagename),' last updated ', utils::packageDescription(packagename)$Date,'.')),
  #tags$div(id = "infotext", "Written and maintained by", a("Andreas Handel", href="http://handelgroup.uga.edu", target="_blank"), "with contributions from", a("others.",  href="https://github.com/ahgroup/DSAIDE#contributors", target="_blank")),
  #tags$div(id = "infotext", "More information can be found", a("on the package website.",  href="https://ahgroup.github.io/DSAIDE/", target="_blank")),
  navbarPage(title = packagename, id = packagename, selected = 'Menu',
             tabPanel(title = "Menu",
                      tags$div(class='mainsectionheader', 'The Basics'),
                      fluidRow(
                               make_button(at,"Lab1"),
                               make_button(at,"Lab2"),
                               make_button(at,"Lab3"),
                        class = "mainmenurow"
                      ), #close fluidRow structure for input


                      withTags({
                        div(style = "text-align:left", class="bottomtext",
                            tags$div(id = "bottomtext", 'The main way of using the simulations is through this graphical interface. You can also access the simulations directly. This requires a bit of R coding but gives you many more options of things you can try. See the package vignette or the "Further Information" section of the apps for more on that.'),
                        )
                      }), #close withTags function
                      p('Have fun exploring the models!', class='maintext'),
                      fluidRow(
                        actionButton("Exit", "Exit", class="exitbutton"),
                        class = "mainmenurow"
                      ) #close fluidRow structure for input

             ), #close "Menu" tabPanel tab

             tabPanel("RunLab",
                      fluidRow(
                        column(12,
                               uiOutput('lab')
                        )
                        #class = "mainmenurow"
                      ) #close fluidRow structure for input
             ) #close "Analyze" tab
  ), #close navbarPage

  tagList( hr(),
           p('All text and figures are licensed under a ',
           a("Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.", href="http://creativecommons.org/licenses/by-nc-sa/4.0/", target="_blank"),
           'Software/Code is licensed under ',
           a("GPL-3.", href="https://www.gnu.org/licenses/gpl-3.0.en.html" , target="_blank")
           ,
           br(),
           "The development of this package was partially supported by NIH grant U19AI117891.",
           align = "center", style="font-size:small") #end paragraph
  )
) #end fluidpage

shinyApp(ui = ui, server = server)
