Preliminary Information
-----------------------
-) data obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
-) A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Steps of the Analysis File
-------------------------- 
1) Reads the columns from the provided data
2) Reads row names from the provided data
3) Binds the rows names to the columns
4) Reads the features from the provided data
5) Sets the second column name for both train and test to V562 (to make them match)
6) Merges all the data into a single data frame
7) Extracts all the columns with the "mean" or "std" in them
8) Removes the "-" symbol from the column names
9) Adds the activity lables to all of the data
10) Goes through each of the 6 activities and finds the mean of each