run_analysis <- function() {
      # Libraries to be used
      library(dplyr)
      
      # 1 Merges the training and the test sets to create one dataset
            #1.1 Create a data frame for the test data
                  # First read in all the test data
                  # Then combine into one data frame using column binding, only use the first 6 columns from the variables file X
                  # Add a column as type and save values as test
                  # Add column names for all variables during data load
            #1.2 Create a data frame for the test data
                  # First read in all the test data
                  # Then combine into one data frame using column binding, only use the first 6 columns from the variables file X
                  # Add a column as type and save values as test
                  # Add column names for all variables during data load
            #1.3 Add the training and test data together using Row binding
      #2 Rename the labels value to activity and replace the label integers with descriptive names
      #3 Group the data by subject and then activity and summarise the data by saving the mean of each variable per subject per acitivty
      #4 Write out the data table to a txt file
      
      #1.1
      dataSetTestSubject <- read.csv("UCI HAR Dataset/test/subject_test.txt",header = FALSE, sep = "",col.names = "subject")
      dataSetTestX <- read.csv("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")[ ,1:6]
      dataSetTestX <- rename(dataSetTestX, meanX=V1, meanY=V2, meanZ=V3, stdX=V4, stdY=V5, stdZ=V6)
      dataSetTestY <- read.csv("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "",col.names = "label")
      dataSetTest <- cbind(dataSetTestSubject,dataSetTestY, dataSetTestX)
      # dataSetTest <- mutate(dataSetTest, type = "Test") -  Code kept in case the data is to be grouped based on training or testing data 
      
      #1.2
      dataSetTrainSubject <- read.csv("UCI HAR Dataset/train/subject_train.txt",header = FALSE, sep = "",col.names = "subject")
      dataSetTrainX <- read.csv("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")[ ,1:6]
      dataSetTrainX <- rename(dataSetTrainX, meanX=V1, meanY=V2, meanZ=V3, stdX=V4, stdY=V5, stdZ=V6)
      dataSetTrainY <- read.csv("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "",col.names = "label")
      dataSetTrain <- cbind(dataSetTrainSubject,dataSetTrainY, dataSetTrainX)
      #dataSetTrain <- mutate(dataSetTest, type = "Train") - Code kept in case the data is to be grouped based on training or testing data
      
      #1.3
      combinedData <- rbind(dataSetTrain,dataSetTest)
      
      #2
      combinedData <- mutate(combinedData, label = 
            ifelse( label == 1, "WALKING", ifelse ( label == 2, "WALKING_UPSTAIRS",
            ifelse( label == 3, "WALKING_DOWNSTAIRS", ifelse( label == 4, "SITTING",
            ifelse( label == 5, "STANDING", ifelse( label == 6, "STANDING",NA))))))
      )
      combinedData <- rename(combinedData, activity = label)
      combinedData
      
      #3
      summaryTable <- group_by(combinedData, subject, label)
      summaryTable <- summarise_each(new, funs(mean))
      
      #4
      write.table(summaryTable,file = "summaryData.txt",row.names = FALSE, sep = ",")                            
}