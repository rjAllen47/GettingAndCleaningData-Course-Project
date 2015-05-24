# Getting-and-Cleaning-Data---Course-Project
The run_analysis.R script accomplishes the following:

1. Downloads the UCI Human Activity Recognition Using Smartphones data set, which contains data collected from accelerometers from the Samsung Galaxy S smartphone.
2. Merges the training and test sets to create one data set.
3. Labels the columns with descriptive variable names.
4. Extracts only the measurements on mean and standard deviation for each measurement.
5. Uses descriptive activity names to name the activities in the data set.
6. Creates an independent tidy data set with the average of each variable for each activity and each subject.

The tidy dataset can be viewed with the following code:

```{r}
tidyData <- read.table("http://s3.amazonaws.com/coursera-uploads/user-a063f05fba3e63e76be1218f/973501/asst-3/2792e98001c611e59f2339ce6bf51017.txt", header = TRUE)
View(tidyData)
```
