# Make a fake data set of the UGA undergraduate population from 2018

set.seed(1987)

# Sex distribtuion based on the current 57% female 43% male 
sex<-rbinom(29611,1,0.43)

sex<-sort(sex)

# Age is not even close to the real thing, not considering non-traditional students
age<-sample(17:22,29611, replace = T)

# Weights by sex
weight_w<-truncnorm::rtruncnorm(16723, a=90, b=Inf, mean=143, sd=29)

weight_m<-truncnorm::rtruncnorm(12888, a=100, b=Inf, mean=182, sd=40.8)

weight<-c(weight_w,weight_m)

weight<-round(weight,1)


# Heights by sex
height_w<-truncnorm::rtruncnorm(16723, a=56, b=Inf, mean=65, sd=3.5)

height_m<-truncnorm::rtruncnorm(12888, a=56, b=Inf, mean=70, sd=4)

height<-c(height_w,height_m)

height<-round(height,1)

# number of classes in the first semester

classes<-extraDistr::rtpois(29611, 3, a=1, b=7)

# Make it a matrix
UGA18<-cbind(sex, age, weight, height, classes)

# make it a data frame
UGA18<-as.data.frame(UGA18)

#set the correct variable type
UGA18$sex<-as.factor(UGA18$sex)
levels(UGA18$sex)<-c("Female","Male")

UGA18$classes<-as.integer(UGA18$classes)
UGA18$age<-as.integer(UGA18$age)

# Need to mix up my data since I sorted by Sex

UGA18<-UGA18[sample(nrow(UGA18), nrow(UGA18), replace = F), ]

# Save the data set
# Save changes 
saveRDS(UGA18, file = "C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 9/www/UGA18.Rda")




