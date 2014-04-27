#### Quiz 2

install.packages("httr")
install.packages("httpuv")
#Question 1
library(httr)
library(httpuv)
oauth_endpoints("github")
myapp <- oauth_app("github","f1706f3f24d6462f3e3c", "99d4dabcd95b1aff06d42fb317610084ae1bc9ff")
#myapp <- oauth_app("github","Client ID", "Client Secret")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)


#Question 2 -- WORDING is not clear... recheck!!!
install.packages("sqldf")
library(sqldf)

download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv",destfile="./data/acs.csv")

acs <- read.table(file="./data/acs.csv", header=TRUE, sep=",")


mat1 <- sqldf("select * from acs where AGEP < 50")
mat2 <- sqldf("select * from acs")
mat3 <- sqldf("select pwgtp1 from acs where AGEP < 50")
mat4 <- sqldf("select * from acs where AGEP < 50 and pwgtp1")

#Question 3

test1<-as.data.frame(unique(acs$AGEP))
test2<-sqldf("select distinct AGEP from acs")
test2<- sqldf("select unique AGEP from acs")
test2<-sqldf("select distinct pwgtp1 from acs")
identical(test1,test2)


#Question 4
url <-  "http://biostat.jhsph.edu/~jleek/contact.html"
html <- readLines(url, n =100)
lengthofLines <- nchar(html[c(10,20,30,100)])


#Question 5
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
dataQ5 <- read.fwf(url, widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4) #do not ask how I got the widths [i.e. blanks]... I counted in a txt file!
sum <- sum(dataQ5[,4])
