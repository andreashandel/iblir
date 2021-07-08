
# Make a fake data set of calves diets and weight gain

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

# make it a data frame with 4 variables 
Calf1<-cbind.data.frame(g1wg, g2wg, g3wg, g4wg)
names(Calf1)<-c("Corn_LowP", "Corn_HighP", "Rice_LowP", "Rice_HighP")

# Save 4 variable data set 
saveRDS(Calf1, file = "C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 12/www/Calf1.Rda")


# make a data frame with 2 variables
# 4 groups of 50 (randomized groups) 
g1<-rep("Corn_LowP",50)
g2<-rep("Corn_HighP",50)
g3<-rep("Rice_LowP",50)
g4<-rep("Rice_HighP",50)

Feed<-c(g1,g2,g3,g4)
Weight_Gain<-c(g1wg, g2wg, g3wg, g4wg)
Calf<-data.frame(Feed, Weight_Gain)
names(Calf)<-c("Feed", "Weight_Gain")


#Save 2 variable data set 
saveRDS(Calf, file = "C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 12/www/Calf.Rda")


