
#Click source to run it

Tennis3 <- read.csv("www/Tennis3.csv")

#dropping the missing to make things easier

Tennis3<-Tennis3[complete.cases(Tennis3),]

# Drop gender variable (not needed for the exercises) 
Tennis3$Gender<-NULL

# Drop the ID variable (not need for the exercises)

Tennis3$ID<-NULL

# Change Age to numeric

Tennis3$Age<-as.numeric(Tennis3$Age)

# Creating delta columns 

Tennis3$Delta1<-Tennis3$Motrin1-Tennis3$Placebo1

Tennis3$Delta2<-Tennis3$Motrin2-Tennis3$Placebo2

Tennis3$Delta3<-Tennis3$Motrin3-Tennis3$Placebo3


# Save all the changes in RDA so they are kept

saveRDS(Tennis3, file = "www/Tennis3.Rda")