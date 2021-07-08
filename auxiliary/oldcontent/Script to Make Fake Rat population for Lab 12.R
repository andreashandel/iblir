
# Make a fake data set of rat diets and weight gain

# set the seed so the data does not 
set.seed(1987)

# 4 groups of 50 (randomized groups) 
# weight gain distributions to match exsiting lab
x<-rnorm(50)
g1wg<-13.89*(x-mean(x))/sd(x)+79.20

x<-rnorm(50)
g2wg<-15.14*(x-mean(x))/sd(x)+100.00

x<-rnorm(50)
g3wg<-15.71*(x-mean(x))/sd(x)+83.90

x<-rnorm(50)
g4wg<-15.02*(x-mean(x))/sd(x)+85.90

# make it a data frame
Rat<-cbind.data.frame(g1wg, g2wg, g3wg, g4wg)

# new variable names 

names(Rat)<-c("Corn_LowP", "Corn_HighP", "Rice_LowP", "Rice_HighP")

# Save the data set
saveRDS(Rat, file = "C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 12/www/Rat.Rda")