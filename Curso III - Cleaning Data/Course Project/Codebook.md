The run_analysis.R script executes the data preparation as described in the course project’s definition.

If you are still not familiar with datables, here you cand find a good tutorial:
https://riptutorial.com/data-table/topic/3389/getting-started-with-data-table


**********
FUNCTIONS
**********
fixLabelNames <- Changes varible names with a more descriptive ones

'Acc' in column’s name replaced by Accelerometer
'Gyro' in column’s name replaced by Gyroscope
'BodyBody' in column’s name replaced by Body
'Mag' in column’s name replaced by Magnitude
start with character 'f' in column’s name replaced by Frequency
start with character 't' in column’s name replaced by Time



*****************
MASTER VARIABLES
*****************
masterFeatures <- features.txt  (561 obs, 2 vars)
The features selected for this database come from the accelerometer of a Samsumg Galaxy

masterFeaturesWanted <- features.txt filtered (66 obs)
Filtered Features taking into account mean and std variables only 

masterActivityLabels <- activity_labels.txt (6 obs, 2 vars)
List of activities conducted in tests



*****************
TRAIN VARIABLES
*****************
trainActivities <- train/Y_train.txt (7352 obs, 1 var)
contains train data of activities (codes)

trainSubjects <- train/subject_train.txt (7352 obs, 1 var)
contains train data of 21/30 voluntee

train <- Binds data of trainingActivies + trainSubjects  (7352 obs, 68 var)
contains train data  (70% of data, 7352 obs)


*****************
TEST VARIABLES
*****************
testActivities <- test/Y_test.txt  (2947 obs, 1 var)
contains test data of activities (codes)

testSubjects <- test/subject_test.txt  (2947 obs, 1 var)
contains test data of 9/30 volunteer 

test <- Binds data of testActivities + testSubjects  (2947 obs, 68 vars)
contains all test data (30% of data, 2947 obs)


*****************
FINAL VARIABLES
*****************
mergedTrainingTest <- merges the training (train) and the test (test) dataTables (10299 obs)
finalData <- contains the average of each variable for each activity and each subject


