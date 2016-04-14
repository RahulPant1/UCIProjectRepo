#### CODEBOOK ###
This CodeBook describes the variables, the data, and any transformations that was performed to clean up  the source data to create 
a tidy dataset as per requirements.

#### About the Data ###
Human Activity Recognition Using Smartphones Data Set 
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.  
Each person performed six activities `(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)` wearing   
a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial   
linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.   
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned   
into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.   

#### Information Available ###


####  The dataset includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

#### DATA EXPLORATION ###

##### Test Dataset
- xTest.txt: 2947 rows of 561 measurement variables. These are measurement variables listed in features.txt
- yTest.txt: 2947 rows of 1 variables. This is the activity Identifier
- subjectTest.txt: 2497 rows of 1 variable (subject Identifier)

##### Training Dataset
- xTrain.txt: 7352 rows of 561 measurement variables. These are measurement variables listed in features.txt
- yTrain.txt: 7352 rows of 1 variables. This is the activity Identifier
- subjectTrain.txt: 7352 rows of 1 variable (subject Identifier)

 
##### Script Explained

- Import test and train datsets and merge them appropriately
- Extracts data which relates to Mean and Standard Deviation
- Imporves the labels
- Add Activity Names for Activity Numbers
- Find Mean of each measurement of a variable for each activity and each subject
- Finally write this dataset as Tidy.Mean.Data

#### Merge Activities

- subject_test, y_test, x_test were column bind using cbind function to create Test.Data data frame which added "Sub.No", "Act.No" to dataset making it 563 column data.frame with 2947 rows
- subject_train, y_train, x_train were column bind using cbind function to create Train.Data data.frame which added "Sub.No", "Act.No" to dataset making it 563 column data.frame with 7352 rows
