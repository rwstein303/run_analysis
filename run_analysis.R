## This script is used to analyze activity data from the cell phones of a group
## of 30 volunteers while performing 6 different activities.

## Read the data into tables required for the analysis.
test_X_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_Y_data <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject_data <- read.table("UCI HAR Dataset/test/subject_test.txt")
train_X_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_Y_data <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject_data <- read.table("UCI HAR Dataset/train/subject_train.txt")
features_data <- read.table("UCI HAR Dataset/features.txt")
activity_data <- read.table("UCI HAR Dataset/activity_labels.txt")

## Create test and train activity tables, replacing the values with the text
## describing the activity.
test_activities <- as.data.frame(activity_data[test_Y_data[,1],2])
train_activities <- as.data.frame(activity_data[train_Y_data[,1],2])

## Modify the names of the variables in the features data by removing special
## characters and converting the names to lower case.  This involes extracting
## only the features from the data to create a vector to be used for column
## names in the data tables.
features <- features_data[,2]
features <- gsub("\\(", "", features)
features <- gsub("\\)", "", features)
features <- gsub("-", "", features)
features <- gsub(",", "", features)

## Change parts of the feature names so they are more desciptive.
features <- tolower(features)
features <- sub("^t", "time", features)
features <- sub("^f", "freq", features)
features <- sub("acc", "accel", features)

## Add column names to the data tables.
names(test_X_data) <- features
names(train_X_data) <- features
names(test_activities) <- "activity"
names(test_subject_data) <- "subjectid"
names(train_activities) <- "activity"
names(train_subject_data) <- "subjectid"

## Create index vectors for the mean and standard deviation columns from the
## train and test data.  These will be used to subset the data for just these
## sets of variables.
test_mean_cols <- grep("mean",names(test_X_data))
test_std_cols <- grep("std",names(test_X_data))
train_mean_cols <- grep("mean",names(train_X_data))
train_std_cols <- grep("std",names(train_X_data))

## Collect the subset of columns for means and standard deviation from the test
## and train data based on the index vectors.
test_means <- test_X_data[,test_mean_cols]
test_stds <- test_X_data[,test_std_cols]
test_mean_std <- cbind(test_means,test_stds)
train_means <- train_X_data[,train_mean_cols]
train_stds <- train_X_data[,train_std_cols]
train_mean_std <- cbind(train_means,train_stds)

## Add columns for the subject and activities to the data tables and create a
## single table of all data for possible later usage.
test_data <- cbind(test_subject_data, cbind(test_activities, test_X_data))
train_data <- cbind(train_subject_data, cbind(train_activities, train_X_data))
MergedData <- rbind(test_data, train_data)

## Add columns for the subject and activities to the mean and standard deviation
## data tables and create a single table of the data for analysis.
test_analysis <- cbind(test_subject_data, cbind(test_activities, test_mean_std))
train_analysis <- cbind(train_subject_data, cbind(train_activities, train_mean_std))
analysis_data <- rbind(test_analysis,train_analysis)

## Calculate the mean of each variable grouped by the subjectid and activity.
ActivityMeans <- group_by(analysis_data, subjectid, activity) %>% summarise_each(funs(mean))