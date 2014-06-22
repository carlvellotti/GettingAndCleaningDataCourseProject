test <- read.table("C:/X_test.txt")
train <- read.table("C:/X_train.txt")
ytest <- read.table("C:/y_test.txt")
ytrain <- read.table("C:/y_train.txt")
train <- cbind(ytrain, train)
test <- cbind(ytest, test)
features <- read.table("C:/features.txt")
colnames(train)[2] <- "V562"
colnames(test)[2] <- "V562"
allTheData <- merge(test, train, all = TRUE)
x = TRUE
for (i in 2:562)
{
        x = c(x, FALSE)
}
for (i in 2:562) 
{
        if (grepl("mean", toString(features[i-1,2])) | grepl("std", toString(features[i-1,2])))
        {
                x[i] = TRUE
        }
}
names = "Activity"
for (qw in 1:561)
{
        names = c(names, gsub("-","",toString(features[qw,2])))
}
colnames(allTheData) <- names
allTheData <- allTheData[,x]
activities <- read.table("C:/activity_labels.txt")
for (i in 1:10299)
{
        allTheData[i,1] = toString(activities[allTheData[i,1],2])
}
activitysubjects = NULL
for (i in 1:6)
{
        for (j in 2:80)
        {
                activitysubjects = c(activitysubjects, paste(toString(activities[i,2]),"+",colnames(allTheData)[j], sep = ""))
        }
}
means = NULL
for (i in 1:6)
{
        goodRows = NULL
        for (j in 1:10299)
        {
                if (toString(allTheData[j,1]) == toString(activities[i,2])) 
                {
                        goodRows = c(goodRows, j)
                }
        }
        for (j in 2:80)
        {
                sum = 0
                for (k in goodRows)
                {
                        sum = sum + allTheData[k,j]
                }
                means = c(means, sum/length(goodRows))
        }
}