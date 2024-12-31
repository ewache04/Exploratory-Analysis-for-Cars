# README: Principal Components Analysis and Linear Regression on the `mtcars` Dataset

## Project Overview

This project is an advanced analysis of the `mtcars` dataset, focusing on Principal Components Analysis (PCA) and linear regression modeling. The project highlights key data exploration, preprocessing, and visualization steps, along with predictive modeling to extract insights and patterns from the dataset. The comprehensive workflow demonstrates my proficiency in data analytics, visualization, and machine learning.

---

## Features

### 1. **Data Exploration**
- **Dataset:** The analysis begins by loading the `mtcars` dataset, inspecting its structure, and summarizing the data.
- **Key Tasks:**
  - Display the first and last six rows of the dataset.
  - View dataset structure and summary statistics.
  - Identify columns and rows, calculate quantiles, and variance of specific variables.

### 2. **Visualization**
- **Histogram of Horsepower (hp):**
  - A histogram visualizes the distribution of horsepower among the cars in the dataset.
  - **Screenshot:** `screenshots/histogram-of-mtcars.png`

- **Principal Components Analysis (PCA):**
  - PCA reduces the dimensionality of the dataset, revealing relationships among variables.
  - Analyzed loadings to determine the strongest contributors to mileage (mpg).

### 3. **Data Preprocessing**
- Scaled a hypothetical car's features for inclusion in the PCA model.
- Checked and ensured matrix dimensions for compatibility with PCA transformations.

### 4. **Predictive Modeling**
- Built a linear regression model to predict mileage (`mpg`) based on other variables in the dataset.
- Evaluated the regression model for fit and significance of predictors.

---

## Key Tasks and Outcomes

1. **Principal Components Analysis (PCA):**
   - Extracted components to explain the variance in the dataset.
   - Identified the strongest variables contributing to mileage (mpg), such as `wt` (weight) and `hp` (horsepower).

2. **Linear Regression Model:**
   - Built a regression model to predict `mpg` using all other variables.
   - Evaluated the model's performance using summary statistics.

3. **Exploratory Insights:**
   - Determined sports cars (hp > 200 and wt < 3) and cars with good mileage (mpg > 20).
   - Analyzed relationships between key variables to recommend optimizations.

4. **Custom Analysis:**
   - Defined and scaled characteristics of a hypothetical car to assess its performance in PCA.

---

## Project Artifacts

### 1. **Screenshots**
- Histogram of `hp` distribution: `screenshots/histogram-of-mtcars.png`
- PCA visualizations: Detailed in `mtcars_analysis.pdf`

### 2. **Files**
- `mtcars.csv`: Dataset used for analysis.
- `mtcars_analysis.pdf`: Comprehensive report of the analysis, including visualizations.
- `mtcars_model_Rcode.R`: Script containing the complete R code used in the analysis.

---

## Usage Instructions

### Requirements
- R or RStudio installed on your system.
- Required packages: `tidyverse`, `cluster`.

### Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/mtcars-pca-analysis.git
   cd mtcars-pca-analysis
   ```

2. Open and execute the provided R script:
   ```bash
   Rscript mtcars_model_Rcode.R
   ```

3. View the analysis and visualizations in `mtcars_analysis.pdf`.

---

## Insights for USCIS Petition

This project demonstrates my advanced proficiency in data analysis, visualization, and predictive modeling. By employing PCA and regression techniques, I showcased a robust understanding of statistical methods and their applications to real-world datasets. This technical expertise aligns directly with my proposed initiative to leverage machine learning for solving complex societal problems.

---

## Contact Information
**Author:** Jeremiah Ochepo  
**Email:** [jochepo4growth@gmail.com](mailto:jochepo4growth@gmail.com)  
**GitHub Repository:** [mtcars PCA Analysis](https://github.com/your-username/mtcars-pca-analysis)  