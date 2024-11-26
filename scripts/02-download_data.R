#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Tianrui Fu
# Date: 24 November 2024
# Contact: tianrui.fu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)


#### Download data ####
# source: https://open.toronto.ca/dataset/outbreaks-in-toronto-healthcare-institutions/
healthcare_ourbreak <-
  list_package_resources("outbreaks-in-toronto-healthcare-institutions") |>
  filter(name == "ob_report_2024.csv") |>
  get_resource()

#### Save data ####
write_csv(healthcare_ourbreak, "data/01-raw_data/pre_healthcare_outbreak.csv")
         
