

<h2>Code Book</h2>

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and was originally obtained at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original explaination of the experiment and associated data set can be found at the above address.


<strong>This repo includes 4 items:</strong>

* a ReadMe.md file - introducing and explaining the purpose of this project
* run_analysis.R - a script that produces a tidy data set from the original files, based on the parameters of the project
* tidydatamean.txt - the outputted tidy data set
* CodeBook.md - this code book file


<strong>Explanation of the project and resulting dataset:</strong>

This purpose of this project was to allow us an opportunity to put the class ideas we have learned to practical use.  The requirements of the project were as follows:

You should create one R script called run_analysis.R that does the following. 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


<strong>The run_analysis.R script:</strong>

Please note - This script may be considered "over commented" at a professional level.  Comments are there are direction and reference as a learner of R.

Based on interpretation of the project requirements, details of this script are as follows:

* Script assumes that the data has been downloaded and user has set working directory to the "UCI HAR Dataset"
* Loads up X_train.txt and X_test.txt.  Loads up y_train and y_test>  Bind each together as xfull and yfull tables respectively (by rows).
* Loads up subject_train.txt and subject_test.txt and bind them together to subfull (by rows)
* Adds the feature variable names to the xfull, using only the second column for variable name
* Searches through the xfull data table for all the measurements that were means or standard deviations
* Clean up the new variable names of xfull for style (no uppercase, parentheses or dashes)
* Loads up, cleans and adds the activity labels to the yfull data table
* Adjusted the variable names in yfull and sub full to be more descriptive
* Binds all 3 data tables together (and writes the full tidy data here if the line is uncommented - this is specified in the code)
* Loads the data.table package to collapse the data table to 180 rows, calculating the mean for all the measurements based on the subjectnumber/activity pair
* Writes a txt file of this final tidy data file named - "tidydatameans.tct"



<strong>The tidy data set variables:</strong>

The output of the tidy dataset is a dataset with 180 rows/observations and 88 variables.  Of the variables, 86 are mean and standard deviation (std) measurements that are now displayed as a mean of their original values based on the subjectnumber and activity pair.  In the original data set there were 30 subjects each of which were measured a number of times in each of 6 different activities.  The tidy data set contracts these to the mean for each subject/value pair.

The variables included in the data set are taken from the original 561 measurement variables.  Variables that were included were exclusively those that were mean or standard deviation measurements, reducing the total number of measurements to 86.  The variable names in the tidy data set have been "cleaned up" in accordance with class style rules, but however should still be easily referenced in the original "features_info.txt" and "features.txt" included in the downloadable data zip file (link found above).
