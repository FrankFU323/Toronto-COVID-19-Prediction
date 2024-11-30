#### Preamble ####
# Purpose: Tests the structure and validity of the simulated data.
# Author: Tianrui Fu
# Date: 24 November 2024
# Contact: tianrui.fu@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)

simulated_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Name list
# Test if the dataset was successfully loaded
if (exists("simulated_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Check if the dataset has 200 rows
if (nrow(simulated_data) == 200) {
  message("Test Passed: The dataset has 200 rows.")
} else {
  stop("Test Failed: The dataset does not have 200 rows.")
}

# Check if the dataset has 5 columns
if (ncol(simulated_data) == 5) {
  message("Test Passed: The dataset has 5 columns.")
} else {
  stop("Test Failed: The dataset does not have 5 columns.")
}

# Check if the 'outbreak_setting' column contains only valid outbreak setting names
valid_outbreak_settings <- c("LTCH", "Hospital-Chronic Care", "Hospital-Psychiatric", 
                             "Retirement Home", "Transitional Care")
if (all(simulated_data$outbreak_setting %in% valid_outbreak_settings)) {
  message("Test Passed: The 'outbreak_setting' column contains only valid outbreak setting names.")
} else {
  stop("Test Failed: The 'outbreak_setting' column contains invalid outbreak setting names.")
}

# Check if the 'causative_agent_1' column contains only valid causative agent names
valid_causative_agents <- c("COVID-19", "Rhinovirus", "Parainfluenza", "Coronavirus*")
if (all(simulated_data$causative_agent_1 %in% valid_causative_agents)) {
  message("Test Passed: The 'causative_agent_1' column contains only valid causative agent names.")
} else {
  stop("Test Failed: The 'causative_agent_1' column contains invalid causative agent names.")
}

# Check if the 'season' column contains only valid season names
valid_seasons <- c("Winter", "Spring", "Summer", "Fall")
if (all(simulated_data$season %in% valid_seasons)) {
  message("Test Passed: The 'season' column contains only valid season names.")
} else {
  stop("Test Failed: The 'season' column contains invalid season names.")
}

# Check if the 'month' column contains values between 1 and 12
if (all(simulated_data$month >= 1 & simulated_data$month <= 12)) {
  message("Test Passed: The 'month' column contains valid month values (1-12).")
} else {
  stop("Test Failed: The 'month' column contains invalid month values.")
}

# Check if the outbreak counts are non-negative integers
if (all(simulated_data$outbreak_count >= 0 & simulated_data$outbreak_count == round(simulated_data$outbreak_count))) {
  message("Test Passed: The 'outbreak_count' column contains non-negative integer values.")
} else {
  stop("Test Failed: The 'outbreak_count' column contains invalid values.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(simulated_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if all string columns have no empty strings
if (all(simulated_data$causative_agent_1 != "" &
        simulated_data$outbreak_setting != "" &
        simulated_data$season != "")) {
  message("Test Passed: There are no empty strings in the dataset.")
} else {
  stop("Test Failed: There are empty strings in one or more columns.")
}


