# Machine Learning Course Project

This repository contains the data analysis and modeling code for the **Practical Machine Learning** course project. The goal is to classify the manner in which participants performed weightlifting exercises using accelerometer data from the belt, forearm, arm, and dumbbell.

## Contents

- **MachineRmarkdown.Rmd**  
  The R Markdown file containing the full analysis workflow:
  1. **Loading data** from provided URLs  
  2. **Cleaning and preprocessing** (removing NAs, dropping irrelevant columns)  
  3. **Splitting** into training and validation sets  
  4. **Model training** with a Random Forest, using cross-validation  
  5. **Evaluation** on a validation set (confusion matrix, accuracy)  
  6. **Final predictions** on the test data

- **MachineRmarkdown.html**  
  The knitted HTML document providing the same analysis in a readable, static format (no code execution needed to review).

- **final_predictions.csv**  
  CSV file containing the final predicted classes for the 20-row test dataset.

## How to Run / Reproduce

1. **Install R packages**: Make sure you have the following packages installed in R:
   ```r
   install.packages("caret")
   install.packages("randomForest")
   install.packages("ggplot2")

**How to Run / Reproduce**

1. Open **MachineRmarkdown.Rmd** in RStudio or another R environment.  
2. Knit the document (click the “Knit” button in RStudio) or run all chunks to replicate the analysis and generate the HTML output.  
3. *(Optional)* If you only want to run code in an interactive session:  
   - Set your working directory to the folder containing **MachineRmarkdown.Rmd**.  
   - Run each chunk in order by pressing the “Run” button or using **Ctrl+Enter** (on Windows).  

## Data Cleaning and Preprocessing

- **Missing Data**: Columns containing excessive `NA`s, empty strings, or `#DIV/0!` were removed.  
- **Irrelevant Columns**: The first 7 columns in the dataset were metadata (user names, timestamps, etc.) and were dropped.  
- **Target Variable**: The `classe` variable was converted to a factor for classification.

## Modeling Approach

A **Random Forest** algorithm was chosen for its strong performance on classification tasks:

- **Cross-Validation**: We used 5-fold cross-validation to estimate out-of-sample error.  
- **Train/Validation Split**: The training set was further split 75/25 to validate results.

## Results

- **Validation Accuracy**: The model achieved high accuracy (above 90%) on the validation set.  
- **Confusion Matrix**: Confusion matrix results showed strong performance across all 5 classes (A, B, C, D, and E).  
- **Out-of-Sample Error**: Our estimated out-of-sample error rate was low (1 - accuracy).

## Final Predictions

- We applied the trained Random Forest model to the provided test dataset of 20 observations.  
- The predicted classes (A, B, C, D, or E) are saved in **final_predictions.csv**.

## Conclusion

The Random Forest model successfully classified the weightlifting exercise manner with high accuracy. By removing irrelevant features and using cross-validation, we minimized overfitting and obtained a reliable estimate of future performance.

