# The code book 
This is the codebook that describes the variables, the data, and any transformations or work performed to clean up the data.


## Source

* The data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Variables

* col_avg: Final tidy dataset, hold calculation result transpose of column average
* splitdatasets: Hold dataset by subject and acvitity
* dataset: Hold combined test and train data frame
* test_df: Test Data Frame
* train_df: Train Data Frame

## transformations / Work
0. Load Features
1. Load Subject Datasets
2. Load X Datasets
3. Load Y Datasets
4. Build Dataframe Required
5. Tidy Data
6. Save To File
