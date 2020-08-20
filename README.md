# Getting-and-Cleaning-Data-Course-Project_AY
Peer-graded Assignment: Getting and Cleaning Data Course Project-Andres yrigoyen
Coursera. 
This repository is an Andres Yrigoyen submission for week 4 of Getting and Cleaning Data course project. 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.
Instructions
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Dataset

Human Activity Recognition Using Smartphones 
Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Files

CodeBook.md
This files contains the code book that describes the variables, the data, and any data manipulation I performed to clean up the data to achieve results

run_analysis.R 

performs the data preparation and then followed by the 5 steps required as described in the course project’s definition:
step1. Merges the training and the test sets to create one data set.
step2. Extracts only the measurements on the mean and standard deviation for each measurement.
step3. Uses descriptive activity names to name the activities in the data set
step4. Appropriately labels the data set with descriptive variable names.
step5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

FinalData.txt

is the exported final data after performing all the 5 steps described above.
