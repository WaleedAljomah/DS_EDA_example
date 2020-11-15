# Diamond analysis
# Waleed Aljomah
# 29/09/2020
# A small case study for EDA and stats

# load packages
library(tidyverse)
library(rio)
library(tidyr)

#Read in data (cvs format):
#newer methods from package
jems <- read.csv("data/diamonds.csv")

#super convenient way 
#library(rio)
#jems2 <- import("data/diamonds.csv")

#get fimiliar with our data:
summary(jems)
names(jems)
str(jems)


# more detail:
attributes(jems)
typeof(jems)


#basic filtering
jems %>%
  filter(clarity == "VVS2" & cut == "Good")

#How many diamonds with a clarity of category “IF” are present in the data-set?

clarity <- (jems) %>%
  filter(clarity == "IF")


library(rio)

export(clarity, "data/clarity_new.csv")

#what are the prices of IF clarity daimond
jems$clarity == "IF"      
# What fraction of the total do they represent?
nrow(clarity)/nrow(jems)

 # Exercise 8.4 (Summarizing proportions)


#- What proportion of the whole is made up of each category of clarity?

jems %>%
  group_by(clarity) %>%
  count()

table(jems$clarity)/nrow(jems)

jems %>%
  group_by(clarity) %>%
  count() %>%
  mutate(prop = n/nrow(jems))



#Exercise 8.5 (Find specific diamonds prices)

jems %>%
  group_by(cut, color) %>%
  group_split()

#- What is the cheapest diamond price overall?
min(jems$price)

#or 
jems %>%
  filter(price == min(price))
#- What is the range of diamond prices?
range(jems$price)

#- What is the average diamond price in each category of cut and color?
jems %>%
  group_by(cut, color) %>%
  summarise(avg = mean(price))
  #Exercise 8.6 (Basic plotting)
#Make a scatter plot that shows the price of a diamond as described by another continous variable, like the carat.


# Exercise 8.6 (basic plotting) ----

ggplot(jems, aes(x = carat, y = price)) +
  geom_point()

#transformation
#Recall the function for applying transformation  from tidyverse
jems <- jems %>%
  mutate(carat_log10 = log10(carat),
         price_log10(price))


# Exercise 8.10 (Viewing models)
#using lm function

# plot
ggplot(jems, aes(carat_log10, price_log10))
