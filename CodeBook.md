---
title: "CodeBook.md"
output: github_document
---

## Code Book for run_analysis.R

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING,  WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

The complete list of variables of each feature vector is available in 'features.txt'

The data is contained in the following zip file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The code run_analysis downloads the zip file and unzips the files into the following variables:

'traindata': The training measurements, from X_train.txt.
'testdata': The test measurements, from X_test.txt.

'trainactivity': The training activity category for each observation, from y_train.txt.
'testactivity': The test activity category for each observation, from y_test.txt.

'datalabels': The names for each measurement type in the two measurement datasets, from features.txt.

'testsubjects': The mapping of subject identifiers to each test observation, from subject_test.txt.  
'trainsubjects': The mapping of subject identifiers to each training observation, from subject_train.txt.
Each row identifies the subject who performed the activity for each window sample.  Its range is from 1 to 30.

'activitylabels': The mapping of activity category numbers to descriptive activity text, from activity_labels.txt.

The variables 'subjecttestdata' and 'subjecttraindata' combine each dataset of measurements with their associated activity category and subject ID.

'alldata' combines 'subjecttestdata' and 'subjecttraindata' into a single dataset of all measurements of all subjects.

The subset of mean and standard deviation measurements are found with the variables 'meancols' and 'stdcols', and 'allmeanstd' is the resulting filtered dataset of only the mean columns and standard deviation columns of 'alldata'.

'activitygroups' groups 'allmeanstd' by subject and activity, and 'avgs' finds the average of each measurement by subject and activity.
