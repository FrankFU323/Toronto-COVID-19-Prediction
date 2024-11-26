#### Preamble ####
# Purpose: Clean the data which downloaded from Open Data Toronto.
# Author: Tianrui Fu
# Date: 24 November 2024
# Contact: tianrui.fu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The data has been downloaded.
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(arrow)
library(janitor)
#### Clean data ####
raw_data <- read_csv("data/01-raw_data/pre_healthcare_outbreak.csv")

cleaned_data <- raw_data |>
  janitor::clean_names() |>
  select(institution_address, outbreak_setting, type_of_outbreak, causative_agent_1, date_outbreak_began, active) |>
  drop_na() |>
  distinct() |>
  filter(
    causative_agent_1 %in% c(
      "COVID-19", "Coronavirus*", "Rhinovirus", "Parainfluenza"
    )
  ) |>
  mutate(
    institution_address = as.factor(institution_address),
    outbreak_setting = as.factor(outbreak_setting),
    type_of_outbreak = as.factor(type_of_outbreak),
    causative_agent_1 = as.factor(causative_agent_1),
    active = as.factor(active),
    date_outbreak_began = as.Date(date_outbreak_began)
  )

# Count for each causative agent
causative_counts <- cleaned_data |>
  group_by(causative_agent_1) |>
  summarise(count = n()) |>
  ungroup()

# Merge the two dataset
cleaned_data <- cleaned_data |>
  left_join(causative_counts, by = "causative_agent_1")


#### Save data ####
write_parquet(x = cleaned_data, sink = "data/02-analysis_data/analysis_data_cleaned.parquet")


