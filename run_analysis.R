#Refer to codebook and run instructions prior to running script

# Step1 - Read datasets X, y and Subject in relevant variables
XTrain.Data <- read.table("./train/X_train.txt")
yTrain.Data <- read.table("./train/y_train.txt")
subjectTrain.Data <- read.table("./train/subject_train.txt")
XTest.Data <- read.table("./test/X_test.txt")
yTest.Data <- read.table("./test/y_test.txt") 
subjectTest.Data <- read.table("./test/subject_test.txt")

# Combine datasets X, y and Subject 
joinX.Data <- rbind(XTrain.Data, XTest.Data)
joiny.Data <- rbind(yTrain.Data, yTest.Data)
joinSubject.Data <- rbind(subjectTrain.Data, subjectTest.Data)
names(joinSubject.Data) <- "subject"

# Step2 - Extract mean and standard deviation
features.Data <- read.table("./features.txt", col.names=c("featureId", "featureLabel"))
includedFeatures <- grep("[Mm]ean\\(\\)|[Ss]td\\(\\)", features.Data[, "featureLabel"])
joinX.Data <- joinX.Data[, includedFeatures]
#Standardise column names
names(joinX.Data) <- gsub("-", "", features.Data[includedFeatures, "featureLabel"]) # remove hyphens in column names 
names(joinX.Data) <- gsub("mean", "Mean", names(joinX.Data)) # Capitalise "mean" to "Mean" in column names 
names(joinX.Data) <- gsub("std", "Std", names(joinX.Data)) # Capitalise "std" to "Std" in column names 

# Step3 - Set descriptive activity names for the activities
activity <- read.table("./activity_labels.txt", col.names=c("activityId", "activityLabel"))
activity[, "activityLabel"] <- gsub("_", "", activity[, "activityLabel"])
activityLabel <- activity[joiny.Data[, 1], "activityLabel"]
joiny.Data[, 1] <- activityLabel
names(joiny.Data) <- "activity"

# Step4 - Combine data set with subjects and activities. 
tidyData <- cbind(joinSubject.Data, joiny.Data, joinX.Data)
write.table(tidyData, "tidy_data.txt", row.name=FALSE)
write.csv(tidyData, "tidy_data.csv") 

# Step5 - Create tidy data set with the average of 
# each variable for each activity and each subject. 
measurements <- tidyData[, 3:dim(tidyData)[2]]
mean.tidyData <- aggregate(measurements, list(tidyData$subject, tidyData$activity), mean)
names(mean.tidyData)[1:2] <- c("subject", "activity")

write.csv(mean.tidyData, "tidyData.WithMean.csv") 
write.table(mean.tidyData, "tidyData.WithMean.txt", row.name=FALSE) 