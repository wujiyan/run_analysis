run_analysis <- function(){
  #read all the data, respectively
  subject_test <- read.table("C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/test/subject_test.txt")
  X_test <- read.table("C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/test/y_test.txt")
  subject_train <- read.table("C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/train/subject_train.txt")
  X_train <- read.table("C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/train/y_train.txt")
  features <- read.table("C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/features.txt")
  activity_labels <- read.table("C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/activity_labels.txt")
  
  #merge data seperately
  X <- rbind(X_test, X_train)
  y <- rbind(y_test, y_train)
  subject <- rbind(subject_test, subject_train)
  names(subject) <- "subject"     #label subject variable
 
  #extract only mean and std variables as target features
  Tar_fea <- grep("mean|std", features[,2])
  X <- X[,Tar_fea]    #subset X dataset, remaining only target variables
  names(X) <- features$V2[Tar_fea]    #labels the variables names
  
  #replace numbers by activity labels in y
  y_label <- merge(y, activity_labels, by.x = "V1", by.y = "V1")
  y_label <- y_label[,-1]      #delete the first column with only numbers
  y_label <- data.frame(y_label)     #turn it to a data frame
  colnames(y_label) <- "activity label"    #replace the variable name as activity label
  comp_data <- cbind(subject,y_label,X)      #merge all the data

  #dataset output
  write.table(comp_data, "C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/completedadta.txt")
  
  library(data.table)
  tidydata <- data.table(comp_data)
  mean <- tidydata[,lapply(.SD,mean),by = c("subject","activity label")]  #count the mean of value by subject and activity lable
  write.table(mean,"C:/R/Cleaning and getting data/week 4/UCI HAR Dataset/meandata.txt",row.name = FALSE)    #output a new table
}