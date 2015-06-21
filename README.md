<h1> READ ME </h1>
<h2> Getting and Cleaning Data Assignment </h1>
<h3> Introduction and Background </h2>
<p> The purpose of this project is to summarize data gathered through movement instrumentation into a merged and summarized data frame. The original data was recorded by the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
 </p>
 
 <p> 
 The data was summarized using the run_analysis.R script found in this folder. This script calculated the averages of the mean and standard deviation of the accelerometer measurements in X,Y and Z axis and grouped them by subject and activity type. The steps for this script can be found below.
 </p>

<h3> Steps for merging, reshaping and summarizing data </h3>
1. Create a data frame for the test data by first reading in all the test data into separate data frames and add in descriptive headings for each during reading. Read in all the columns for the X data file but only use the first 6 columns when saving them to a data frame. Then combine all the test data frames into one data frame using column binding
2. To the same steps as above for the train data.
3. Add together the train and test data frames using Row binding
4. Rename the labels value to activity and replace the label integers with descriptive names
5. Group the data frame by subject and then activity 
6. Summarize the data by saving the mean of each variable per subject per activity
7. Write out the data frame to a txt file. Data can also be written out to a csv file for easy reading.

(__Note__: The above steps are written in more detail within the R scrip run_analysis.R)
