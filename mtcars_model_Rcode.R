# Function to print a horizontal line divider
print_divider <- function() {
  cat(rep("=", 80), "\n")
}

# Jeremiah Ochepo
# CSC 8015 Data Mining & Predictive Analytics Spring 2024
# Assignment #7 Data Streaming
# Principal Components Analysis - PCA

# Task 1: Load necessary libraries
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  install.packages("tidyverse")
  if (!requireNamespace("tidyverse", quietly = TRUE)) {
    print("Error: Installation of tidyverse failed.")
  } else {
    print("tidyverse has been installed successfully.")
  }
} else {
  print("tidyverse is already installed.")
}
print_divider()

# Function to perform an operation and handle errors
perform_operation <- function(operation_name, operation) {
  tryCatch({
    result <- operation()
    cat(operation_name, "was successful.\n")
    print(result)
    return(result)
  }, error = function(e) {
    cat(operation_name, "encountered an error:\n", conditionMessage(e), "\n")
    return(NULL)
  })
}
print_divider()

# Exploration

# Task 2: Load the mtcars dataset from a CSV file
mtcars <- perform_operation("Task 2: Loading the mtcars dataset", function() {
  read.csv("mtcars.csv", row.names = 1)
})
print_divider()

# Task 3: Print the first and last 6 rows
print_first_and_last_six_rows <- perform_operation("Task 3: Print the first and last 6 rows", function() {
  if (!is.null(mtcars)) {
    combined_rows <- rbind(head(mtcars), tail(mtcars))
    print(combined_rows)
  }
})
print_divider()

# Task 4: View the structure of mtcars
view_structure_mtcars <- perform_operation("Task 4: View the structure of mtcars", function() {
  if (!is.null(mtcars)) {
    glimpse(mtcars)
  }
})
print_divider()

# Task 5: Summary statistics of mtcars
summary_statistics_mtcars <- perform_operation("Task 5: Summary statistics of mtcars", function() {
  if (!is.null(mtcars)) {
    summary(mtcars)
  }
})
print_divider()

# Task 6: Names of columns
names_columns_mtcars <- perform_operation("Task 6: Names of columns", function() {
  if (!is.null(mtcars)) {
    colnames(mtcars)
  }
})
print_divider()

# Task 7: Names of rows
names_rows_mtcars <- perform_operation("Task 7: Names of rows", function() {
  if (!is.null(mtcars)) {
    rownames(mtcars)
  }
})
print_divider()

# Task 8: Quantiles of the wt variable
quantiles_wt <- perform_operation("Task 8: Calculating quantiles of the wt variable", function() {
  quantile(mtcars$wt)
})
print_divider()

# Task 9: Variance of the wt variable
variance_wt <- perform_operation("Task 9: Calculating variance of the wt variable", function() {
  var(mtcars$wt)
})
print_divider()

# Task 10: Histogram of the hp variable
hist_hp <- perform_operation("Task 10: Creating histogram of the hp variable", function() {
  hist(mtcars$hp)
})
print_divider()

# Task 11: Number of columns and rows in mtcars
num_cols <- perform_operation("Task 11: Calculating number of columns", function() {
  ncol(mtcars)
})
num_rows <- perform_operation("Task 11: Calculating number of rows", function() {
  nrow(mtcars)
})
print_divider()

# Visualization

# Task 12: Perform Principal Components Analysis (PCA) using the correlation matrix
pca <- perform_operation("Task 12: Principal Components Analysis (PCA)", function() {
  prcomp(mtcars, scale. = TRUE)
})
print_divider()

# Task 13: Identify variables with the strongest relation to mileage (mpg)
if (!is.null(pca)) {
  loadings <- pca$rotation[, 1]
  strongest_variables <- perform_operation("Task 13: Identifying variables with the strongest relation to mileage (mpg)", function() {
    names(sort(abs(loadings), decreasing = TRUE)[1:3])
  })
  print(strongest_variables)
}
print_divider()

# Task 14: Check for Mercedes cars in the dataset
mercedes <- perform_operation("Task 14: Checking for Mercedes cars in the dataset", function() {
  mtcars[grep("Merc", rownames(mtcars)), ]
})
if (nrow(mercedes) == 0) {
  message("No Mercedes cars were found in the dataset.")
} else {
  print(mercedes)
}
print_divider()

# Task 15: Identify sports cars based on horsepower and weight criteria
sports_cars <- perform_operation("Task 15: Identifying sports cars based on horsepower and weight criteria", function() {
  mtcars[mtcars$hp > 200 & mtcars$wt < 3, ]
})
if (nrow(sports_cars) == 0) {
  message("No sports cars were found in the dataset based on the criteria of horsepower greater than 200 and weight less than 3.")
} else {
  print(sports_cars)
}
print_divider()

