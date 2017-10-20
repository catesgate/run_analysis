run_analysis <- function(){
      
      ### DOWNLOAD DATA TO VARIABLES
      
      # get zip file
      temp <- tempfile()
      download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
      
      # generate training and test datasets
      traindata <- read.table(unz(temp,"UCI HAR Dataset/train/X_train.txt"))
      testdata <- read.table(unz(temp,"UCI HAR Dataset/test/X_test.txt"))
      
      # generate variables for activity categories
      trainactivity <- read.table(unz(temp,"UCI HAR Dataset/train/y_train.txt"))
      testactivity <- read.table(unz(temp,"UCI HAR Dataset/test/y_test.txt"))
      
      # generate variable for dataset measurement names
      datalabels <- read.table(unz(temp,"UCI HAR Dataset/features.txt"))
      
      # generate variables for subject IDs
      testsubjects <- read.table(unz(temp,"UCI HAR Dataset/test/subject_test.txt"))
      trainsubjects <- read.table(unz(temp,"UCI HAR Dataset/train/subject_train.txt"))
      
      # generate variable for activity number-to-text mapping
      activitylabels <- read.table(unz(temp,"UCI HAR Dataset/activity_labels.txt"))
      
      # close connection
      unlink(temp)
      
      ### GIVE NAMES TO ALL DATA
      # give train and test datasets their measurement names from datalabels
      names(testdata) <- datalabels[,2]
      names(traindata) <- datalabels[,2]
      # give subject ID lists the name "subjectID"
      names(testsubjects) <- "subjectID"
      names(trainsubjects) <- "subjectID"
      # give activity lists the name "Activity"
      names(testactivity) <- "Activity"
      names(trainactivity) <- "Activity"
      
      # combine associated subject and activity to each dataset
      subjecttestdata <- cbind(testsubjects,testactivity,testdata)
      subjecttraindata <- cbind(trainsubjects,trainactivity,traindata)
      
      # combine test and train data into one dataset
      alldata <- rbind(subjecttestdata,subjecttraindata)
      
      # find the mean and std measurements
      meancols <- grep("mean()",names(alldata))
      stdcols <- grep("std()",names(alldata))
      
      # convert activity numbers to descriptive text
      alldata$Activity = activitylabels[match(alldata$Activity,activitylabels[,1]),2]
      
      # combine just the data we want to keep: subject, activity, means, and stds
      allmeanstd <- cbind(alldata[,1:2],alldata[,meancols],alldata[,stdcols])
      
      # group baseline dataset by subject and activity
      activitygroups <- group_by(allmeanstd,allmeanstd$subjectID,allmeanstd$Activity)
      
      # find the average of each measurement by subject and activity
      avgs <- suppressWarnings(summarize_all(activitygroups,mean))
      
      # delete non-measurement avgs (of subject and activity)
      avgs[,-(3:4)]
}      
      