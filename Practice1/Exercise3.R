###########################################
# Author: Ngoc Phuc Nguyen
# 
# Exercise 3: Working with dataset
###########################################
rm(list = ls())

library(readxl)


hound = read_xlsx("C:/Users/philn/Desktop/R/Practice1/Hound.xlsx")

# Check several top samples (observations)
head(hound)


# Check several bottom samples (observations)
tail(hound)

# Checking specs of all variables
str(hound)
