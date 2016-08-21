run_analysis <- function(){

file_name <- "getdata_projectfiles_UCI HAR Dataset.zip"

## Check for downloaded file if not then download and unzip
if (!file.exists(file_name)){
  file_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(file_URL, file_name)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(file_name) 
}

# Read activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
features_required <- grep(".*mean.*|.*std.*", features[,2])
features_labels <- features[features_required,2]


# Load the datasets
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_required]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(subject_train, y_train, x_train)

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_required]
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(subject_test, y_test, x_test)

# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", features_labels)

# turn activities & subjects into factors
allData$activity <- factor(allData$activity, levels = activity_labels[,1], labels = activity_labels[,2])
allData$subject <- as.factor(allData$subject)

allData_melted <- melt(allData, id = c("subject", "activity"))
allData_mean <- dcast(allData_melted, subject + activity ~ variable, mean)
write.table(allData_mean, "tidy.txt", row.names = FALSE, quote = FALSE)
}
