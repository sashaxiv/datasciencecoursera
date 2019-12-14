############################################################################
#        III - GETTING AND CLEANING DATA - COURSE PROJECT                  #
############################################################################

# TASK: You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Required: Download & Unzip File: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#           Change value of dataFolder variable

# DataTable Tutorial here: https://riptutorial.com/data-table/topic/3389/getting-started-with-data-table


#Load Required Packages
install.packages("data.table")
library(data.table)
library(dplyr)

#Folder where data for the task was downloaded
dataFolder <- "/DataScience/datasciencecoursera/Curso III - Cleaning Data/Course Project/data"

# Loading master of labels & features
masterActivityLabels <- fread(file.path(dataFolder, "UCI HAR Dataset/activity_labels.txt")
                        , col.names = c("idLabels", "activityName"))

#Data dable with master of features
masterFeatures <- fread(file.path(dataFolder, "UCI HAR Dataset/features.txt")
                  , col.names = c("index", "featureNames"))

#As \ itself needs to be escaped in R, R requires double backslash to escape these metacharacters, like \\(.
posfeaturesWanted <- grep("(mean|std)\\(\\)", features[, featureNames])
masterFeaturesWanted <- masterFeatures[posfeaturesWanted, featureNames]

#Data dable with master of measuremens
masterFeaturesWanted <- gsub('[()]', '', masterFeaturesWanted)


# Load train datasets with only measurementes wanted
train <- fread(file.path(dataFolder, "UCI HAR Dataset/train/X_train.txt"))[, posfeaturesWanted, with = FALSE]
setnames(train, colnames(train), masterFeaturesWanted)
trainActivities <- fread(file.path(dataFolder, "UCI HAR Dataset/train/Y_train.txt")
                         , col.names = c("Activity"))
trainSubjects <- fread(file.path(dataFolder, "UCI HAR Dataset/train/subject_train.txt")
                       , col.names = c("SubjectNum"))
train <- cbind(trainSubjects, trainActivities, train)


# Load test datasets with only measurementes wanted
test <- fread(file.path(dataFolder, "UCI HAR Dataset/test/X_test.txt"))[, posfeaturesWanted, with = FALSE]
setnames(test, colnames(test), masterFeaturesWanted)
testActivities <- fread(file.path(dataFolder, "UCI HAR Dataset/test/Y_test.txt")
                        , col.names = c("Activity"))
testSubjects <- fread(file.path(dataFolder, "UCI HAR Dataset/test/subject_test.txt")
                      , col.names = c("SubjectNum"))
test <- cbind(testSubjects, testActivities, test)



# merge datasets
mergedTrainingTest <- rbind(train, test)

# Replace Subject Ids with a factor
mergedTrainingTest[["SubjectNum"]] <- as.factor(mergedTrainingTest[, SubjectNum])

# Replace Activity Ids with our master of activities
mergedTrainingTest[["Activity"]] <- factor(mergedTrainingTest[, Activity]
                                 , levels = masterActivityLabels[["idLabels"]]
                                 , labels = masterActivityLabels[["activityName"]])

FinalData <- mergedTrainingTest %>%
  group_by(SubjectNum, Activity) %>%
  summarize(mean)


mergedTrainingTest <- reshape2::melt(data = mergedTrainingTest, id = c("SubjectNum", "Activity"))
mergedTrainingTest <- reshape2::dcast(data=mergedTrainingTest, SubjectNum + Activity ~ variable, value='value', FUN=mean)

data.table::fwrite(x = combined, file = "tidyData.txt", quote = FALSE)