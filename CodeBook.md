---
title: "CodeBook"
author: "Fardeen"
date: "8/31/2021"
output: html_document
---

The run_analysis.R script performs the following steps:


1. Download and extract the files

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Course3.zip", method="curl")
unzip("Course3.zip")


2. Assign each data to a variable so that these can be easily called later on.

- features: The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

- activity_labels: The activities during which measurements were taken and their labels.

- subject_test: Contains the test data from 9 of the 30 volunteers.

- x_test: contains the recorded features test data.

- y_test: contains the test data of the activities/labels

- subject_train: contains the train data from 21 of the 30 volunteers

- x_train: contains the recorded features train data.

- y_train: contains the train data of the activities/labels


3. Merge the training and the test sets to create one data set

  X is created by merging x_train and x_test using the rbind() function

  Y is created by merging y_train and y_test using the rbind() function

  Subject is created by merging subject_train and subject_test using rbind() function

  data_merged is created by merging Subject, X and Y using the cbind() function


4. Extracts only the measurements on the mean and standard deviation for each measurement

  data_set is created from data_merged but only columns "subject", "label" and the mean and standard deviation of the measurements are taken. This is done by subsetting using the select() function


5. Uses descriptive activity names to name the activities in the data set

  The numbers present in "label" column of data_set are replaced with its corresponding value as in the activity_labels variable.


6. Appropriately labels the data set with descriptive variable names.

-The "label" column in data_set is renamed to "activities"
-All "Acc" in the column's name are replaced by "accelerometer"
-All "Gyro" in the column's name are replaced by "gyroscope"
-All "BodyBody" in the column's name are replaced by "body"
-All "Mag" in the column's name are replaced by "magnitude"
-All "tBody" in the column's name are replaced by "timebody"
-All "Gyro" in the column's name are replaced by "gyroscope"
-All "Gyro" in the column's name are replaced by "gyroscope"
-All "Gyro" in the column's name are replaced by "gyroscope"
-All character starting with "t" are replaced by "time"
-All character starting with "f" are replaced by "frequency"


7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

  TidyData is created by grouping the variables by subject and activity in data_set and taking the means of each variable for each activity and subject.

  TidyData is exported into "FinalDataSet.txt" file
