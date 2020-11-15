# Irregation analysis
#Waleed Aljomah
#A small study case

library(tidyverse)
library(tibble)
library(help = "tibble")

#Begin with wide "messy' format


irrigation <- read.csv("data/irrigation_wide.csv")


#Examine the data

str(irrigation)
glimpse(irrigation)
summary(irrigation)

#In 2007, what is the total area under irrigation
#for only the Americas
irrigation %>%
  filter(year == 2007) %>%
  select(ends_with("erica"))


irrigation %>%
  filter(year == 2007) %>%
  select('N..America, S..America')  #not working??

irrigation %>%
  filter(year == 2007) %>%
  select(4,5)

#to answer the followeing questions we should use tidy data (long)
irrigation_t <- irrigation %>%
  pivot_longer()

#what is the total area under irrigation in each year?

irrigation_t %>%
  group_by(year) %>%
  summarise(total = sum(value))



#standarized against 1980 (relative change over 1980)

irrigation_t %>%
  group_by(year) %>%
  summarise(diff = value[year == 2007] - value[year == 1980]) %>%
  slice_max(diff, n = 2)  #??not working
  
#plot area over time for each region

#where is the lowest and heighst?

#what is the rate-of-change in each region? (maybe tricky)

