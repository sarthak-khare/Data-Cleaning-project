# Codebook for data cleaning project
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

See the README.md file of this repository for more background information on this data set.

# Data
tidy_data.txt was created as a final product after doing transformations on the raw data files.

# Variables

Subject : Refers to the subjects who participated in the exercise undertaken to collect data (Total - 30).
Activity: In total , each subject performed 6 activities. Activity list can be found in the Activity_labels.txt file in the dataset provided.
mean(): Contains the mean value of all signals. Refer Feature.info.txt for more information.
std(): Contains the Standard Deviation value of all signals. Refer Feature.info.txt for more information.

# Transformations

1. Download the raw dataset from the source
2. Read the training dataset
3. Read the test dataset
4. Add Subject and Activity details to both the training and test datasets
5. Merge the 2 datasets.
6. Select only mean and standard deviation variables.
7. Label the activity data (Assign each activity its label , eg: 1 <> walking)
8. Tidy the dataset by taking the average of each variable for each activity and each subject.

