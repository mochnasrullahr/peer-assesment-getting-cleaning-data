# TASK 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

# STEP 0: FEATURES

# Feature, Load Colnames and Filter only mean & std measurement
col_names<-read.table("UCI HAR Dataset//features.txt")
col_idx<-grep("mean|std", col_names[,2])

# STEP 1: SUBJECT DATASETS

# Subject dataset, load files & set labels
subject_test<-read.table("UCI HAR Dataset//test/subject_test.txt")
subject_train<-read.table("UCI HAR Dataset//train/subject_train.txt")
names(subject_test)<-c("subjectnumber")
names(subject_train)<-c("subjectnumber")

# STEP 2: X DATASETS

#X datasets, load files
x_test<-read.table("UCI HAR Dataset//test/X_test.txt")
x_train<-read.table("UCI HAR Dataset//train/X_train.txt")
#As prev Features, Get only columns with mean and std
x_test<-x_test[,col_idx]
x_train<-x_train[,col_idx]
#As prev Features, Set labels
names(x_test)<-col_names[col_idx,2]
names(x_train)<-col_names[col_idx,2]


# STEP 3: Y DATASETS

# y datasets, load activity labels
activity_labels<-read.table("UCI HAR Dataset//activity_labels.txt")

#Load files (y)
y_test<-read.table("UCI HAR Dataset//test/y_test.txt")
y_train<-read.table("UCI HAR Dataset//train/y_train.txt")

# TASK 3: Uses descriptive activity names to name the activities in the data set

#Merge y datasets (train and test) with activity labels
y_test<-merge(activity_labels, y_test)
y_train<-merge(activity_labels, y_train)

# TASK 4: Appropriately labels the data set with descriptive variable names.

#Set labels for y datasets
names(y_test)<-c("activitycode", "activitydescription")
names(y_train)<-c("activitycode", "activitydescription")

# TASK 1: Merges the training and the test sets to create one data set

# STEP 4: BUILD DATAFRAME

#Build test & train data frame
test_df<-data.frame(subject_test, y_test, x_test)
train_df<-data.frame(subject_train, y_train, x_train)
#Combine test and train data frame
dataset<-rbind(test_df, train_df)

# TASK 5: From the data set in step 4, creates a second, independent 
#         tidy data set with the average of each variable for each 
#         activity and each subject.

# STEP 5: TIDY

#Create a second dataset by subject and acvitity
splitdatasets<-split(dataset, list(dataset$subjectnumber, dataset$activitycode), drop=TRUE)

#Calculate column average (only to certain columns) and transpose
col_avg<-data.frame(t(sapply(splitdatasets, function(x) colMeans(x[, 4:82], na.rm=TRUE))))
#Set row names
subject.activity<-row.names(col_avg)
col_avg<-cbind(subject.activity, col_avg)

# STEP 6: SAVE TO FILE
write.table(col_avg, file="tidydataset.txt")