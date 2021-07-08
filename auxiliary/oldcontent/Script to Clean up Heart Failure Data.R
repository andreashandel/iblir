# install the required package

if (require('tidyverse')==FALSE) {install.packages('tidyverse', repos="https://cran.rstudio.com"); require(tidyverse);}


# R script to clean up data

heart_failure <- read.csv("./www/heart.csv")

# look at the variable types
str(heart_failure) 


#This line of code replaces the integer "age" with numeric "age" 
heart_failure$age<-as.numeric(heart_failure$age)

#This line of code replaces the integer "sex" with factor "sex" 
heart_failure$sex<-as.factor(heart_failure$sex)

#This line of code replaces the integer "trestbps" with numeric "trestbps" 
heart_failure$trestbps<-as.numeric(heart_failure$trestbps)

#This line of code replaces the integer "chol" with numeric "chol" 
heart_failure$chol<-as.numeric(heart_failure$chol)

#This line of code replaces the integer "fbs" with factor "fbs" 
heart_failure$fbs<-as.factor(heart_failure$fbs)

#This line of code replaces the integer "chol" with numeric "chol" 
heart_failure$thalach<-as.numeric(heart_failure$thalach)

#This line of code replaces the integer "exang" with factor "exang" 
heart_failure$exang<-as.factor(heart_failure$exang)


# R calls the categories of a factor levels 
# The factor variable sex has two levels (0,1) 
# Below I will add some informative labels to each level
# For sex the first level is 0 so the firt label needs to be "Female"
heart_failure$sex<-factor(heart_failure$sex, labels = c("Female","Male"))

# For fbs the first level is 0 so the first label needs to be "No"  
heart_failure$fbs<-factor(heart_failure$fbs, labels = c("No","Yes"))

# For exang the first level is 0 so the first lable needs to be "No"
heart_failure$exang<-factor(heart_failure$exang, labels = c("No","Yes"))


# Assign the labels I want for each variable
var_Label_List <- list(age="Age in Years", 
                       sex="Sex of the patient", 
                       trestbps="Resting Blood Pressure (mm Hg)", 
                       chol="Serum Cholesterol (mg/dl)", 
                       fbs="Fasting Blood Sugar > 120 mg/dl", 
                       thalach="Maximum Recorded Heart Rate (bpm)", 
                       exang="Exercise Induced Angina", 
                       oldpeak="Exercise Induced ST Depression Relative to Rest")

# Use the labeling function from the labeled package
labelled::var_label(heart_failure)<-var_Label_List

# Now you see that each variable has an attribute (attr) which is a label and then it shows the label 
str(heart_failure)

# Need it for lab 3 and 4 
saveRDS(heart_failure, file = "C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 3/www/clean_heart_failure.Rda")

saveRDS(heart_failure, file = "C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 4/www/clean_heart_failure.Rda")

