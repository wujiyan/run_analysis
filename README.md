run_analysis
The dataset includes the following files:
=========================================

- 'README.txt'

- 'codebook.txt'

- 'meandata.txt'

- 'run_analysis.R'

Outlines of the run_analysis.R files:
=========================================

1. download the files from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", unzipped it and save them in your own directory folder.

2. read concerning documents, respectively

3. merge X_test and X-train as X, y_test and y_train as y, subject_test and subject_train as subject, respectively. 

4. extract variables that we care about only, mean and std, from dataset X and apply descriptive names. 

5. apply descriptive names to data set y.

6. merge the three tidy data sets that have been processed above as a complete dataset. 

7. output the data set as a local txt document.

8. count the means by subject and activity label, then output another data set as a local txt document.


