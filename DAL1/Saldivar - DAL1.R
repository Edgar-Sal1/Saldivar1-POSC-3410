#Title: Data Analysis Lab 1 ####
#Author: Edgar Saldivar
#Date: 1/14/21

#Lesson 1 ####
#My favorite movie of all time is The Dark Knight

#Lesson 2 ####
#Let's Try Some Basic Arithmetic ####
# Sum of 1 and 1
1+1
#Divide 365 by 12
365/12
#Your turn, multiply 10 by 12
10*12
#Your turn, add 28 plus 38
28+38
#Order of Operations in R
1+1*(365/12)
#Multiply 6 by 6
6*6
#Divide 9 by pi (round to nearest thousandth)
9/3.142

#Learning to Assign Variables ####
#Run this line of code to assign your first variable
myFirstVar<- "Hello World!"
#Run myFirstVar in the console
myFirstVar
#Code a second variable with a number
mySecondVar<-16
#Run mySecondVar in the console
mySecondVar
#Now let's practice assigning variable
#Assign "Clemson" to 'home'
home<- "Clemson"
#Assign "Tigers" to 'h_mascot'
h_mascot<- "Tigers"
#Assign "Ohio State" to 'away'
away<- "Ohio State"
#Assign "Buckeyes" to 'a_mascot'
a_mascot<- "Buckeyes"
#Assign 31 to 'homeScore'
homeScore<-31 
#Assign 0 to 'awayScore'
awayScore<-0
#Assign TRUE to 'homeWin'
homeWin<- TRUE
#Assign FALSE to 'awayWin'
awayWin<-FALSE

#Use class to identify the data type for the following variables
class(h_mascot)
class(homeScore)
class(homeWin)

#Use str to identify the data types for the following variables
str(h_mascot)
str(homeScore)
str(homeWin)

#Convert 'homeScore' to integer and assign the same var name
homeScore<-as.integer(homeScore)
homeScore

#Convert 'awayScore' to integer and assign to same var name
awayScore<as.integer(awayScore)
awayScore

#Make a numeric vector by using the syntax `c(#,#,#,#)`; check its structure
vector_numeric<-c(12,8,16,4,15)
str(vector_numeric)
#Make a numeric vector on your own
myNumericVector<-c(3,14,65,22,9)
str(myNumericVector)

#Make a logical vector
vector_logical<-c(TRUE, TRUE, FALSE, T, F)
str(vector_logical)
#Make a logical vector on your own
myLogicalVector<-c(TRUE, F, FALSE, T, TRUE)
str(myLogicalVector)

#Make a character vector
vector_character<-c("Montana","Aikman","Manning","Favre","Mahomes")
str(vector_character)
#Make a character vector on your own
myCharacterVector<-c("LeBron","Kobe","KD","MJ","Kareem")
str(myCharacterVector)

#Make a list of the vectors that I created: drAllardList
drAllardList<-list(vector_numeric,vector_logical,vector_character)
str(drAllardList)
#Make your own list
myList<-list(myNumericVector,myLogicalVector,myCharacterVector)
str(myList)

#Creata data fame: QB_df; print in console; check structure
QB_df<-data.frame(vector_character,vector_numeric,vector_logical)
QB_df
str(QB_df)
QB_df$vector_numeric
QB_df$vector_character
#Rename QB_df$vector_character as QB_df$qbName
names(QB_df)[names(QB_df)=="vector_character"]<-"qbName"
str(QB_df)

QB_df[1,]
QB_df[,1]
QB_df[,"qbName"]
QB_df[3,2]

#Make your own data frame
NBA_df<-data.frame(myCharacterVector,myNumericVector,myLogicalVector)
NBA_df
str(NBA_df)
NBA_df$myNumericVector
NBA_df$myCharacterVector
names(NBA_df)[names(NBA_df)=="myCharacterVector"]<-"PlayerName"
str(NBA_df)

NBA_df[1,]
NBA_df[,3]
NBA_df[1,2]


  


