############################################################################
#        III - GETTING AND CLEANING DATA - COURSE PROJECT                  #
############################################################################

# TASK: You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#Load Required Packages
install.packages("data.table")
library(data.table)
library(dplyr)

#Coursera file for course project
filename <- "Coursera_CourseProject_Final.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Working directgory.Folder where data for the task was downloaded
dataFolder <- getwd()

# Loading master of labels & features
masterActivityLabels <- fread(file.path(dataFolder, "UCI HAR Dataset/activity_labels.txt")
                        , col.names = c("idLabels", "activityName"))

#Data dable with master of features
masterFeatures <- fread(file.path(dataFolder, "UCI HAR Dataset/features.txt")
                  , col.names = c("index", "featureNames"))

#Selecting only mean a std variables
#TIP: As "\" itself needs to be escaped in R, R requires double backslash to escape these metacharacters, like \\(.
posfeaturesWanted <- grep("(mean|std)\\(\\)", masterFeatures[, featureNames])
masterFeaturesWanted <- masterFeatures[posfeaturesWanted, featureNames]

#Data dable with master of wanted measuremens (mean, std)
masterFeaturesWanted <- gsub('[()]', '', masterFeaturesWanted)

#Calling my function to fix variable names. See CodeBook.md for documentation.
masterFeaturesWanted <- fixLabelNames(masterFeaturesWanted)

# Load train datasets with only measurementes wanted
train <- fread(file.path(dataFolder, "UCI HAR Dataset/train/X_train.txt"))[, posfeaturesWanted, with = FALSE]
setnames(train, colnames(train), masterFeaturesWanted)
trainActivities <- fread(file.path(dataFolder, "UCI HAR Dataset/train/Y_train.txt"), col.names = c("Activity"))
trainSubjects <- fread(file.path(dataFolder, "UCI HAR Dataset/train/subject_train.txt"), col.names = c("SubjectNum"))
train <- cbind(trainSubjects, trainActivities, train)


# Load test datasets with only measurementes wanted
test <- fread(file.path(dataFolder, "UCI HAR Dataset/test/X_test.txt"))[, posfeaturesWanted, with = FALSE]
setnames(test, colnames(test), masterFeaturesWanted)
testActivities <- fread(file.path(dataFolder, "UCI HAR Dataset/test/Y_test.txt"), col.names = c("Activity"))
testSubjects <- fread(file.path(dataFolder, "UCI HAR Dataset/test/subject_test.txt") , col.names = c("SubjectNum"))
test <- cbind(testSubjects, testActivities, test)


# merge datasets
mergedTrainingTest <- rbind(train, test)

# Replace Subject Ids with a factor variable
mergedTrainingTest[["SubjectNum"]] <- as.factor(mergedTrainingTest[, SubjectNum])

# Replace Activity Ids with our master of activities
mergedTrainingTest[["Activity"]] <- factor(mergedTrainingTest[, Activity]
                                 , levels = masterActivityLabels[["idLabels"]]
                                 , labels = masterActivityLabels[["activityName"]])

#Final step to execute task 5. Average of eacch variable by ativity & subject
finalData <- mergedTrainingTest %>%
  group_by(SubjectNum, Activity) %>%
  summarise_all(list(mean))

#Write file with results
write.table(finalData, "FinalData.txt", row.name=FALSE)



# Function to deal with step 4 --> Appropriately labels the data set with descriptive variable names
fixLabelNames <- function (x){
  
  x<-gsub("Acc", "Accelerometer", x)
  x<-gsub("Gyro", "Gyroscope", x)
  x<-gsub("BodyBody", "Body", x)
  x<-gsub("Mag", "Magnitude", x)
  x<-gsub("^t", "Time", x)
  x<-gsub("^f", "Frequency", x)
  x<-gsub("tBody", "TimeBody", x)
  x<-gsub("-mean()", "Mean", x, ignore.case = TRUE)
  x<-gsub("-std()", "STD", x, ignore.case = TRUE)
  x<-gsub("-freq()", "Frequency", x, ignore.case = TRUE)
  x<-gsub("angle", "Angle", x)
  x<-gsub("gravity", "Gravity", x)
  
}
