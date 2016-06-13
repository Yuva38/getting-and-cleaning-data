if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip")
unzip(zipfile = "./data/Dataset.zip", exdir = "./data")
## checks for existing folder in the working directory, if there is no folder named "data", then it 
creates a folder named "data"
## download the file from the URL in a destination folder named "Dataset.zip"
## the https command gave me some error message so i did a google search. I found a suggesion
from the stack overflow to only use "http" and the command worked
##unziped the "Dataset.zip" folder which consists of a folder named "UCI HAR Dataset"
## the files inside the "UCI...." folder can be viwed with defining the file.path using the followng
 and list.files command
## RFpath <- file.path("./data", "UCI HAR Dataset")
## files <- list.files(RFpath, recursive=TRUE)
## files
## There are 28 .txt files inside the "UCI ..." folder
 
## This section is now deals with reading the test and train datafiles into R and
merging into a single file
x.train <- read.table("C:\\Users\\Subodha\\Rprograming\\data\\UCI HAR Dataset\\train\\X_train.txt")
x.test <- read.table("C:\\Users\\Subodha\\Rprograming\\data\\UCI HAR Dataset\\test\\X_test.txt")
x <- rbind(x.train, x.test)

## Read and merge subject test
subj.train <- read.table("C:\\Users\\Subodha\\Rprograming\\data\\UCI HAR Dataset\\train\\subject_train.txt")
subj.test <- read.table("C:\\Users\\Subodha\\Rprograming\\data\\UCI HAR Dataset\\test\\subject_test.txt")
subj <- rbind(subj.train, subj.test)

## Read Feature test
y.train <- read.table("C:\\Users\\Subodha\\Rprograming\\data\\UCI HAR Dataset\\train\\y_train.txt")
y.test <- read.table("C:\\Users\\Subodha\\Rprograming\\data\\UCI HAR Dataset\\test\\y_test.txt")
y <- rbind(y.train, y.test)
## dim(y)
## extracting mean and standard deviation from dataset
features <- read.table("C:\\Users\\Subodha\\Rprograming\\data\\UCI HAR Dataset\\features.txt")
mean.sd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x.mean.sd <- x[, mean.sd]
##Uses descriptive activity names to name the activities in the data set
names(x.mean.sd) <- features[mean.sd, 2]
names(x.mean.sd) <- tolower(names(x.mean.sd)) 
names(x.mean.sd) <- gsub("\\(|\\)", "", names(x.mean.sd))

activities <- read.table("C:\\Users\\Subodha\\Rprograming\\data\\UCI HAR Dataset\\activity_labels.txt")
activities[, 2] <- tolower(as.character(activities[, 2]))
activities[, 2] <- gsub("_", "", activities[, 2])

y[, 1] = activities[y[, 1], 2]
colnames(y) <- 'activity'
colnames(subj) <- 'subject'
## Appropriately labels the data set with descriptive activity names.
data <- cbind(subj, x.mean.sd, y)
str(data)
write.table(data, file = "merged.txt", row.names = F)
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
average.df <- aggregate(x=data, by=list(activities=data$activity, subj=data$subject), FUN=mean)
average.df <- average.df[, !(colnames(average.df) %in% c("subj", "activity"))]
str(average.df)
write.table(average.df, file = "average.txt", row.name = FALSE)

