# Codebook

## Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset had been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 

From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Variables
The final data set contains 68 variables

- Subject - numeric value indicating the volunteer associated with the measurement.
- Activity - character values indicating the activity the volunteer performed. There are six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
- 66 other variables containing the mean and standard deviation from various accelerometer and gyroscope readings in time domain or frequency domains. 

## Walkthrough / Transformations
The script reads the training and test data sets from the associated files and combines them into a single data set. The script then extracts only the mean and standard deviation readings for each measurement. 

It then replaces the numeric activities with the appropriate activity labels and renames the variable with more descriptive names.

Finally it calculates the average of each variable for each activity and each volunteer before writing the result into the tidydata.txt file.
