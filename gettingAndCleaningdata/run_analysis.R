## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd("/Users/tanmaynath/Dropbox/DataScience/Coursera/gettingAndCleaningdata/")

library("reshape2")

#Load feature names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
#Load activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Load and merge train data
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(xTrain) <- features
names(subjectTrain) <-c("Subject")
yTrain <- as.data.frame(activityLabels[yTrain[,1],2])

# 3. Uses descriptive activity names to name the activities in the data set

names(yTrain) <- c("activityLabel")
trainData <- cbind(subjectTrain,xTrain,yTrain)

#Load and merge test data
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(xTest) <- features
names(subjectTest) <-c("Subject")
yTest <- as.data.frame(activityLabels[yTest[,1],2])

# 3. Uses descriptive activity names to name the activities in the data set
names(yTest) <- c("activityLabel")
testData <- cbind(subjectTest,xTest,yTest)

# 1 Merges the training and the test sets to create one data set
finalData <- rbind(trainData,testData)
#names(finalData) = features

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
extractFeatures <- finalData[,grepl("mean|std", features)]

id_labels   = c("Subject", "activityLabel")
meltData      = melt(finalData, id = id_labels, measure.vars = features)

# Apply mean function to dataset using dcast function
tidyData   = dcast(meltData, Subject + activityLabel ~ variable, mean)

write.table(tidyData, file = "./tidyData.txt",row.name=FALSE)

