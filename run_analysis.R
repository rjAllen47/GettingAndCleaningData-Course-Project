library (dplyr)
## Create a directory and download/unzip the data file if not already loaded
if (!file.exists("./GCD Course Project")){
        dir.create("./GCD Course Project")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./GCD Course Project/Data Set.zip")){
        download.file(fileUrl, 
                      destfile = "./GCD Course Project/Data Set.zip",
                      method = "curl")

}
if (!file.exists("./GCD Course Project/UCI HAR Dataset")){
        unzip("./GCD Course Project/Data Set.zip",
              exdir = "./GCD Course Project")
}

## Combine test and training subject data
subjectTestFile <- "./GCD Course Project/UCI HAR Dataset/test/subject_test.txt"
subjectTrainFile <- "./GCD Course Project/UCI HAR Dataset/train/subject_train.txt"
subjectTest <- read.table(subjectTestFile)
subjectTrain <- read.table(subjectTrainFile)
testSubject <- rbind(subjectTest, subjectTrain)
names(testSubject) <- c("Subject")

## Combine test and training activity data
yTestFile <- "./GCD Course Project/UCI HAR Dataset/test/Y_test.txt"
yTrainFile <- "./GCD Course Project/UCI HAR Dataset/train/Y_train.txt"
yTest <- read.table(yTestFile)
yTrain <- read.table(yTrainFile)
activity <- rbind(yTest, yTrain)
names(activity) <- c("Activity")

## Combine the test and training measurements data
xTestFile <- "./GCD Course Project/UCI HAR Dataset/test/X_test.txt"
xTrainFile <- "./GCD Course Project/UCI HAR Dataset/train/X_train.txt"
xTest <- read.table(xTestFile)
xTrain <- read.table(xTrainFile)
data <- rbind(xTest, xTrain)

## Add descriptive variable names
featuresFile <- "./GCD Course Project/UCI HAR Dataset/features.txt"
colNames <- read.table(featuresFile)
columnNames <- as.vector(colNames$V2)
names(data) <- as.character(columnNames)

## Extract only measurements on the mean and standard deviation
dataMean <- data[, grepl("mean", names(data))]
dataStd <- data[, grepl("std", names(data))]

## Combine all the data and add descriptive activity names
dataFrame <- cbind(testSubject, activity, dataMean, dataStd)
dataFrame$Activity <- factor(dataFrame$Activity)
levels(dataFrame$Activity) <- c("Walking", 
                                "Walking Upstairs", 
                                "Walking Downstairs", 
                                "Sitting", 
                                "Standing", 
                                "Laying")

## Create an independent tidy data set with the average of each variable for 
## each activity and each subject.
groupedData <- group_by(dataFrame, Activity, Subject) 
tidyData <- summarise_each(groupedData, funs(mean))
write.table(tidyData, file = "Getting and Cleaning Data - Course Project.txt", 
            row.names = FALSE)