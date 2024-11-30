#### Preamble ####
# Purpose: Model the cleaned dataset and choose one from them
# Author: Tianrui Fu
# Date: 26 November 2024
# Contact: tianrui.fu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(ggplot2)

#### Read data ####
count_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

### Model data ####
# Use Poisson Model
library(dplyr)



# Poisson Model creation
poisson_model <- glm(outbreak_count ~ causative_agent_1 + season, 
                     family = poisson(link = "log"), 
                     data = count_data)
summary(poisson_model)

# Test the dispersion
library(AER)
dispersiontest(poisson_model)

# Create the new poisson model 
poisson_model_updated <- glm(outbreak_count ~ causative_agent_1 + outbreak_setting, 
                             family = poisson(link = "log"), 
                             data = count_data)
summary(poisson_model_updated)

poisson_model_outbreak_season <- glm(outbreak_count ~ causative_agent_1 + season + outbreak_setting, 
                          family = poisson(link = "log"), 
                          data = count_data)
summary(poisson_model_outbreak_season)

poisson_model_outbreak_month <- glm(outbreak_count ~ causative_agent_1 + month + outbreak_setting, 
                              family = poisson(link = "log"), 
                              data = count_data)
summary(poisson_model_outbreak_month)

# Create the interaction poisson model
poisson_interaction_month_model <- glm(outbreak_count ~ causative_agent_1 * month + outbreak_setting, 
                                 family = poisson(link = "log"), 
                                 data = count_data)
summary(poisson_interaction_month_model)

poisson_season_time <- glm(outbreak_count ~ causative_agent_1 + month * season + outbreak_setting, 
                           family = poisson(link = "log"), data = count_data)
summary(poisson_season_time)

poisson_interaction_season_model <- glm(outbreak_count ~ causative_agent_1 * season + outbreak_setting, 
                                 family = poisson(link = "log"), 
                                 data = count_data)
summary(poisson_interaction_season_model)

poisson_final <- glm(outbreak_count ~ causative_agent_1 * season + month + outbreak_setting, 
                           family = poisson(link = "log"), data = count_data)
summary(poisson_final)

# Choose the final model and plot the interaction poisson model 
count_data$predicted <- predict(poisson_season_time, type = "response")

ggplot(count_data, aes(x = month, y = predicted, color = causative_agent_1)) +
  geom_line() +
  facet_wrap(~ causative_agent_1, scales = "free_y") +
  labs(title = "Predicted Outbreak Frequency by Pathogen and Month",
       x = "Month", y = "Predicted Outbreak Count") +
  geom_smooth(method = "loess", se = FALSE)





#### Save model ####
saveRDS(
  poisson_model,
  file = "models/poisson_model.rds"
)

saveRDS(
  poisson_model_updated,
  file = "models/poisson_model_updated.rds"
)

saveRDS(
  poisson_model_outbreak_month,
  file = "models/poisson_model_outbreak_month.rds"
)

saveRDS(
  poisson_model_outbreak_season,
  file = "models/poisson_model_outbreak_season.rds"
)

saveRDS(
  poisson_interaction_month_model,
  file = "models/poisson_interaction_month_model.rds"
)

saveRDS(
  poisson_season_time,
  file = "models/poisson_season_time.rds"
)

saveRDS(
  poisson_interaction_season_model,
  file = "models/poisson_interaction_season_model.rds"
)