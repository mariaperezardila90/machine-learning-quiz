install.packages("caret")
library(caret)
library(randomForest)
library(ggplot2)

# Load the data
train_url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
test_url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

train_data <- read.csv(train_url, na.strings=c("NA","","#DIV/0!"))
test_data <- read.csv(test_url, na.strings=c("NA","","#DIV/0!"))

# Data Cleaning: Remove near-zero variance variables and those with too many NAs
train_data <- train_data[, colSums(is.na(train_data)) == 0]
test_data <- test_data[, colSums(is.na(test_data)) == 0]

# Remove irrelevant columns (identifiers)
train_data <- train_data[, -c(1:7)]
test_data <- test_data[, -c(1:7)]

# Convert classe (target variable) into a factor
train_data$classe <- as.factor(train_data$classe)

# Split training data into train (75%) and validation (25%) sets
set.seed(123)
inTrain <- createDataPartition(train_data$classe, p = 0.75, list = FALSE)
training <- train_data[inTrain, ]
validation <- train_data[-inTrain, ]

# Train a Random Forest model
set.seed(123)
rf_model <- train(classe ~ ., data = training, method = "rf",
                  trControl = trainControl(method = "cv", number = 5))

# Model Summary
print(rf_model)

# Predictions on validation set
val_preds <- predict(rf_model, validation)

# Evaluate model performance
conf_matrix <- confusionMatrix(val_preds, validation$classe)
print(conf_matrix)

# Make predictions on the test set
final_predictions <- predict(rf_model, test_data)

# Print final predictions
print(final_predictions)

# Define the directory where you want to save the file
output_dir <- "C:/Users/maria/OneDrive/Escritorio/R/Hopkins/Practical machine learning"

# Save predictions to a file in the specified directory
write.csv(final_predictions, file = paste0(output_dir, "/final_predictions.csv"), row.names = FALSE)
