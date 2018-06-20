# Data Cleaning Final Assignment
The intention of this script is to take the data from Samsung "UCI HAR Dataset" folder (both test and train) and convert it into
two neat formats.

* tidy_data.txt is a text file in table format with only the mean and standard deviation columns for both data sets
* avg_tidy_data.txt is in the same table format and takes the average value for each column in tidy_data.txt separated by test subject AND activity i.e. the average of subject 1, activity 1 is different to subject 1, activity 2 etc.

For the script to work properly these files must exist
.
+-- run_analysis.R
+-- UCI HAR Dataset
	+-- features.txt
	+-- activity_labels.txt
	+-- test
		+-- X_test.txt
		+-- y-test.txt
		+-- subject_test.txt
	+-- train
		+-- X_train.txt
		+-- y-train.txt
		+-- subject_train.txt

For more information about the outputs consult the CODEBOOK.md
