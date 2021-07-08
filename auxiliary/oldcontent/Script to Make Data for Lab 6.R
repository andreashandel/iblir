##############
# Making some data for lab 6
# Author: Brian McKay
# Date: 5-26-2019
##############

# Set the seed to a good year so that things don't change
set.seed(1987)

# Diseased population 
test1<-round(rnorm(190, mean = 17, sd=3),2)

test2<-round(rnorm(190, mean = 21.5, sd=3),2)

test3<-round(rnorm(190, mean = 21, sd=3),2)

disease_status<-rep(0,190)

disease_statusC<-rep("Disease Present",190)

pop1<-cbind(disease_status, disease_statusC, test1, test2, test3)

# Disease free population
test1<-round(rnorm(225, mean = 25, sd=2),2)

test2<-round(rnorm(225, mean = 25.5, sd=2.2),2)

test3<-round(rnorm(225, mean = 22, sd=2),2)

disease_status<-rep(1,225)

disease_statusC<-rep("No Disease",225)

pop2<-cbind(disease_status, disease_statusC, test1, test2, test3)

# Put them together
med_test<-rbind(pop1, pop2)

# make it a data frame
med_test<-as.data.frame(med_test, stringsAsFactors = FALSE)

# Add a dicotomous variable as an answer to a single question.
med_test$answer<-sample(x=c("Yes","Yes","No","No","No"), size = 415, replace = T)

# order by test value data so that it does not look fake when the students look at it. 
med_test<-med_test[order(med_test$test1),]

# make some factors 
med_test$answer<-as.factor(med_test$answer)
med_test$disease_statusC<-as.factor(med_test$disease_statusC)
# change factor levels so 2x2 table is in the "standard"  A,B,C,D 2x2 set up.
med_test$answer<-factor(med_test$answer, levels = c("Yes","No"))

# Make some numeric variables 
med_test$test1<-as.numeric(med_test$test1)
med_test$test2<-as.numeric(med_test$test2)
med_test$test3<-as.numeric(med_test$test3)
med_test$disease_status<-as.integer(med_test$disease_status)


# Check the separation test 1 should be the best, test 2 ok, test 3 bad, 
ggplot(med_test, aes(x=test1, fill=disease_statusC)) + geom_density(alpha=.3)


# Save it
saveRDS(med_test, file = "C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 6/www/med_test.Rda")


