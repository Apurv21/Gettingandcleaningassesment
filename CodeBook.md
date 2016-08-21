# Introduction
logic to execute problem statement.

1. check if required files are available in disk else download .zip file and unzip.
2. Load the activity and feature information
3. Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
4. Load activity and subject data for each dataset, and merge columns with the dataset
5. Merges the two datasets
6. Converts activity and subject columns to factors
7. Create a tidy dataset that consists of the average (mean) value of each
   variable for each subject and activity pair.
8. write data into 'tidy.txt'file.

#variables
file_name: contains name of unziped file
file_URL: contains url to download dataset
activity_labels: contains data from activity_labels.txt
features: contains data from features.txt
features_required: contains required columns data
features_labels: contains required column names
x_train: contains data from x_train.txt
y_train: contains data from y_train.txt
subject_train: contains data from subject_train.txt
train: contains table joined from x_train, y_train and subject_train variables
x_test: contains data from x_test.txt
y_test: contains data from y_test.txt
subject_test: contains data from subject_test.txt
test: contains table joined from x_test, y_test and subject_test vaibales
allData: contains data by binding train and test variables
allData_melted: contains melted data
allData_mean: contains mean of all data