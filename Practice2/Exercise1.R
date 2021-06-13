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

###############
#  CHECK DATA #  
###############

# General information
str(ski)

# Display first 6 rows of the dataset
head(ski)

# Display last 6 rows of the dataset
tail(ski)

# Display the whole record in the window
View(ski)

################################################################################################################

# Second Lecture: Descriptive Statistics
# Case study:

################################################################################################################


###############
#  READ DATA  #  
###############


accommodation <- ski$accommodation
education <- ski$education
stay <- ski$stay
expenses <- ski$expenses
age <-ski$age

quality <- ski$quality
safety <- ski$safety
waiting_time <- ski$waitingtime
diversity <- ski$diversity
satisfaction <- ski$satisfaction

# a)

# Define a function to calculate the mode
Modes <- function(x) {
  
  # Unique returns a vector, data frame or array like x but with duplicate elements/rows removed.
  # E.g:
  # x = c(2,3,1,1,2,3,4,1,2,2,3,3,4,5)
  # ux = unique(c(2,3,1,1,2,3,4,1,2,2,3,3,4,5))
  # -> 2 3 1 4 5
  ux <- unique(x)
  
  # Match returns a vector of the positions of (first) matches of its first argument in its second.
  # match(x, ux)
  # -> 1 2 3 3 1 2 4 3 1 1 2 2 4 5
  
  # Tabulate takes the integer-valued vector bin and counts the number of times each integer occurs in it.
  # E.g:
  # tabulate(c(2,3,1,1,2,3,4,1,2,2,3,3,4,5))
  # -> 4 4 3 2 1
  
  tab <- tabulate(match(x, ux))
  
  # Return the mode
  ux[tab == max(tab)]
}

# Get columns

modus <- data.frame(
  Modes =  c("Accommodation", "Education", "Stay"),
  Value =  c(Modes(accommodation), Modes(education), Modes(stay))
)

head(modus)

ggplot(modus, aes(x=Modes, y=Value, fill=Modes)) +
    geom_bar(stat="identity") + theme_minimal()

# According to the results in the plot, visitors tend to choose 3-star hotels, 
# stay for 6 days during the vacation, and most of them has secondary school degree as the highest level of education

#################################################################################################################

# b)

mean_median <- data.frame(Coeff = rep(c("Mean","Median"), each=3),
                          Categories  = rep(c("Expenses","Age","Stay"),1),
                          Value = c(mean(expenses),mean(age),mean(stay),
                                    median(expenses),median(age),median(stay)))
head(mean_median)
                                                                                    
ggplot(mean_median, aes(x=Categories, y=Value, fill=Coeff)) +
  geom_bar(stat="identity", position=position_dodge()) + theme_minimal()

# According to the mean and median values of expense, age, and stay, we can see that the average 
# spending is fluctuated around 367 CHF. The middle age accounts for the majority of visitors, which is 
# around 47 year old, finally, the common choice of staying is 6 days

#################################################################################################################

# c)

sd_var <- data.frame(Coeff = rep(c("SD","Variance"), each=3),
                          Categories  = rep(c("Expenses","Age","Stay"),1),
                          Value = c(sd(expenses),
                                    sd(age),
                                    sd(stay),
                                    var(expenses),
                                    var(age),
                                    var(stay)
                                  ))
head(sd_var)

ggplot(sd_var, aes(x=Categories, y=Value, fill=Coeff)) +
  geom_bar(stat="identity", position=position_dodge()) + theme_minimal()


# Compared with the results in b), the average expenses of customers are 367 CHF plus 49.87 or minus 49.87 CHF. 
# the range of customer age is plus or minus 12.91 to 47.91.  

#################################################################################################################

# d)
# Combined measures

numSummary(ski[,c("diversity","quality","safety","satisfaction","waitingtime")],
           statistic=c("mean","sd","IQR","quantiles"),quantiles=c(.25, .5, .75))

# Quantile 0.5 indicates the median

# Tourists are happier with safety and diversity of the ski resort. However, The customer is not satisfy with
# the quality of the resort which only registers 48.84% of the customer satisfaction. The happiness of satisfaction 
# is higher than the waiting time which is also displayed in the quantiles.  

#################################################################################################################
# e)
# Descriptive statistics for different groups
# Convert sex from numerical to factor values 
f_sex <- as.factor(ski$sex)
ski <- cbind(ski,f_sex)

print("0 is male, 1 is female")

numSummary(ski[,c("waitingtime"), drop=FALSE],
        groups = ski$f_sex, statistic=c("mean","sd","cv","IQR","quantiles"),quantiles=c(0,.25,.5,.75,1))

# In overall, woman are more happier with the waiting time than man, there is a different in the average feeling in waiting time 
# between woman and man, where the woman is about 18% happier than the counterpart. 
# In addition, there is no huge different in variation between two genders 
