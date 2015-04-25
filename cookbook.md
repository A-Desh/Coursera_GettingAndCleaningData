This file describes the step-by-step process to create the Getting and Cleaning Data project assignment.

Data Source: Link for site
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data available at
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Getting data from source:
	Get the data from the source above and store it in home directory\data
	Note: (The source is a ZIP file, so it is important to extract it)
 
run_analysis.R script performs the following steps to clean the sample data and generate two files merged.txt and data_with_mean.txt

1.	Set the working directory to Home directory\Data

2.	Get the required files
a.	Read X_train.txt, y_train.txt and subject.txt files from /data/train and store them in trainData, trainLabel and trainSubject variables respectively.
b.	Read X_test.txt, y_test.txt and subject_test.txt files from /data/test and store them in testData, testLabel and testSubject variables respectively.

3.	Join Data
a.	Join data of train and test variables for each X, y and Subject and store them in joinX.Data, joiny.Data and joinSubject.Data variables
b.	Name the joinSubject.Data to “subject”

4.	Extract only mean and standard deviation from the features
a.	Get the all features from features.txt and store them in features variables
b.	Extract the indices of only Mean and Standard deviation features
c.	Extract only relevant features from joinData variable and store them in joinData
d.	Name the columns to the relevant features.

5.	Uses descriptive activity names for the activities
a.	Get the all the subject activities from activity_labels.txt and store them in activity variables
b.	Remove “_” from the second column (activitylabels)
c.	Transform the values of joinLabel according to the activity data frame
d.	Name the joinLabel as “activity” 

6.	Create and store tidy data set
a.	Combine all datasets (joinSubject, joinLabel and joinData) once all data sets are cleaned up into a tidyData variable
b.	Write the newly created tidyData data frame out to the home directory and named as merged_data.txt  

7.	Create tidy data set with the average of each included variable for each activity and each subject.
a.	Aggregate for each subject and activity to calculate the Mean value for all included variables and store them in mean.tidyData data frame
b.	Write the results out to the tidyData.WithMean.txt file in working directory
