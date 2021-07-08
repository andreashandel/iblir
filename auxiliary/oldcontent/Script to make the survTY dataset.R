
#Cleaning up the data and adding some new variables 

#  Load required packages
if (require('tidyverse')==FALSE) {install.packages('tidyverse', repos="https://cran.rstudio.com"); require(tidyverse);}

#Load the data 
survTY <- read.csv("C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Datasets/survivaldata_race_sex_year.csv")

#Survival prob 
survTY$SurvivalP<-survTY$Survival/100000


#Hazard data
# Deaths in intervals
survTY<-survTY%>%group_by(Year,Race.Sex)%>%mutate(Deaths=lag(Survival)-Survival)
# Shift down to plot right
survTY<-survTY%>%mutate_at(vars(Deaths), funs(lead), n=1)
# Put NA's in the 100+ rows which is perfect 
# Now replace NA's with the number from Survival from the same row so Qx = 100% for people 100+
survTY$Deaths[is.na(survTY$Deaths)] <- survTY$Survival[is.na(survTY$Deaths)]
# Now calculate the proportion of deaths for the age at the start of the interval. 
survTY$qx<-survTY$Deaths/survTY$Survival

survTY<-as.matrix(survTY)

survTY<-as.data.frame(survTY)

str(survTY)

# Make changes to variable types
survTY$Survival<-as.numeric(as.character(survTY$Survival))
survTY$SurvivalP<-as.numeric(as.character(survTY$SurvivalP))
survTY$Deaths<-as.numeric(as.character(survTY$Deaths))
survTY$qx<-as.numeric(as.character(survTY$qx))

str(survTY)
# Save changes 
saveRDS(survTY, file = "C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 5/www/survTY.Rda")
