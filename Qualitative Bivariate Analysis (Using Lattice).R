??Lattice 

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
install.packages("lattice")

#Loading lattice package
library(lattice)

??barchart

awards <- table(movies$Awards, movies$Rating) 

#creating contingency table for ratings and category 
awards_tanspose<- table(movies$Rating, movies$Awards)

colnames(awards_tanspose) <- c("No","Yes") # changes colname just for ease



#Create grouped frequency bar chart
barchart( x = awards,
          stack = FALSE,
          horizontal = FALSE,
          main = "Count of Movies by Rating and Awards",
          xlab = "Rating",
          ylab = "Awards"  )
#We observe the col var is grouped by row var hence better to use tansposed table

barchart( x = awards_tanspose,
         stack = FALSE, # same as besides in barplot..i.e when true it stacks the col var values instead of side by side
          horizontal = FALSE,
          main = "Count of Movies by Rating and Awards",
          xlab = "Rating",
          ylab = "No. of Awards", 
         auto.key = list( x = 0.05,  # adding legend
                          y = 0.95,
                          title = "Awards",
                          text=c("No","Yes")))

#creating 100% stacked frequency bar chart

proportions <- apply(awards, 2 , function(x){x/sum(x)}) #2 means use column of awards table, note here we are convert joint frequency to relative frequency within each category and
         # not relative to all observations. i.e these values sum to 1 in each categpry , rather than summing to 1 for each table.
         
head(proportions)

barchart( x = proportions,
          stack = FALSE, # same as besides in barplot..i.e when true it stacks the col var values instead of side by side
          horizontal = FALSE,
          main = "Proportions of Movies by Rating and Awards",
          xlab = "Rating",
          ylab = "No. of Awards", 
          auto.key = list( x = 0.05,  # adding legend
                           y = 0.95,
                           title = "Awards",
                           text=c("No","Yes")))


#Now above chart groups cols by row var...since in proportions table ratings are col and awards are rows, chart display is not clear,
#hence better transpose proportions table

proportions_trans <- t(proportions)


barchart( x = proportions_trans,
          stack = TRUE, # same as besides in barplot..i.e when true it stacks the col var values instead of side by side
          horizontal = FALSE,
          main = "Proportions of Movies by Rating and Awards",
          xlab = "Rating",
          ylab = "No. of Awards", 
          auto.key = list( x = 0.65,  # adding legend
                           y = 1.10,
                           columns=2,
                           title = "Awards",
                           text=c("No","Yes")))

#BUT what if used already tansposed table awards_tanspose

proportions1 <- apply(awards_tanspose, 1 , function(x){x/sum(x)}) #11 here i need to use 1 as i need ratings proportions so i need row
head(proportions1)# but when we display this table we see it gets transposed automatically