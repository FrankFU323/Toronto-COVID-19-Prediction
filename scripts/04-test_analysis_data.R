#### Preamble ####
# Purpose: Tests the cleaned data
# Author: Tianrui Fu
# Date: 24 November 2024
# Contact: tianrui.fu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The data has been cleaned.
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)
library(arrow)

data <- read_parquet("data/02-analysis_data/analysis_data_cleaned.parquet")

#### Test data ####
# Test if the data was successfully loaded
if (exists("data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if `count_data` has rows
if (nrow(count_data) > 0) {
  message("Test Passed: The grouped dataset `count_data` has rows.")
} else {
  stop("Test Failed: The grouped dataset `count_data` has no rows.")
}

# Check if `count_data` has the expected 5 columns
if (ncol(count_data) == 5) {
  message("Test Passed: The grouped dataset `count_data` has 5 columns.")
} else {
  stop("Test Failed: The grouped dataset `count_data` does not have 5 columns.")
}

# Check if the `outbreak_count` column contains non-negative integers
if (all(count_data$outbreak_count >= 0 & count_data$outbreak_count == round(count_data$outbreak_count))) {
  message("Test Passed: The `outbreak_count` column contains valid non-negative integers.")
} else {
  stop("Test Failed: The `outbreak_count` column contains invalid values.")
}

# Check if the `season` column contains only valid seasons
valid_seasons <- c("Winter", "Spring", "Summer", "Fall")
if (all(count_data$season %in% valid_seasons)) {
  message("Test Passed: The `season` column contains only valid season names.")
} else {
  stop("Test Failed: The `season` column contains invalid season names.")
}

# Check if the `month` column contains valid month values (1–12)
if (all(count_data$month >= 1 & count_data$month <= 12)) {
  message("Test Passed: The `month` column contains valid month values (1–12).")
} else {
  stop("Test Failed: The `month` column contains invalid month values.")
}

valid_outbreak_settings <- c("LTCH", "Hospital-Chronic Care", "Hospital-Psychiatric", 
                             "Retirement Home", "Transitional Care")
if (all(data$outbreak_setting %in% valid_outbreak_settings)) {
  message("Test Passed: The 'outbreak_setting' column contains only valid outbreak setting names.")
} else {
  stop("Test Failed: The 'outbreak_setting' column contains invalid outbreak setting names.")
}

# Check if the 'causative_agent_1' column contains only valid causative agent names
valid_causative_agents <- c("COVID-19", "Rhinovirus", "Parainfluenza", "Coronavirus*")
if (all(data$causative_agent_1 %in% valid_causative_agents)) {
  message("Test Passed: The 'causative_agent_1' column contains only valid causative agent names.")
} else {
  stop("Test Failed: The 'causative_agent_1' column contains invalid causative agent names.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if all string columns have no empty strings
if (all(data$causative_agent_1 != "" &
        data$outbreak_setting != "" &
        data$season != "")) {
  message("Test Passed: There are no empty strings in the dataset.")
} else {
  stop("Test Failed: There are empty strings in one or more columns.")
}

