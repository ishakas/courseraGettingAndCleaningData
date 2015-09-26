setwd("~/RWorkingDirectory/Course_3/assignment/UCI HAR Dataset")
library(dplyr)

# Step 1
# Read and combine all the data sets

# Read training data sets
trainingSubjects <- read.table("train/subject_train.txt")
trainingSet <- read.table("train/X_train.txt")
trainingLabels <- read.table("train/y_train.txt")

# Read the test data sets
testSubjects <- read.table("test/subject_test.txt")
testSet <- read.table("test/X_test.txt")
testLabels <- read.table("test/y_test.txt")

# Merge the test and training data sets rows
allSubjects <- rbind(trainingSubjects,testSubjects)
allSets <- rbind(trainingSet,testSet)
allLabels <- rbind(trainingLabels, testLabels)

# Give the subjects and activity appropriate column names
# otherwise we won't be able to distinguish them when we merged the columns
colnames(allSubjects) <- "subject"
colnames(allLabels) <- "activity"

# Get the name of the features and assign the them to the column names of the data set
features <- read.table("features.txt")
colnames(allSets) <- features$V2

# Merge the subjets, labels and set columns
mergedData <- cbind(allSubjects, allLabels, allSets)

# Step 2
# Extract only the measurements of the mean or standard deviation for each measurement

# select all features with "mean()" and "std()"
subFeaturesCol <- grep("mean\\(\\)|std\\(\\)", features$V2)
subFeatures <- features$V2[subFeaturesCol]

# combine them with the subject and activity column then make a subset
interestedNames <- c("subject", "activity",as.character(subFeatures))
subsetData <- subset(mergedData, select=interestedNames)

# Step 3
# Use descriptive names to name the activities, so we will replace the activites
# from being numeric to meaningful names

# read the activity labels from the file
activityName <- read.table("activity_labels.txt")

# replace the numeric activites in the data set with the activity labels
subsetData$activity <- activityName[subsetData$activity,2]

# Step 4
# appropriately labels the data sets with descriptive variable names
# replace 't' with 'time'
names(subsetData) <- gsub("^t", "time", names(subsetData))

# replace 'f' with 'frequency'
names(subsetData) <- gsub("^f", "frequency", names(subsetData))

# replace 'Acc' with 'Accelerometer'
names(subsetData) <- gsub("Acc", "Accelerometer", names(subsetData))

# replace 'BodyBody' with 'Body
names(subsetData) <- gsub("BodyBody", "Body", names(subsetData))

# replace 'Gyro' with 'Gyroscope'
names(subsetData) <- gsub("Gyro", "Gyroscope", names(subsetData))

# replace 'Mag' with 'Magnitude'
names(subsetData) <- gsub("Mag", "Magnitude", names(subsetData))

# Step 5
# Create a second, independent data set with the average of each variable for each
# variable and activity

tidyData <- aggregate(. ~subject + activity, subsetData, mean)
tidyData <- tidyData[order(tidyData$subject,tidyData$activity),]
write.table(tidyData, file = "tidydata.txt",row.names=FALSE)

