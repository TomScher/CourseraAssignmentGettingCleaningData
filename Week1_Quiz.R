# Quiz 1

# first check, if data folder exists
if (!file.exists("data")) {
  dir.create("data")
}

# Question 1
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# 
# and load the data into R. The code book, describing the variable names is here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# 
# How many housing units in this survey were worth more than $1,000,000?
# 53
# 164
# 159
# 2076

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="data/data.csv")
data <- read.csv("data/data.csv")

str(data$VAL)
sum(data[data$VAL==24])
numberofrichhouseholds <- sum(data[data$Val == 24,])
data[data$Val == 24,]

table(data$VAL==24)


# Question 2
# Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?
# Numeric values in tidy data can not represent categories.
# Tidy data has one variable per column.
# Tidy data has no missing values.
# Each tidy data table contains information about only one type of observation.

data[1:10,"FES"]


# Question 3
# Download the Excel spreadsheet on Natural Gas Aquisition Program here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
# 
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
#   
#   dat 
# 
# What is the value of:
#   
#   sum(dat$Zip*dat$Ext,na.rm=T) 
# 
# (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)
# 33544718
# 36534720
# 0
# NA
# 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile="data/data2.xlsx" )

install.packages("xlsx", dependencies = TRUE)
install.packages("rJava", dependencies = TRUE)
require(rJava)
require(xlsx)
read.xlsx()


Question 4
# Read the XML data on Baltimore restaurants from here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# 
# How many restaurants have zipcode 21231?
# 17
# 100
# 127
# 28
# Question 5
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# 
# using the fread() command load the data into an R object
# 
# DT 
# 
# Which of the following is the fastest way to calculate the average value of the variable
# 
# pwgtp15 
# 
# broken down by sex using the data.table package?
# sapply(split(DT$pwgtp15,DT$SEX),mean)
# mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
# mean(DT$pwgtp15,by=DT$SEX)
# DT[,mean(pwgtp15),by=SEX]
# tapply(DT$pwgtp15,DT$SEX,mean)
# rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
