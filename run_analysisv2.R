################################################
###Coursera Getting & Cleaning Data ############
#########Programming Assignment ################
################################################

# Tasks:
# 
# 1.  Merges the training and the test sets to create one data set.
# 2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.  Uses descriptive activity names to name the activities in the data set
# 4.  Appropriately labels the data set with descriptive activity names. 
# 5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# 

#clean up workspace
rm(list=ls())

# 1. Merge datasets - first load data! To make it more efficient lateron, check if the RData 
# has already been cached and saved. If yes, load it from there, otherwise read it in (may take some time)

if (!file.exists("data.all.RData")){
  data.test<-read.table("data/UCI HAR Dataset/test/X_test.txt",header=FALSE) #reads test data
  data.train<-read.table("data/UCI HAR Dataset/train/X_train.txt",header=FALSE) #reads training data
  
  data.test.subject <- scan("data/UCI HAR Dataset/test/subject_test.txt")
  data.train.subject <- scan("data/UCI HAR Dataset/train/subject_train.txt")
  str(data.test.subject)
  
  data.test.activity <- read.table("data/UCI HAR Dataset/test/y_test.txt",header=FALSE)
  data.train.activity <- read.table("data/UCI HAR Dataset/train/y_train.txt",header=FALSE)
  
  data.values <- read.table("data/UCI HAR Dataset/features.txt",header=FALSE,stringsAsFactors=FALSE) #reads the names of the variables
  data.labels.activities <- read.table("data/UCI HAR Dataset/activity_labels.txt",header=FALSE) #reads the names of the activities
  
  save(list=ls(all=TRUE), file="data.all.RData")
} else {
  load("data.all.RData") 
}

var.names <- data.values$V2


#adds subject + activity
data.test.full <- cbind(data.test.subject, data.test.activity, data.test)
data.train.full <- cbind(data.train.subject, data.train.activity, data.train)

# now merge training + test data to one file
data.all <- rbind(data.test.full, data.train.full)

#set names + labels for activities correctly
names(data.all)<-c("subject", "activity", var.names)
data.all$activity <- factor(data.all$activity,labels= data.labels.activities$V2)
label(as.factor()) <- data.labels.activities$V2

# table(data.all$subject)
# table(data.all$activity)

#remove all no longer necessary data frames - clean up time :-)
rm(list=c("var.names", "data.test.subject", "data.train.subject", "data.test.activity","data.train.activity",
          "data.test", "data.values", "data.train", "data.test.full", "data.train.full", "data.labels.activities"))

str(data.all[1:3,1:3])

