
##Step 1

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "Course3.zip", method="curl")
unzip("Course3.zip")

##Step 2

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")

##Step 3

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
data_merged <- cbind(Subject, Y, X)

##Step 4

data_set <- data_merged %>%
     select(subject, label, contains("mean"), contains("std"))

##Step 5

data_set$label <- activity_labels[data_set$label, 2]

##Step 6

names(data_set)[2] = "activity"
names(data_set)<-gsub("Acc", "accelerometer", names(data_set))
names(data_set)<-gsub("Gyro", "gyroscope", names(data_set))
names(data_set)<-gsub("BodyBody", "body", names(data_set))
names(data_set)<-gsub("Mag", "magnitude", names(data_set))
names(data_set)<-gsub("^t", "time", names(data_set))
names(data_set)<-gsub("^f", "frequency", names(data_set))
names(data_set)<-gsub("tBody", "timebody", names(data_set))
names(data_set)<-gsub("-mean()", "mean", names(data_set), ignore.case = TRUE)
names(data_set)<-gsub("-std()", "std", names(data_set), ignore.case = TRUE)
names(data_set)<-gsub("-freq()", "frequency", names(data_set), ignore.case = TRUE)

##Step 7

TidyData <- data_set %>%
     group_by(subject, activity) %>%
     summarise_all(list(mean))
write.table(TidyData, "FinalDataSet.txt", row.name=FALSE)