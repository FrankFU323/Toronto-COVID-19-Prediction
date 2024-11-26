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

simulation_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Name list

# Address names
addresses <- c(
  "Morgan Dr", "55 Ameer Ave", "25 Brunswick Ave", "155 Millwood Rd", 
  "2920 Lawrence Ave E", "3275 St Clair Ave E", "40 Playfair Ave",
  "2111 Finch Ave W", "160 Wellesley St E", "3015 Lawrence Ave E", 
  "2701 St Claire Ave E", "2005 Lawrence Ave W", "2045 Finch Ave W",
  "150 Kilgour Rd", "77 Main St", "4005 Eglinton Ave W", "520 Markham Rd",
  "200 Church St", "305 Billiol St", "2245 Lawrence Ave W", "92 Island Rd",
  "225 St George St", "59 Lawson Rd", "610 University Ave", "2 Buchan Crt",
  "351 Christie St", "2881 Eglinton Ave", "130 Dunn Ave", "30 The Queensway",
  "1340 York Mills Rd", "140 Sherway Dr", "3595 Keele St", "866 Sheppard Ave W",
  "9 Neilson Road", "150 Dunn Ave", "3276 St. Clair Ave E", "265 Queens Dr",
  "30 Bond St", "3197 Lakeshore Blvd", "82 Buttonwood Ave", "5 Resurrection Rd",
  "541 Finch Ave W", "8 The Donway E", "2701 St. Clair Ave E", "1000 Ellesmere Rd",
  "345 Sherbourne St", "123 Spadina Rd", "537 Finch Ave W", "130 Midland Ave",
  "4 Teddington Park Ave", "2920 Lawrence Ave W", "101 Humber College Blvd",
  "740 Pape Ave", "22 Norfinch Dr", "60 Guildwood Pky", "1 Northwestern Ave",
  "825 Coxwell Ave", "45 Brunswick Ave", "600 University Ave", "3197 Lakeshore Blvd W",
  "3760 Sheppard Ave E", "221 Milner Ave", "82 Buttowood Ave", "1800 O'Connor Dr",
  "4001 Leslie St", "1 Overlea Dr", "3758 Sheppard Ave E", "2075 Bayview Ave",
  "400 The West Mall", "2100 Bloor St W", "33 Christie St", "19 Rean Dr",
  "3555 Danforth Ave", "35 Elm Grove Ave", "4650 Eglinton Ave W", "2233 Kipling Ave",
  "303 Queens Dr", "2311 McNicoll Ave", "1 Kenton Dr", "1020 McNicoll Ave",
  "767 Royal York Rd", "4001 Leslie Mall", "36 D'Arcy St", "340 McCowan Rd",
  "300 Silver Star Blvd", "1035 Eglinton Ave W", "15 Barberry Pl", "102 Craiglee Dr",
  "720 Mt. Pleasant Rd", "148 Markham Rd", "450 Rustic Rd", "5935 Bathurst St",
  "1235 Wilson Ave", "645 Castlefield Ave", "555 Finch Ave W", "200 Dawes Rd",
  "707 Ellesmere Rd", "66 Roncesvalles Ave", "8 The Donway", "2411 Lawrence Ave E",
  "187 Wynford Dr", "40 Playfiar Ave", "65 Livingstone Rd", "52 Neilson Dr",
  "5 Resurrection Dr", "1 Overland Dr", "500 Kingston Rd", "4180 Dundas St W",
  "215 Tyrrel Ave", "225 St. George St", "262 St. Clair Ave W", "2025 Finch Ave W",
  "1 Kenton Pl", "305 Cummer Ave", "1145 Albion Rd", "150 Emmett Ave",
  "2 Green Belt Dr", "551 Collins Rd", "60 Richview Rd", "2111 Buchan Crt",
  "3830 Lawren Ave E", "10 Senlac Rd", "2 O'Connor Dr", "495 The West Mall",
  "2005 Lawrence Ave", "61 Fairfox Cres", "2111 Finch Ave", "180 Sheridan Ave",
  "550 Cummer Ave", "306 Finch Ave E", "2245 Lawrence Ave West", "3760 Sheppard Ave East",
  "140 Sherway Drive", "200 Elizabeth St", "138 Dowling Ave", "14 Cross St",
  "5351 Yonge St", "3050 Lawrence Ave E", "52 Neilson Drive", "1925 Steeles Ave",
  "150 Sherway Drive", "1140 Bloor St W", "305 Balliol St", "40 Bell Estate Rd",
  "3276 St. Clair Ave East", "5 Resurection Rd", "1020 Mcnicoll Ave", "60 Scoffield Dr",
  "1001 Queen St West", "2121 Kingston Rd", "600 Melita Cres", "40 Old Kingston Rd",
  "306 Finch Ave", "14 William Morgan Dr", "2601 Bayview Ave", "1925 Rean Dr",
  "420 The East Mall", "551 Conlins Rd", "1800 O'Connor Drive", "84 Davisville Ave",
  "3276 St Clair Ave E", "34 Middleport Cres", "65 Livingston Rd", "22 Norfinch Drive",
  "95 Humber College Blvd", "4650 Eglinton Ave West", "718 Sheppard Ave", "111 Avenue Rd",
  "3030 Birchmount Rd", "650 Church St", "700 & 720 Mount Pleasant Rd", "1066 Ave Rd",
  "111 Ave Rd", "4251 Dundas St W", "1-3 Kenton Dr", "685 Finch Ave W", "147 Elder St",
  "2311 Mcnicoll Ave"
)

