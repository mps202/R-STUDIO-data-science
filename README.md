# R-STUDIO-data-science


School work: ggplot in R-STUDIO



##question 1

library(ggplot2)
data(economics)

## 1a)
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line()

## 2b) linewidth = size
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line(color = "orange", linewidth = 2)

## 3c) 
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line(color = "orange", linewidth = 2) +
  geom_point(shape = 17, color = "white")

## 4d)
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_area(fill = "#B1810B", alpha = 0.3) +
  geom_line(color = "orange", linewidth = 2) +
  geom_point(shape = 17, color = "white")

## 5e) 
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_area(fill = "#B1810B", alpha = 0.3) +
  geom_line(color = "orange", linewidth = 2) +
  geom_point(shape = 17, color = "white") +
  labs(title = "Unemployment vs Time",
       x = "Year",
       y = "Number of people  Unemployed")

       ## Question 2

data("diamonds")
head(diamonds)

set.seed(1410)
diasample <- diamonds[sample(1:nrow(diamonds),100),]
diasample

## 2a)
ggplot(diasample, aes(carat, price)) +
  geom_point(aes(shape = cut)) +
  scale_x_continuous(breaks = seq(0,2.5,0.5))

## 2b)
ggplot(diasample, aes(carat, price)) +
  geom_point(aes(color = color)) +
  scale_x_continuous(breaks = seq(0,2.5,0.5))

## 2c)
ggplot(diasample, aes(carat, price)) +
  geom_point(aes(color = cut)) +
  facet_wrap(~ cut)

## Question 3

library(tidyverse)
library(ggplot2)

## 3a) 

data(UCBAdmissions)

## 3b)

ucb_df <- as.data.frame.table(UCBAdmissions)
ucb_df

## 3c) 

ucb <- aggregate(Freq ~ Admit + Gender + Dept, data = ucb_df, sum)
ucb


## 3d) 

ggplot(ucb, aes(x = Gender, y = Freq, fill = Admit)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_wrap(~ Dept, ncol = 3) +
  labs(title = "UCB Admissions by Gender and department",
       x = "Gender", y = "Frequency", fill = "Admit") +
  theme_minimal()

## 3e) 

ggplot(ucb, aes(x = Dept, y = Freq, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "UCB Admissions by Department and Gender",
       x = "Department", y = "Frequency", fill = "Gender") +
  theme_minimal()
