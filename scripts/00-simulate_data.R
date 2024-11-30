#### Preamble ####
# Purpose: Simulate a dataset which include the address,type,Causative agent, outbreak setting, date and active.
# Author: Tianrui Fu
# Date: 24 November 2024
# Contact: tianrui.fu@mail.utoronto.ca
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
set.seed(853)


#### Simulate data ####
causative_agents <- c("COVID-19", "Rhinovirus", "Parainfluenza", "Coronavirus*")
seasons <- c("Winter", "Spring", "Summer", "Fall")
months <- 1:12
outbreak_settings <- c("LTCH", "Hospital-Chronic Care", "Hospital-Psychiatric", 
                       "Retirement Home", "Transitional Care")

simulated_data <- expand.grid(
  causative_agent_1 = causative_agents,
  season = seasons,
  month = months,
  outbreak_setting = outbreak_settings
) %>%
  filter(
    # Ensure months align with their respective seasons
    (season == "Winter" & month %in% c(12, 1, 2)) |
      (season == "Spring" & month %in% c(3, 4, 5)) |
      (season == "Summer" & month %in% c(6, 7, 8)) |
      (season == "Fall" & month %in% c(9, 10, 11))
  ) %>%
  sample_n(200) %>%
  mutate(
    # Randomly assign outbreak counts, with higher values for COVID-19 and LTCH
    outbreak_count = case_when(
      causative_agent_1 == "COVID-19" & outbreak_setting == "LTCH" ~ rpois(n(), lambda = 10),
      causative_agent_1 == "COVID-19" ~ rpois(n(), lambda = 7),
      outbreak_setting == "LTCH" ~ rpois(n(), lambda = 7),
      TRUE ~ rpois(n(), lambda = 3)
    )
  )


#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
