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

# Calculate correlation coefficient of Bravais - Pearson of AGE and EXPENSES

cor(ski$age, ski$expenses, method="pearson",  use="complete")

# Calculate correlation coefficient of Bravais - Pearson of AGE, EXPENSES, and STAY

cor(ski[,c("age","expenses","stay")], method="pearson",  use="complete")

# Calculate correlation coefficient of Spearman of AcCOMMODATION and EDUCATION

cor(ski$accommodation, ski$education, method="spearman",  use="complete")

# Calculate correlation coefficient of Spearman of ACCOMMODATION, RECOMMENDATION, and EDUCATION

cor(ski[,c("accommodation","recommendation","education")], method="spearman",  use="complete")





