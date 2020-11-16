# Diamond analysis
# Waleed Aljomah
# 29/09/2020
# A small case study for EDA and stats

# load packages
library(tidyverse)
library(rio)
library(tidyr)

#data
jems <- read.csv("data/diamonds.csv")



#Explore data


names(jems)   #names of the attributes 
str(jems)     #structure of data and give you idea about type of each attributes
dim(jems)     #diminsion of the data frame
summary(jems) #give a deeper exploratory look, e.g. mean of an attributes
typeof(jems)  #give the type of object



#basic filtering


#give me the list where the clarity = VVS2 and cut = good
jems %>%
  filter(clarity == "VVS2" & cut == "Good")  


#How many diamonds with a clarity of category “IF” are present in the data-set?

clarity_new <- (jems) %>%
  filter(clarity == "IF")


#can be exported as a new data set

export(clarity, "data/clarity_new.csv")



#what are the prices of IF clarity diamond
jems$clarity == "IF"


# What fraction of the total do they represent?
nrow(clarity)/nrow(jems)




#- What proportion of the whole is made up of each category of clarity?

jems %>%
  group_by(clarity) %>%
  count()

table(jems$clarity)/nrow(jems)

jems %>%
  group_by(clarity) %>%
  count() %>%
  mutate(prop = n/nrow(jems))



# specific diamonds price

jems %>%
  group_by(cut, color) %>%
  group_split()

# the cheapest diamond price overall
min(jems$price)


# the range of diamond prices
range(jems$price)

# the average diamond price in each category of cut and color
jems %>%
  group_by(cut, color) %>%
  summarise(avg = mean(price))



 
#Make a scatter plot that shows the price of a diamond as described by 
#another continuous variable, like the carat.



#transformation 

jems <- jems %>%
  mutate(carat_log10 = log10(carat),
         price_log10 = log10(price))


# plot
ggplot(jems, aes(carat_log10, price_log10))+
  geom_point()
