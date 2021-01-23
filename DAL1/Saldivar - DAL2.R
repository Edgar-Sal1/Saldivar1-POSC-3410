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

mpg_wrap<-mpg_axis+facet_wrap(~class, nrow=3)
mpg_wrap

# Lesson 4 Tidying Data ####

install.packages("nycflights13")

library(tidyverse)
library(nycflights13)

flights

# Filter to keep only the flights that happened on 3-14
filter(flights,month==3,day==14)

# Select flights that happened in either May or June
filter(flights,month==5|month==6)
# Filter flights whose arrival was delyaed over 60 minutes AND departed on time
filter(flights,(arr_delay>60&dep_delay<1))
# Filter flights whose arrival was delayed over 60 minutes AND departure was delayed less than 15 minutes
filter(flights,(arr_delay>60&dep_delay<15))
# Filter flights whose arrival was delayed over 60 minutes AND departure was delayed 15 minutes or more (i.e., remember to use you Greater Than or Equal to Operator)
filter(flights,(arr_delay>60&dep_delay<=15))
# Filter flights whose destination is Greenville-Spartanburg International Airport (GSP)
filter(flights,dest=="GSP")
# Filter flights that were in the air over 3 hours (180 mins)
filter(flights,minute>=180)

# Effects of NAs on Logical Operations
NA==99
NA>3
NA<3

# Number of Wins for Clemson Football in the 2021 season
Clemson<-NA
# Number of Wins for Ohio State Football in the 2021 season
OSU<-NA
# Do Clemson and OSE have the same number of wins
Clemson==OSU

# Interpret this result using a comment in your script file
# I believe that this result implies that we cannot know if OSU and Clemson have the same number of wins in the 2021 season

# use is.na(varName) to find whether it is NA. This command returns a logical vector of either TRUE or FALSE. See the example below.
is.na(Clemson)
is.na(OSU)
# Now let's see how it works on a data frame
is.na(flights)
# there are many rows and columns of just the word FALSE
# Let's see what happens when we combine filter() and is.na(). We will search for NAs in arrival delay
filter(flights, is.na(arr_delay))
# We will search for observations with NO NAs in arrival delay
filter(flights, !is.na(arr_delay))

# In the real world, we often want to know how many observations are in each subset data frame. We will do this by calling nrow() outside of the filter commands
# Number of observations in flights data set with missing data for arrival delay
nrow(filter(flights, is.na(arr_delay)))
# Number of observations in flights data set with NO missing data for arrical delay
nrow(filter(flights, !is.na(arr_delay)))

# On your own, find repeat the previous two steps but with departure delay
nrow(filter(flights, is.na(dep_delay)))
nrow(filter(flights, !is.na(dep_delay)))

# In the real world, we often will filter out NAs across several variables and assign the resulting data frame to a new variable
flights_df<-filter(flights,(!is.na(arr_delay)&!is.na(dep_delay)))
flights_df

# On your own, filter out NAs across year, month, dep_delay, arr_delay, carrier, flight, air_time. Assign the resulting data frame to a new variable: flights_df
flights_df<-filter(flights,(!is.na(year)&!is.na(month)&!is.na(dep_delay)&!is.na(arr_delay)&!is.na(carrier)&!is.na(flight)&!is.na(air_time)))
flights_df

# Create sample dataframe using sequence (use the help command to learn more about sequence)
sample<- sequence(10, from=10L, by=-1L)
sample_df<- as_tibble(sample)
sample_df
arrange(sample_df,value)

# Create sample dataframe with values from 1:100 using sequence
sample<-sequence(100, from=1L,by=1L)
sample_df<- as_tibble(sample)
sample_df
arrange(sample_df, desc(sample))

# Arrange flights by arrival delay and assing to arrage_df
arrange_df<-arrange(flights, arr_delay)
tail(arrange_df)

# Example use of select
select(flights, year, month, day, carrier, flight)
select(flights, year:arr_delay)
select(flights, -tailnum)

select(flights,dep_delay:time_hour)
flights_df<-select(flights, year, month, day, dep_delay, arr_delay, dest, distance)
flights_df
rename(sample_df,count=value)

# Create dataframe with fewer variable: flight_small
flights_small<- select(flights,year:day,ends_with("delay"),distance, air_time,dest)
# Create new column: avg_speed
mutate(flights_small, speed = distance/air_time *60)
