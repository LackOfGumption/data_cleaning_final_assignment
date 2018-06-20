# tidy_data.txt
A collation of the data from both X_test.txt and X_trial.txt sets. 
1    subject    the index for one of the 30 participants in this collection
2    activity    the full name of the activity the subject is performing
3    tBodyAcc-mean()-X the mean acceleration in the X direction throughout the activity
4    tBodyAcc-mean()-Y the mean acceleration in the Y direction throughout the activity
5    tBodyAcc-mean()-Z the mean acceleration in the Z direction throughout the activity
6    tBodyAcc-std()-X the standard deviation of acceleration in the X direction throughout the activity
7    tBodyAcc-std()-Y the standard deviation of acceleration in the Y direction throughout the activity
8    tBodyAcc-std()-Z the standard deviation of acceleration in the Z direction throughout the activity
...
The remaining columns are the mean and standard deviation (std) columns extracted from the "UCI HAR Dataset" features.txt.
Information on how their data was obtained and what each column means can be found in the features_info.txt file in the same folder as
the feature.txt file.

# avg_tidy_data.txt
A futher simplification of the tidy_data.txt data set. avg_tidy_data takes the average value for each column in tidy_data.txt separated by test subject AND activity i.e. the average of subject 1, activity 1 is different to subject 1, activity 2 etc.

avg_tidy_data.txt has exactly the same columns as tidy_data.txt.