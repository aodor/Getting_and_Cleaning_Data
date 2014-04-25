##============================================================================
## Getting Data
##============================================================================

#Reading x_train.txt 
xTrain <- read.table("x_train.txt")
#Reading x_test.txt 
xTest <- read.table("x_test.txt")

#Reading y_train.txt 
yTrain <- read.table("y_train.txt")
#Reading y_test.txt 
yTest <- read.table("y_test.txt")

#Reading s_train.txt 
sTrain <- read.table("subject_train.txt")
#Reading s_test.txt 
sTest <- read.table("subject_test.txt")


##==========================================================================
## Binding Training and Test Data
##==========================================================================

xTot <- rbind(xTrain, xTest)
yTot <- rbind(yTrain, yTest)
sTot <- rbind(sTrain, sTest)


##=========================================================================
## Giving Descriptive Names to Activities
##=========================================================================

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
yTot[, 1] = activities[yTot[, 1], 2]
names(yTot) <- "activity"

##=========================================================================
## Giving Name to Subjects Colum
##=========================================================================

names(sTot) <- "subject"

##=========================================================================
## Selecting Columns With Mean or STD values
##=========================================================================

variables <- read.table("features.txt")
select_columns <- grep("-mean\\(\\)|-std\\(\\)", variables[, 2])
xTot <- xTot[, select_columns]
names(xTot) <- variables[select_columns, 2]
names(xTot) <- gsub("\\(|\\)", "", names(xTot))

names(xTot) <- tolower(names(xTot))

##=========================================================================
## Binding sTot, yTot, and xTot
##=========================================================================

totalData <- cbind(sTot, yTot, xTot)
write.table(totalData, "total_data.txt")

##=========================================================================
## Extracting the reduced Dataset MeanStd
##=========================================================================

noRepeated = unique(sTot)[,1]
countSubjects = length(unique (sTot)[, 1])
countActivities = length(activities[, 1])
countColumns = dim(totalData) [2]
final = totalData[1:(countSubjects*countActivities), ]

row = 1
for (s in 1:countSubjects) {
        for (a in 1:countActivities) {
                final[row, 1] = countSubjects[s]
                final[row, 2] = activities[a, 2]
                tmp <- totalData[totalData$subject==s & totalData$activity==activities[a, 2],]
                final[row, 3:countColumns] <- colMeans(tmp[, 3:countColumns])
                row = row = 1
        }
}

write.table(final, "MeanStd.txt")









                     




