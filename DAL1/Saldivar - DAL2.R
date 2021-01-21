# Title: Data Analysis Lab 2 ####
# Author: Edgar Saldivar
# Date: 1/19/21

# Lesson 2: Using TidyR to load and visualize data ####

# Load tidyverse package
library(tidyverse)

# Load data
data(mpg)

#Check and Comment what type of structure mpg is
str(mpg)
# MPG is a combination of character, numeric, and logical

#Create analysis data frame to preserve a raw version
mpg_df<-mpg
str(mpg_df)

#Scatter plot of displ x hwy
ggplot(mpg_df,aes(x=displ,y=hwy))+geom_point()
#Scatter plot of displ x hwy by fuel type (fl)
ggplot(mpg_df,aes(x=displ,y=hwy,color=fl ))+geom_point()

#On your own, scatter plot of displ x hwy by class
ggplot(mpg_df,aes(x=displ,y=hwy,color=class ))+geom_point()

# Lesson 3: Using ggplot ####

#Call help of filter
?filter()
#Call help for geom_bar()
?geom_bar()
#Call help for fact_wrap()
?facet_wrap()

# ggplot - data layer, assign it to mpg_data
mpg_data<-ggplot(data=mpg)

# Call mpg_data
mpg_data

# Put engine size on the x-axis, highway mileage of y-axis, and color by class
mpg_plot<-mpg_data+geom_point(mapping=aes(x=displ,y=hwy,color=class))
mpg_plot

# Now, let's add an aesthetic layer to change the axis labels
mpg_axis<-mpg_plot+xlab("Engine Size in Liters")+ylab("Highway Mileage")+ggtitle("Engine Size and Mileage by Vehicle Class")
mpg_axis

# Create different graphs for each class
mpg_wrap<-mpg_axis+facet_wrap(~class,nrow=2)
mpg_wrap

> mpg_wrap<-mpg_axis+facet_wrap(~class, nrow=3)
mpg_wrap
