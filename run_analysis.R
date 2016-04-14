library(reshape2)
  
features<-read.table("C:\\AA\\CourseraDataScienceDataSets\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\features.txt",header=F,sep="")
head(features)
activity_labels<-read.table("C:\\AA\\CourseraDataScienceDataSets\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt",header=F,sep="")
head(activity_labels)
subject_train<-read.table("C:\\AA\\CourseraDataScienceDataSets\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt",header=F,sep="")
head(subject_train)
x_train<-read.table("C:\\AA\\CourseraDataScienceDataSets\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt",header=F,sep="")
head(X_train)
y_train<-read.table("C:\\AA\\CourseraDataScienceDataSets\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt",header=F,sep="")
head(y_train)

subject_test<-read.table("C:\\AA\\CourseraDataScienceDataSets\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt",header=F,sep="")
head(subject_test)
x_test<-read.table("C:\\AA\\CourseraDataScienceDataSets\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt",header=F,sep="")
head(x_test)
y_test<-read.table("C:\\AA\\CourseraDataScienceDataSets\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt",header=F,sep="")
head(y_test)

#Check if we have feature labels for all columns of train and test dataset "ncol(x_test)==nrow(features)"
ncol(x_test)
nrow(features)

#Assigning column names for train and test data

colnames(x_train) <- features$V2
colnames(x_test) <- features$V2

#Give column names to other data available so that it can be joined at a later stage properly
colnames(y_train) <- "Act.No"
colnames(y_test) <- "Act.No" 

colnames(subject_test) <- "Sub.No" 
colnames(subject_train) <- "Sub.No" 

# Create a single data frame by joining the x_test,y_test,subject_test data
Test.Data <- cbind(subject_test, y_test, x_test)
Train.Data <- cbind(subject_train, y_train, x_train)

#Merge both Training and Test Data
Complete.Data<-rbind(Train.Data,Test.Data)

#Find columns which have mean or std in their names

colnumbers<-grep("mean\\(\\)|std\\(\\)", names(Complete.Data))
colnumbers<-append(colnumbers,1:2,0)
Subset.Data<-Complete.Data[,c(colnumbers)]

#Meaningful Names
names(Subset.Data) <- gsub("-mean", "Mean", names(Subset.Data))
names(Subset.Data) <- gsub("-std", "StdDev", names(Subset.Data))
names(Subset.Data) <- gsub("\\(\\)", "", names(Subset.Data))

#Appropriately labels the data set with descriptive variable names.
colnames(activity_labels) <- c("Act.No", "Act.Name")
Final.Data <- merge(activity_labels, Subset.Data, by="Act.No", all=TRUE)
Tidy.Data<- subset(Final.Data, select = -c(1))

#Finding Mean
New.Data <- melt(Tidy.Data, id.vars=c(1,2), measure.vars=(names(Tidy.Data[3:68])) )
Tidy.Mean.Data <- dcast(New.Data, Act.Name + Sub.No ~variable, mean)