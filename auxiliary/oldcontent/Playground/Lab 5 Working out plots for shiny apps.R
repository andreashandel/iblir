

# Playin with the plot so I can make a shiny app 

library(ggplot2)
library(dplyr)

lifeEx2 <- read.csv("C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 5/www/lifeexpectancy1900_2015_race_sex.csv")

lifeEx1 <- read.csv("C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 5/www/lifeexpectancy1900_2016_sex.csv")

lifeT <- read.csv("C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 5/www/completeliftables2010_2015.csv")

# Life expectancy with stratification 

data<-gather(select(lifeEx1,"Year",c("Males","Females","Everyone")), group, value, -Year)

data$group<-as.factor(data$group)

data<-data %>% filter(Year>=1900 & Year<=2015)

mtitle<-sprintf("Life Expectancy at Birth in the US (%i-%i)",1900,2015)

mylabs<-list(title=paste(mtitle))

# Make the plot based in the data
ggplot(data=data, aes(x=Year, y=value, group=data$group, color=data$group))+ 
  geom_line()+
  ggtitle(paste(mtitle))+
  labs(color="Life Expectancy For")+
  ylab("Life Expectancy at Birth (years)")+
  theme(plot.title = element_text(size = 12, face = "bold", hjust = 0.5), 
        plot.subtitle = element_text(size = 12, face = "bold"),
        axis.title.x = element_text(size = 14, face = "bold"),
        axis.title.y = element_text(size = 14, face = "bold"),
        axis.text = element_text(size = 10),
        panel.background = element_rect(fill = "white", color = "black"),
        panel.grid.major= element_blank(),
        panel.grid.minor = element_blank())


# Survival curves or Survivor ship 


survTY<-readRDS("C:/Users/bmckay52/Dropbox/BIOS 2010/BIOS 2010L Online/Lab 5/www/survTY.Rda")

# Select the Years to plot
data<-filter(survTY, Age==unique(survTY$Age))

data1<-filter(data, Race.Sex==c("All") )

data2<-filter(data1, Year%in%c(2015,2000))


# Make the plot based in the data
ggplot(data=data, aes(x=Age, y=Survivalp, color= Year, shape = Race.Sex, group=interaction(Year,Race.Sex)))+
  geom_point(alpha=0.3)+
  geom_line(alpha=0.3)


