# Getting and Cleaning Data Course Project
## Readme
This repo contains files associated with the Getting and Cleaning Data Course Project.
It contains three files:
- Readme.md - you are reading it now
- run_analysis.r - R script used to create the tidy data
- Codebook.md - code book containing variables, data and transformation in the R script

## Goal 
The script will 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The input data to the script is found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Information regarding the variables, data and transformations can be found in the Codebook.md

## Running the script
1. Download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Extract the .zip file downloaded in Step 1
3. Edit run_analysis.r  first line so the `setwd()` function is pointing to the location of the "UCI HAR Dataset" folder extracted in Step 2. For example: `setwd("~/downloads/UCI HAR Dataset")`
4. Run the script
5. The script will create a tidydata.txt in the "UCI HAR Dataset" folder

## Dependency
The script relies on the dplyr package being installed in the user's R environment. 
To install the dplyr package: `install.packages("dplyr")`