# Outbreak setting names
outbreak_setting <- c(
  "LTCH", "Retirement Home", "Hospital-Acute Care", 
  "Hospital-Chronic Care", "Hospital-Psychiatric", "Transitional Care"
)

# Type names 
type_of_outbreak <- c("Respiratory", "Enteric", "Other")

# Causative agent names
causative_agent_1 <- c(
  "COVID-19", "Coronavirus*", "Rhinovirus", "Parainfluenza"
)

# Test if the data was successfully loaded
if (exists("simulation_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 200 rows
if (nrow(simulation_data) == 200) {
  message("Test Passed: The dataset has 200 rows.")
} else {
  stop("Test Failed: The dataset does not have 200 rows.")
}

# Check if the dataset has 6 columns
if (ncol(simulation_data) == 6) {
  message("Test Passed: The dataset has 6 columns.")
} else {
  stop("Test Failed: The dataset does not have 6 columns.")
}

# Check if the 'institution_address' column contains only valid address names.
if (all(simulation_data$institution_address %in% addresses)) {
  message("Test Passed: The 'institution_address' column contains only valid address names.")
} else {
  stop("Test Failed: The 'institution_address' column contains invalid address names.")
}

# Check if the 'outbreak_setting' column contains only valid outbreak setting names
if (all(simulation_data$outbreak_setting %in% outbreak_setting)) {
  message("Test Passed: The 'outbreak_setting' column contains only valid outbreak setting names.")
} else {
  stop("Test Failed: The 'outbreak_setting' column contains invalid outbreak setting names.")
}

# Check if the 'type_of_outbreak' column contains only valid type names
if (all(simulation_data$type_of_outbreak %in% type_of_outbreak)) {
  message("Test Passed: The 'type_of_outbreak' column contains only valid type names.")
} else {
  stop("Test Failed: The 'type_of_outbreak' column contains invalid type names.")
}

# Check if the 'causative_agent_1' column contains only valid causative names
if (all(simulation_data$causative_agent_1 %in% causative_agent_1)) {
  message("Test Passed: The 'causative_agent_1' column contains only valid causative names.")
} else {
  stop("Test Failed: The 'causative_agent_1' column contains invalid caustive names.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(simulation_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'institution_address', 'outbreak_setting', 'type_of_outbreak' & 'causative_agent_1' columns
if (all(simulation_data$institution_address != "" & simulation_data$outbreak_setting
        != "" & simulation_data$type_of_outbreak != "" & simulation_data$causative_agent_1 != "")) {
  message("Test Passed: There are no empty strings.")
} else {
  stop("Test Failed: There are empty strings in one or more columns.")
}

# Check if the began date is in 2024
if (all(format(as.Date(simulation_data$date_outbreak_began), "%Y") == "2024")) {
  message("Test Passed: All 'date_outbreak_began' values are in the year 2024.")
} else {
  stop("Test Failed: Some 'date_outbreak_began' values are not in the year 2024.")
}

if (all(simulation_data$active %in% c("Y", "N"))) {
  message("Test Passed: All 'active' values are either 'Y' or 'N'.")
} else {
  stop("Test Failed: Some 'active' values are not 'Y' or 'N'.")
}
