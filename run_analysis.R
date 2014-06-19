if(!file.exists("./UCI HAR Dataset")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./Smartphones.zip",method="curl")
        unzip("./Smartphones.zip")
        unlink("./Smartphones.zip");
}


# 1.Merges the training and the test sets to create one data set.

        # Load the test data
        xtest<-read.table('/Users/anoukpost/Documents/Coursera/Exploratory_Data_Analysis/UCI_HAR_Dataset/test/X_test.txt')
        ytest<-read.table('/Users/anoukpost/Documents/Coursera/Exploratory_Data_Analysis/UCI_HAR_Dataset/test/Y_test.txt')
        subject_test<-read.table('/Users/anoukpost/Documents/Coursera/Exploratory_Data_Analysis/UCI_HAR_Dataset/test/subject_test.txt')

        test_total<-cbind(subject_test,ytest,xtest)

        # Load the training data
        xtrain<-read.table('/Users/anoukpost/Documents/Coursera/Exploratory_Data_Analysis/UCI_HAR_Dataset/train/X_train.txt')
        ytrain<-read.table('/Users/anoukpost/Documents/Coursera/Exploratory_Data_Analysis/UCI_HAR_Dataset/train/Y_train.txt')
        subject_train<-read.table('/Users/anoukpost/Documents/Coursera/Exploratory_Data_Analysis/UCI_HAR_Dataset/train/subject_train.txt')
        
        train_total<-cbind(subject_train,ytrain,xtrain)

        # Make new labels to add to the dataset
        
        features<-read.table('/Users/anoukpost/Documents/Coursera/Exploratory_Data_Analysis/UCI_HAR_Dataset/features.txt')
        features2<-as.vector(features[,2])
        labels<-c('Subject','Activity',features2)

        # Merge the train and test sets
        total_set<-rbind(test_total,train_total)


# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
        
        # Determine which columns have mean() or std() in there.
        # I also add the first two columns, because I want to show the 
        # subject and the activities
        mn<-grep('mean()',labels)
        sd<-grep('std()',labels)
        col_select<-c(1,2,sort(union(sd,mn)))

        total_subset<-total_set[,col_select]

 
# 3.Uses descriptive activity names to name the activities in the data set
        
        activity_names<-read.table('/Users/anoukpost/Documents/Coursera/Exploratory_Data_Analysis/UCI_HAR_Dataset/activity_labels.txt')
        total_subset$V1.1<-factor(total_subset$V1.1)
        levels(total_subset$V1.1)<- c("Walking","Walking_upstairs","Walking_downstairs", 
                          "Sitting","Standing","Laying")
        
        
# 4.Appropriately labels the data set with descriptive variable names
        colnames(total_subset)<-labels[col_select]
        
# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
        total_subset$Subject<-factor(total_subset$Subject)
        tidy<-aggregate(. ~ Activity+Subject, data = total_subset,FUN=mean )
        
        index <- with(tidy, order(Subject, Activity))
        tidy[index, ]
        
        tidy2<-tidy
        tidy2[,1]<-tidy[,2]
        tidy2[,2]<-tidy[,1]
        
        
        
        View(tidy)

write.table(tidy2, "tidydata.txt", sep="\t")
        