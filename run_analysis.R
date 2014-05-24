# Many thanks to David Hood and his graphical representation of how to set this up
# at https://class.coursera.org/getdata-003/forum/thread?thread_id=90#comment-777

# assumes downloaded data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# assumes decompressed and working folder set to "UCI HAR Dataset"


# load up x and y train and test

xtrain <- read.table("train\\X_train.txt")
xtest <- read.table("test\\X_test.txt")
ytrain <- read.table("train\\y_train.txt")
ytest <-read.table("test\\y_test.txt")

# bind the train and test together (by rows)

xfull <- rbind(xtrain, xtest)
yfull <- rbind(ytrain, ytest)

#load up subject train and test

subtrain <- read.table("train\\subject_train.txt")
subtest <- read.table("test\\subject_test.txt")

# bind subject train and test together (by rows)

subfull <- rbind(subtrain, subtest)

# add feature variable names to xfull (use only 2nd column for variable name)

features <- read.table("features.txt")
features <- features[,2]
names(xfull) <- features


# get only the columns that are mean and std for xfull
# Thanks to slide 9 of lecture "Regular Expressions I" and 
# http://stackoverflow.com/questions/7597559/grep-in-r-with-a-list-of-patterns
# to remind about not using spaces around the pipe (|)make features lowercase to make searching easier

features <- tolower(features)
requiredfeatures <- grep("mean|std", features)
xfullsmall <- xfull[, requiredfeatures]

# clean up column names for style (no uppercase, parentheses or dashes)
names(xfullsmall) <-  tolower(gsub("\\-|\\(|\\)", "", names(xfullsmall)))

# load in and clean up labels for activities (yfull)
actlabels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
actlabels[,2] <- tolower(gsub("\\_", "", actlabels[,2]))

# change activity variables to descriptive names and variable name to activity
# Thanks to D. Hood for suggestion on subsetting 
# https://class.coursera.org/getdata-003/forum/thread?thread_id=262#post-1119
names(yfull) <- "activity"
yfull$activity[yfull$activity == 1] <- "walking"
yfull$activity[yfull$activity == 2] <- "walkingupstairs"
yfull$activity[yfull$activity == 3] <- "walkingdownstairs"
yfull$activity[yfull$activity == 4] <- "sitting"
yfull$activity[yfull$activity == 5] <- "standing"
yfull$activity[yfull$activity == 6] <- "laying"

# change subject variable name to something desciptive
names(subfull) <- "subjectnumber"

# bind all the tables together and write tidy data file
datafull <- cbind(subfull, yfull, xfullsmall)
#write.table(datafull, file="tidydata.txt") #uncomment this line for full tidydata

# use data.table to find means
# thanks to https://class.coursera.org/getdata-003/forum/thread?thread_id=129#comment-800
# for explaination on, and advantages to, data.table
library(data.table)
newdata <- data.table(datafull)
meantable <- newdata[,lapply(.SD, mean), by = c("subjectnumber", "activity")]
meantable <- meantable[order(meantable$subjectnumber)]


# write the tiny data (with means) file
write.table(meantable, file="tidydatameans.txt")
