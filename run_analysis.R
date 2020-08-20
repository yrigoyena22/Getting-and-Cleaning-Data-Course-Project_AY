##Peer-graded Assignment: Getting and Cleaning Data Course Project
## Requirement
##You should create one R script called run_analysis.R that does the following.
##You should create one R script called run_analysis.R that does the following.
##1.Merges the training and the test sets to create one data set.
##2.Extracts only the measurements on the mean and standard deviation for 
##each measurement.
##3.Uses descriptive activity names to name the activities in the data set
##4.Appropriately labels the data set with descriptive variable names.
##5.From the data set in step 4, creates a second, independent tidy data set with 
##the average of each variable for each activity and each subject.
##Solution
##In order to perform this assignment the following package have to be updated
library(dplyr)
##Now, we need to Download the dataset (Human Activity Recognition Using 
##Smartphones Data Set)
filename <- "Coursera_HARUS_Data.zip"
# Checking if archive already exists.
if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, filename, method="curl")
}  
# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}
## each data data frame must be assigned to a variable
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
##Step 1: Merges the training and the test sets to create one data set.
##The rbind function can be used to combine several vectors, matrices and/or
##data frames by rows
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)
##Step 2: Extracts only the measurements on the mean and standard deviation 
##for each measurement.
library(data.table)
install.packages("magrittr")
library(magrittr)
library(dplyr)
TidyDataSP <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
##Step 3: Uses descriptive activity names to name the activities in the data set.
TidyDataSP$code <- activities[TidyDataSP$code, 2]
##Step 4: Appropriately labels the data set with descriptive variable names.
names(TidyDataSP)[2] = "activity"
names(TidyDataSP)<-gsub("Acc", "Accelerometer", names(TidyDataSP))
names(TidyDataSP)<-gsub("Gyro", "Gyroscope", names(TidyDataSP))
names(TidyDataSP)<-gsub("Bo_dy", "Body", names(TidyDataSP))
names(TidyDataSP)<-gsub("Magn", "Magnitude", names(TidyDataSP))
names(TidyDataSP)<-gsub("^t", "Time", names(TidyDataSP))
names(TidyDataSP)<-gsub("^f", "Frequency", names(TidyDataSP))
names(TidyDataSP)<-gsub("tBody", "TimeBody", names(TidyDataSP))
names(TidyDataSP)<-gsub("-mean()", "Mean", names(TidyDataSP), ignore.case = TRUE)
names(TidyDataSP)<-gsub("-std()", "STD", names(TidyDataSP), ignore.case = TRUE)
names(TidyDataSP)<-gsub("-freq()", "Frequency", names(TidyDataSP), ignore.case = TRUE)
names(TidyDataSP)<-gsub("angle", "Angle", names(TidyDataSP))
names(TidyDataSP)<-gsub("gravity", "Gravity", names(TidyDataSP))
##Step 5: From the data set in step 4, creates a second, independent tidy data
##set with the average of each variable for each activity and each subject.
FinalData <- TidyDataSP %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
##quality control,Checking variable names and view final data set
str(FinalData)
FinalData
