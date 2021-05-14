###########################################
# Author: Ngoc Phuc Nguyen
# 
# Exercise 5: Working with reduced dataset
###########################################

rm(list = ls())

library(readxl)

hound = read_xlsx("C:/Users/philn/Desktop/R/Practice1/Hound.xlsx")

# Create a new column based on the column age of the dataset hound 
humanage <- hound$age*6

# Integrating the new column to the current dataset
hound <- cbind(hound, humanage)

# Factoring the dataset -> turn to number rather than characters
f_sex <- as.factor(hound$sex) 
f_size <- as.factor(hound$size)
f_breed <- as.factor(hound$breed)
               