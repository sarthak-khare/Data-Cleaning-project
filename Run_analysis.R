filename <- "getdata_dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

## Reading main data
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")

## Reading test data
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

## Reading training data
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")

##Adding subject and activity details
test_data<-cbind(subject_test,y_test, X_test)
names(test_data) <-c("subject","activity",as.character(features[,2]))
      
train_data<-cbind(subject_train,y_train, X_train)
names(train_data) <-c("subject","activity",as.character(features[,2]))

## Merging the datasets
merged_data<-rbind(test_data,train_data)


## Selecting only mean & std variables
index_mean_std<-grep("mean|std", names(merged_data))
mean_std_data<-merged_data[,c(1,2,index_mean_std)]

## Labeling activity data
mean_std_data$activity<-factor(mean_std_data$activity , levels = activity_labels[,1], labels = activity_labels[,2])

## Clean variable names
var_names<-names(mean_std_data)
var_names<-gsub("[()-]","", var_names)

names(mean_std_data)<- var_names

## Creating tidy data

tidy_data<- mean_std_data %>%
                group_by(subject,activity) %>%
                      summarise_all(mean)

## writing to a text file
write.table(tidy_data,"tidy_data.txt",row.names = F,quote = F)


## Removing unneccessary data from the script
rm(mean_std_data,merged_data,subject_test,subject_train,test_data,train_data,X_test,X_train,y_test,y_train)