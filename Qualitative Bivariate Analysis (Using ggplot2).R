??ggplot
#You provide the data, tell 'ggplot2' how to map variables to aesthetics, what graphical primitives to use, and it takes care of the details.


### Questions: 1) How many award wining movies in each category
###            2) or What proportion of movies in each category have won awards
###
### data file: Movies.csc

# setting a working directory
setwd("~/R/PluralSight/r-data-visualization sam/Qulatative Bivariate Analysis By SAM")

# Loading the movies file into a dataframe 
movies <- read.csv("Movies.csv")
str(movies)

#viewing top 6 rows of the loaded data
head(movies)

#Installing lattice
install.packages("ggplot2")

#Loading lattice package
library(ggplot2)

#NOTE: Here only we need not create contingency table like in base and lattice

ggplot( data = movies,
        aes(x=Rating, fill = Awards)) +
        geom_bar() + # by defalut it is stacked bar
        ggtitle("Count of Movies by Rating and Movies") +
        scale_fill_discrete(labels= c("No","Yes")) # instead renaming the columns of table, we specify in legend 1st item to No


ggplot( data = movies,
        aes(x=Rating, fill = Awards)) +
  geom_bar(position = "dodge") +
  ggtitle("Count of Movies by Rating and Movies") +
  scale_fill_discrete(labels= c("No","Yes")) 


# Creating 100% stacked frequency bar chart w/o creating proportions table
ggplot( data = movies,
        aes(x=Rating, fill = Awards)) +
        geom_bar(position = "fill") + # want stretch the yaxis
        ggtitle("             Proportion of Movies by Rating and Movies") +
        ylab ("Proportion of Movies") +
        scale_fill_discrete(labels= c("No","Yes")) 

