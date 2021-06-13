# First Analysis

# Author: 
# Date: 2021-05-20

# Second Lecture: Descriptive Statistics
# Part 1

###############
#  READ DATA  #  
###############

library(ggplot2)
library(RcmdrMisc)
library(readxl)

rm(list = ls())

setwd("D:/R Programming/Practice2/")

ski <- read_excel("D:/R Programming/Practice2/ski.xlsx")

################################################################################################################

# Second Lecture: Descriptive Statistics
# Case study:

################################################################################################################

# Histogram of Expense
hist(ski$expenses, main = "Guests Expense Histogram", xlab="CHF", ylab="Frequency", col="purple")

################################################################################################################

# Pie chart of education
# Count the frequency using table
table(ski$education)
# Show the pie chart
pie(table(ski$education), main = "Level of Education", labels = c("Secondary school","A-Level","Bachelor","Master"))

################################################################################################################

# Count the frequency using table
table(ski$country, ski$accommodation)
# Show the bar chart
barplot(table(ski$country, ski$accommodation), beside = TRUE, 
        main = "Guests by Country and Accommodation",
        xlab = "Accommodation",
        ylab = "Absolute Frequency",
        col = c("yellow","blue","purple","red"),
        legend = rownames(table(ski$country,ski$accommodation)))

################################################################################################################

#Box plot
boxplot(ski$expenses ~ ski$country, 
        main ="Expense by countries",
        xlab = "Countries",
        ylab = "Expenses",
        names= c("CH","GER","AUT","Other"))


################################################################################################################

#Scatter plot
plot(ski$age, ski$expenses, main="Expense by ages", xlab = "Ages", ylab = "Expense")

################################################################################################################

#Smooth the line
scatter.smooth(ski$age, ski$expenses, main="Expense by ages", xlab = "Ages", ylab = "Expense")
