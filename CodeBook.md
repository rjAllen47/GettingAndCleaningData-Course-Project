---
title: "CodeBook.md"
author: "Risa Allen"
date: "May 23, 2015"
---

STUDY DESIGN
============


The tidy data set created by the run_analyis.R script uses the UCI Human 
Activity Recognition Using Smartphones data set, which contains data collected 
from accelerometers from the Samsung Galaxy S smartphone. 

Below is the information provided in the README.txt file of the UCI HAR Dataset
describing the parameters of the experiments and how the data was preproccessed
to get the measurement values:  
  
***
Human Activity Recognition Using Smartphones Dataset  
Version 1.0

***

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universit‡ degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  

***

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded to 
label the data manually. The obtained dataset has been randomly partitioned into 
two sets, where 70% of the volunteers was selected for generating the training 
data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. See 
'features_info.txt' for more details. 



CLEANING AND SUMMARIZING
========================

The original data set was split up into six separate files. The first three 
files contain the data for the training group and the last three files contain 
the data for the test group: 

* subject_train.txt - numbers 1-30 identifying each test subject
* X_train.txt - measurements for each experiment
* y-train.txt - numbers 1-6 corresponding to each activity
* subject_test.txt - numbers 1-30 identifying each test subject
* X_test.txt - measurements for each experiment
* y-test.txt - numbers 1-6 corresponding to each activity
        
The following steps were used to clean the original data set from UCI:

1. Since the training and test data sets both contain the same variables, we can 
combine the two data sets over each variable to create larger, merged data sets. 
This was done using rbind for the subject, activity and measurement data sets.
2. Since we are only interested in the mean and standard deviation measurements,
grepl was used to extract only the variables related to the mean and standard
deviation.
3. Then the subject, activiy and narrow measurement data sets were merged 
together with cbind.
4. At this point, the activity labels are still just numbers 1-6 corresponding
to the activities listed in the activity_labels.txt file. Using the information
in that file, the activities are turned into factors and the levels labeled
with the desciptive activity names.
5. To get the tidy data set with the average of each variable for each activity 
and each subject, the data is first grouped by activity and subject. Then to
find the average, the summarise_each function is used to find the mean for each
measurement by activity and subject.
6. The write.table function is then used to create the txt output file for our
tidy data set.

The resulting table meets all the requirements of a tidy data set as specified 
in the lectures:

* Each variable measured is in one column
* Each different observation is in a different row
* One table for each "kind" of variable

To read the tidy data set into R, please use the following code:

        tidyData <- read.table("http://s3.amazonaws.com/coursera-uploads/user-a063f05fba3e63e76be1218f/973501/asst-3/2792e98001c611e59f2339ce6bf51017.txt", header = TRUE)
        View(tidyData)


CODE BOOK
=========

The tidy data set contains the following variables:

- **Activity** (Column 1)

    *Type of activity being performed by the test subject while measurements 
    were taken* 

    - Walking
    - Walking Upstairs
    - Walking Downstairs
    - Sitting
    - Standing
    - Laying  


- **Subject** (Column 2)

    *Number identifying the test subject performing each experiment*
        
    - 1-30  


- **Mean and standard deviation measurements** (Columns 3-81) 
    
    *Additional information on the variables from the UCI HAR dataset is 
    included below. The names of the columns in the tidy data set are:*

    - tBodyAcc.mean()-X             
    - tBodyAcc.mean()-Y
    - tBodyAcc.mean()-Z               
    - tGravityAcc.mean()-X           
    - tGravityAcc.mean()-Y            
    - tGravityAcc.mean()-Z            
    - tBodyAccJerk.mean()-X          
    - tBodyAccJerk.mean()-Y           
    - tBodyAccJerk.mean()-Z           
    - tBodyGyro.mean()-X             
    - tBodyGyro.mean()-Y               
    - tBodyGyro.mean()-Z              
    - tBodyGyroJerk.mean()-X         
    - tBodyGyroJerk.mean()-Y          
    - tBodyGyroJerk.mean()-Z          
    - tBodyAccMag.mean()             
    - tGravityAccMag.mean()           
    - tBodyAccJerkMag.mean()          
    - tBodyGyroMag.mean()            
    - tBodyGyroJerkMag.mean()         
    - fBodyAcc.mean()-X               
    - fBodyAcc.mean()-Y              
    - fBodyAcc.mean()-Z               
    - fBodyAcc.meanFreq()-X           
    - fBodyAcc.meanFreq()-Y          
    - fBodyAcc.meanFreq()-Z           
    - fBodyAccJerk.mean()-X           
    - fBodyAccJerk.mean()-Y          
    - fBodyAccJerk.mean()-Z           
    - fBodyAccJerk.meanFreq()-X       
    - fBodyAccJerk.meanFreq()-Y      
    - fBodyAccJerk.meanFreq()-Z       
    - fBodyGyro.mean()-X              
    - fBodyGyro.mean()-Y             
    - fBodyGyro.mean()-Z              
    - fBodyGyro.meanFreq()-X          
    - fBodyGyro.meanFreq()-Y         
    - fBodyGyro.meanFreq()-Z          
    - fBodyAccMag.mean()              
    - fBodyAccMag.meanFreq()         
    - fBodyBodyAccJerkMag.mean()      
    - fBodyBodyAccJerkMag.meanFreq()  
    - fBodyBodyGyroMag.mean()        
    - fBodyBodyGyroMag.meanFreq()     
    - fBodyBodyGyroJerkMag.mean()     
    - fBodyBodyGyroJerkMag.meanFreq()
    - tBodyAcc.std()-X                
    - tBodyAcc.std()-Y                
    - tBodyAcc.std()-Z               
    - tGravityAcc.std()-X             
    - tGravityAcc.std()-Y             
    - tGravityAcc.std()-Z            
    - tBodyAccJerk.std()-X            
    - tBodyAccJerk.std()-Y            
    - tBodyAccJerk.std()-Z           
    - tBodyGyro.std()-X               
    - tBodyGyro.std()-Y               
    - tBodyGyro.std()-Z              
    - tBodyGyroJerk.std()-X           
    - tBodyGyroJerk.std()-Y           
    - tBodyGyroJerk.std()-Z          
    - tBodyAccMag.std()               
    - tGravityAccMag.std()            
    - tBodyAccJerkMag.std()          
    - tBodyGyroMag.std()              
    - tBodyGyroJerkMag.std()          
    - fBodyAcc.std()-X               
    - fBodyAcc.std()-Y                
    - fBodyAcc.std()-Z                
    - fBodyAccJerk.std()-X           
    - fBodyAccJerk.std()-Y            
    - fBodyAccJerk.std()-Z            
    - fBodyGyro.std()-X                      
    - fBodyGyro.std()-Y               
    - fBodyGyro.std()-Z               
    - fBodyAccMag.std()              
    - fBodyBodyAccJerkMag.std()       
    - fBodyBodyGyroMag.std()          
    - fBodyBodyGyroJerkMag.std()  


Below is the information provided in the features_info.txt file of the UCI HAR 
Dataset describing the variables in the original data set before it was cleaned:

***
Feature Selection  

***
The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals 
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they 
were filtered using a median filter and a 3rd order low pass Butterworth filter 
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
signal was then separated into body and gravity acceleration signals 
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter 
with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
signals). 

These signals were used to estimate variables of the feature vector for each 
pattern:  
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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean 
frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of 
each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. 
These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 
'features.txt'