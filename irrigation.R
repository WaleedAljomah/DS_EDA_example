# Irregation analysis
#Waleed Aljomah
#A small study case

# load packages
library(tidyverse)



#data

irrigation <- read.csv("data/irrigation_wide.csv")


#Exploring data

str(irrigation)
glimpse(irrigation)
summary(irrigation)

#In 2007, what is the total area under irrigation
#for only the Americas

irrigation %>%
  filter(year == 2007) %>%
  select(4,5)

#convert the data to tidy data format
irrigation_t <- irrigation %>% 
  pivot_longer(-c(year), names_to = "region", values_to = "value")



# total area under irrigation in each year?

irrigation_t %>%
  group_by(year) %>%
  summarise(total = sum(value))

glimpse(irrigation_t)

#standardized against 1980 (relative change over 1980)

irrigation_t %>%
  group_by(year) %>%
  diff = value[year == 2007] - value[year == 1980]   #??not working


# spletting the data for plotting purposes 
Africa_df <- irrigation_t %>%
  filter(region == "Africa")
  
Europe_df <- irrigation_t %>%
  filter(region == "Europe")  

N..America_df <- irrigation_t %>%
  filter(region == "N..America")

S..America_df <- irrigation_t %>%
  filter(region == "S..America")


#plot area over time for each region

#Africa
ggplot(irrigation_t, aes(x = year, y= value)) +
  geom_line(data = Africa_df, aes(year, value), color = "darkblue") +
  labs(title = "Africa",
       x = "Year",
       y = "irrigation")

#Europe
ggplot(irrigation_t, aes(x = year, y= value)) +
  geom_line(data = Europe_df, aes(year, value), color = "Green") +
  labs(title = "Europe",
       x = "Year",
       y = "irrigation")

#N.America
ggplot(irrigation_t, aes(x = year, y= value)) +
  geom_line(data = N..America_df, aes(year, value), color = "Pink") +
  labs(title = "N.America",
       x = "Year",
       y = "irrigation")
#S.America
ggplot(irrigation_t, aes(x = year, y= value)) +
  geom_line(data = S..America_df, aes(year, value), color = "Red") +
  labs(title = "S.America",
       x = "Year",
       y = "irrigation")
 



