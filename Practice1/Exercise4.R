###########################################
# Author: Ngoc Phuc Nguyen
# 
# Exercise 4: Working with reduced dataset
###########################################
rm(list = ls())

library(readxl)

hound = read_xlsx("C:/Users/philn/Desktop/R/Practice1/Hound.xlsx")


# Reduce the dataset with specific column
hound_red <- hound[1:6,c("dog","sex","age","weight","size")]

# Read the unique data
hound_red[4,"age"]

