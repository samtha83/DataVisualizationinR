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

#creating contingency table for ratings and category 
awards <- table(movies$Awards, movies$Rating) # Here rows = awards & cols = ratings 

#Display the table
awards

#Create a grouped bar frequenct chart - withing each category i.e movie rating, number of movies again grouped by no. of awards(another category)
barplot(height = awards,
        beside = TRUE, # or else bars will be stacked
        main = "Count of Movies by Rating and Awards",
        xlab = "Rating",
        ylab = "Awards",
        legend = c("No","Yes"), # since false was displayed first No comes first
        args.legend = list( x = "topleft", title = "Awards") # or else by default no title and legend shows up on RH corner
        )


#Create a stacked bar frequenct chart 
barplot(height = awards,
        main = "Count of Movies by Rating and Awards",
        xlab = "Rating",
        ylab = "Awards",
        legend = c("No","Yes"), # since false was displayed first No comes first
        args.legend = list( x = "topleft", title = "Awards") # or else by default no title and legend shows up on RH corner
)

# To answer ques 2 , we need 100% stacked frequency bar chart
#Hence we need relative frequency chart showing relative frequency within each category

proportions <- apply(awards, 2 , function(x){x/sum(x)}) #2 means use column of awards table, note here we are convert joint frequency to relative frequency within each category and
# not relative to all observations. i.e these values sum to 1 in each categpry , rather than summing to 1 for each table.

head(proportions)



#Create a stacked bar frequency chart using proportions 
barplot(height = proportions,
        main = "Proportions of Movies by Rating and Awards",
        xlab = "Rating",
        ylab = "Proportion of Movies",
        legend = c("No","Yes"), # since false was displayed first No comes first
        args.legend = list( x = "topleft", title = "Awards") # or else by default no title and legend shows up on RH corner
)

#CONCLUSION: Proportion of movies which won awards in G category is slightly more than other catrgories


### Lets flip x and y axis for showing proportion of movies that won awards as a whole

awards_tanspose<- table(movies$Rating, movies$Awards)

colnames(awards_tanspose) <- c("No","Yes") # changes colname just for ease

#Creating a spine plot showing frequency of each observation for each combination(category + award) relative to all observations

#NOTE: SPINE PLOT GROUPS the colum var BY ROW VARIABLE

spineplot(x= awards,
          main = "Proportions of Movies by Rating and Awards",
          xlab = "Rating",
          ylab = "Proportion of movies as a whole")

# SO FOR BETTER RESULTS we need to use transpose the table

spineplot(x= awards_tanspose,
          main = "Proportions of Movies by Rating and Awards",
          xlab = "Rating",
          ylab = "Proportion of movies as a whole")


mosaicplot(x= awards_tanspose,
          main = "Proportions of Movies by Rating and Awards",
          xlab = "Rating",
          ylab = "Proportion of movies as a whole")
