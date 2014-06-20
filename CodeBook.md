---
title: "CodeBook"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

<h3>Transformations or work that I performed to clean up the data</h3>
1. Merged the training and the test sets to create one data set.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the data set
4. Labeled the data set with descriptive variable names
5. Created the tidy data set (tidy.txt) with the average of each variable for each activity and each subject. 

<h3>The data</h3>

The original dataset can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It had been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. So the first step was to merge these two test. 


<h3>The variables in tidy.txt</h3>

Activity = One of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) a person was doing while the measurement was done

Subject = subject number (total of 30 volunteers)

The other variables all variables that contained either 'mean' or 'std' in the column names. 



