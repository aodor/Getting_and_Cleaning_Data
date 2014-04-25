RGettingAndCleaningDatta - run_analysis.R
=================================

Coursera's Johns Hopkins course, part of the Specialization in Data Science.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 


https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Files:
====

The downloaded zip contained several files, after opening most of them and seeing their structure, these are the needed files for the assignment:

activity_labels.txt (labels for the 6 activities)<br />
features.txt (names of the 561 variables [columns])<br />
subject_test.txt (number of each of the 30 subjects)<br />
subject_train.txt (number of each of the 30 subjects)<br />
X_test.txt (observations of the testing group)<br />
X_train.txt (observations of the training group)<br />
y_test.txt (number which identifies one of the 6 activities)<br />
y_train.txt (number which identifies one of the 6 activities)<br />



The script run_analysis does the following:

1) Read the 6 txt files into R as datasets
2) Bind (by rows) the two sets the two sets of  training and testing data:
    x_train + x_test;    y_train + y_test;     s_train + s_test 
3) Format the activities names to be lower case and give the column the name “activities”)
4) Naming the column with values in the subjects file "subjects"
5) Using grep, create a vector with the position of the variables which     include mean() or std() from the x_train - x_test subset
6) Bind by columns the subjects, activities and the rest of the columns
7) Using the number of columns from step 5, create a subset of the 30  subjects and their 6 activites and calculate their means
8) Write a new file with that subset (MeanStd.txt)
