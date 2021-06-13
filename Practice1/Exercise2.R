###########################################
# Author: Ngoc Phuc Nguyen
# Exercise 2: Import and delete dataset
###########################################
library(readxl)

# Remove the Hound data set
rm(Hound)

# Read dataset from command
mydata = read_excel("C:/Users/philn/Desktop/R/Practice1/Hound.xlsx")

#Remove all
rm(list = ls())
