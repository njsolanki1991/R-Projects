
#tidyverse is used for data manipulation
#it has ggplot2,dplyr,tidyr,readr 
install.packages("tidyverse")
library(tidyverse)

#has different dataset
install.packages("modeldata")
library(modeldata)

#this will provide all the datasets in modeldata
data(package = "modeldata")

#describes the dataset
?crickets

#shows cricket dataset
view(crickets)

#shows how to use ggplot
?ggplot

#plots basic scatter plot tmp vs rate
ggplot(data= crickets,mapping = aes(x = temp, y =rate)) +
  geom_point()

#change color,size, transparancy(alpha) and shape of points
ggplot(data= crickets,mapping = aes(x = temp, y =rate)) +
  geom_point(color='red',
             size = 4,
             shape = "triangle",
             alpha= 0.5)

#shows other options
?geom_point

#adding title, labels
ggplot(data = crickets, mapping = aes(temp, rate)) +
  geom_point() +
  labs(title = "Cricket churping",
       x = "Temperature",
       y = "Chirps",
       caption = "Source: McDoland 2009")

#adds species as colour
ggplot(data = crickets, mapping = aes(temp, rate, color = species)) +
  geom_point() +
  labs(title = "Cricket churping",
       x = "Temperature",
       y = "Chirps",
       caption = "Source: McDoland 2009",
       color = "Species")

#gives the best fit line
ggplot(data = crickets, mapping = aes(temp, rate)) +
  geom_point() +
  labs(title = "Cricket churping",
       x = "Temperature",
       y = "Chirps",
       caption = "Source: McDoland 2009")+
  geom_smooth()


#gives you regression line, SE removes the error shadow
ggplot(data = crickets, mapping = aes(temp, rate)) +
  geom_point() +
  labs(title = "Cricket churping",
       x = "Temperature",
       y = "Chirps",
       caption = "Source: McDoland 2009")+
  geom_smooth(method = "lm", se = FALSE)

#if colors are added, it gives two seperate regression lines
ggplot(data = crickets, mapping = aes(temp, rate, color = species)) +
  geom_point() +
  labs(title = "Cricket churping",
       x = "Temperature",
       y = "Chirps",
       caption = "Source: McDoland 2009",
       color = "Species") +
  geom_smooth(method = "lm", se = FALSE)


#histogram of chirp rate
ggplot(crickets, aes(x = rate))+
  geom_histogram(bins = 15)

#frequency line chart
ggplot(crickets, aes(x = rate))+
  geom_freqpoly(bins = 15)

#bar chart
ggplot(crickets, aes(x=species))+
  geom_bar(color='purple',fill='lightgreen')

#adds species colour and removes legend
ggplot(crickets, aes(x=species, fill = species))+
  geom_bar(color='purple', show.legend = FALSE)+
  labs(title = "Cricket churping",
       caption = "Source: McDoland 2009")

#boxplot is best for one categorical and one quantitative variable
ggplot(crickets, aes(x=species,y=rate))+
  geom_boxplot()

#adds color and removes extra legend
#theme_minimal removes gray background
ggplot(crickets, aes(x=species,y=rate, fill = species))+
  geom_boxplot(show.legend = FALSE) +
  theme_minimal()


#doesnt give much insights about data
ggplot(crickets, aes(x=rate, fill= species))+
  geom_histogram(bins = 15)


#facet wrap sperates the graphs
ggplot(crickets, aes(x=rate, fill = species))+
  geom_histogram(bins = 15, show.legend = FALSE) +
  facet_wrap(~species) + 
  scale_fill_brewer(palette = "Dark2")


#puts the graphs in one column
ggplot(crickets, aes(x=rate, fill = species))+
  geom_histogram(bins = 15, show.legend = FALSE) +
  facet_wrap(~species,ncol = 1) + 
  scale_fill_brewer(palette = "Dark2")