# Task 16: Identify cars with good mileage (mpg > 20)
good_mileage_cars <- perform_operation("Task 16: Identifying cars with good mileage (mpg > 20)", function() {
  mtcars[mtcars$mpg > 20, ]
})
if (nrow(good_mileage_cars) == 0) {
  message("No cars with good mileage (mpg > 20) were found in the dataset.")
} else {
  print(good_mileage_cars)
}
print_divider()

# Task 17: Define characteristics of a hypothetical car
car <- data.frame(cyl = 6, disp = 425, hp = 200, drat = 3.75, wt = 2, qsec = 16.5, vs = 0, am = 1, gear = 4, carb = 1)
message("Characteristics of the hypothetical car have been defined.")
print_divider()

# Task 18: Get the maximum and minimum values of mtcars
maxs <- apply(mtcars, 2, max)
mins <- apply(mtcars, 2, min)
maxs <- maxs[seq_along(car)]
mins <- mins[seq_along(car)]
message("Maximum and minimum values of mtcars have been obtained.")
print_divider()

# Task 19: Scale the characteristics of the hypothetical car
scaled_car <- perform_operation("Task 19: Scaling the characteristics of the hypothetical car", function() {
  scaled <- scale(car, center = mins, scale = maxs - mins)
  if (any(is.na(scaled))) {
    message("NaN values detected in scaled car object.")
    return(NULL)
  } else {
    message("Scaling of characteristics successful.")
    return(scaled)
  }
})
print(scaled_car)
print_divider()

# Task 20: Check for NaN values in the scaled_car object
if (!is.null(scaled_car)) {
  if (any(is.na(scaled_car))) {
    message("NaN values detected in scaled car object.")
  } else {
    message("No NaN values detected in scaled car object.")
  }
}
print_divider()

# Task 21: Check the dimensions of scaled_car and pca$rotation[, 1:2]
dim_scaled_car <- perform_operation("Task 21: Checking the dimensions of scaled_car", function() {
  dim(scaled_car)
})
if (!is.null(dim_scaled_car)) {
  message("Dimensions of scaled_car retrieved successfully.")
  print(dim_scaled_car)
} else {
  message("Failed to retrieve dimensions of scaled_car.")
}
dim_pca_rotation <- perform_operation("Task 21: Checking the dimensions of pca$rotation[, 1:2]", function() {
  dim(pca$rotation[, 1:2])
})
if (!is.null(dim_pca_rotation)) {
  message("Dimensions of pca$rotation[, 1:2] retrieved successfully.")
  print(dim_pca_rotation)
} else {
  message("Failed to retrieve dimensions of pca$rotation[, 1:2].")
}
print_divider()

# Data Preprocessing

# Task 22: Ensure the dimensions of the matrices are correct for multiplication
if (!is.null(dim_scaled_car) && !is.null(dim_pca_rotation)) {
  if (dim_scaled_car[2] != dim_pca_rotation[1]) {
    cat("Error: Incompatible dimensions for matrix multiplication.\n")
  } else {
    transposed_scaled_car <- t(scaled_car)
    pca_components <- pca$rotation[, 1:2]
    if (!is.null(transposed_scaled_car) && !is.null(pca_components)) {
      if (any(is.na(transposed_scaled_car)) || any(is.na(pca_components))) {
        print("NaN values detected in matrices.")
      } else {
        scores <- perform_operation("Task 23: Performing matrix multiplication", function() {
          pca_components %*% transposed_scaled_car
        })
        if (!is.null(scores)) {
          message("Matrix multiplication successful.")
          print(scores)
          dim_scores <- dim(scores)
          cat("Dimensions of scores:", dim_scores[1], "x", dim_scores[2], "\n")
        } else {
          message("Matrix multiplication failed.")
        }
      }
    }
  }
}
print_divider()

# Analysis

# Task 25: Fit a linear regression model to predict mileage (mpg)
model <- perform_operation("Task 25: Fitting a linear regression model", function() {
  lm(mpg ~ ., data = mtcars)
})
if (!is.null(model)) {
  message("Linear regression model fitting successful.")
  print(model)
} else {
  message("Linear regression model fitting failed.")
}
print_divider()

# Task 26: Evaluate the fit of the regression model
if (!is.null(model)) {
  summary(model)
}
print_divider()

# Model Fitting

# Task 27: Save the code to an R file
# writeLines(capture.output({
#   cat("# Load necessary libraries\n")
#   cat("library(tidyverse)\n\n")
#   cat("# Load the mtcars dataset from a CSV file\n")
#   cat("mtcars <- read.csv(\"mtcars.csv\", row.names = 1)\n\n")
#   # Insert the rest of the code here
# }), "JeremiahOchepo_Assignment7_analysis_code.R")
