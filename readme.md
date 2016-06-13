First steps
## checks for existing folder in the working directory, if there is no folder named "data", then it 
creates a folder named "data"
## download the file from the URL in a destination folder named "Dataset.zip"
## the https command gave me some error message so i did a google search. I found a suggesion
from the stack overflow to only use "http" and the command worked
##unziped the "Dataset.zip" folder which consists of a folder named "UCI HAR Dataset"
## the files inside the "UCI...." folder can be viwed with defining the file.path using the followng
 and list.files command

second steps
This stpes deals with reading the Test and train datafiles into R and merging into a single file
# Although I was in the same working directory, I was not able to load data with(some error message)
 so I gave the absolute file path 

Third setp
Extract mean and standard deviation from dataset

Fourth step
Uses descriptive activity names to name the activities in the data set

Fifth step
Appropriately labels the data set with descriptive activity names.

last step
Creates a second, independent tidy data set with the average of each variable for each activity and each subject
