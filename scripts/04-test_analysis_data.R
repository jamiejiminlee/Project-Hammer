#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 26 September 2024 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Download data ####
price_analysis_data <- read_csv("/Users/jamielee/Downloads/price_analysis.csv")

#### Testing Data Integrity ####

# Test if required columns are present
test_that("Required columns are present", {
  required_columns <- c("nowtime", "product_id", "current_price", "old_price", "product_name", "vendor")
  expect_true(all(required_columns %in% colnames(price_analysis_data)))
})

# Test if columns have correct data types
test_that("Columns have correct data types", {
  # Adjust types based on observed data types
  expect_s3_class(price_analysis_data$nowtime, "POSIXct") # POSIXct datetime
  expect_type(price_analysis_data$product_id, "double")
  expect_type(price_analysis_data$current_price, "double")
  expect_type(price_analysis_data$old_price, "character") # Adjusted to character
  expect_type(price_analysis_data$product_name, "character")
  expect_type(price_analysis_data$vendor, "character")
})

# Test for missing values in essential columns
test_that("No missing values in essential columns", {
  essential_columns <- price_analysis_data %>%
    select(nowtime, product_id, current_price, old_price, product_name, vendor)
  expect_true(all(!is.na(essential_columns)))
})



# Test for non-negative prices
test_that("Prices are non-negative", {
  expect_true(all(price_analysis_data$current_price >= 0, na.rm = TRUE))
  # Convert old_price to numeric for testing, as it’s currently character
  old_price_numeric <- as.numeric(price_analysis_data$old_price)
  expect_true(all(old_price_numeric >= 0, na.rm = TRUE))
})

# Test if 'nowtime' column has a valid date format
test_that("nowtime column has valid datetime format", {
  expect_true(all(!is.na(price_analysis_data$nowtime)))
})
