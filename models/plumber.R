library(plumber)
library(rstanarm)
library(tidyverse)

# Load the model
model <- readRDS("poisson_season_time.rds")

# Define the model version
version_number <- "0.0.1"

# Define the variables
variables <- list(
  causative_agent_1 = "The causative agent responsible for the outbreak. Options include: COVID-19, Rhinovirus, Parainfluenza, and Coronavirus.",
  month = "The numeric representation of the month (1 for January to 12 for December).",
  season = "The season of the year. Options are: Spring, Summer, Autumn, and Winter.",
  outbreak_setting = "The specific environments where outbreaks occur. Includes: LTCH, Retirement Home, Hospital-Acute Care, Hospital-Chronic Care, Hospital-Psychiatric, and Transitional Care."
)

#* @param causative_agent_1 The causative agent (e.g., COVID-19, Rhinovirus, Parainfluenza, or Coronavirus).
#* @param season The season of the year (e.g., Spring, Summer, Autumn, or Winter).
#* @param month The numeric month of the year (1 to 12).
#* @param outbreak_setting The specific environment where outbreaks occur (e.g., LTCH, Retirement Home, Hospital-Acute Care, Hospital-Chronic Care, Hospital-Psychiatric and Transitional Care.).
#* @get /predict_outbreak_count
predict_outbreak_count <- function(causative_agent_1 = "COVID-19"
                                   , outbreak_setting = "LTCH", month = 11, season = "Summer") {
  # Convert inputs to appropriate types
  causative_agent_1 <- as.character(causative_agent_1)
  outbreak_setting <- as.character(outbreak_setting)
  month <- as.integer(month)
  season <- as.character(season)
  
  # Prepare the payload as a data frame
  payload <- data.frame(
    causative_agent_1 = causative_agent_1,
    season = season,
    month = month,
    outbreak_setting = outbreak_setting
  )
  
  # Compute the predicted value for the observation
  predicted_value <- predict(model, newdata = payload, type = "response")
  
  # Store results
  result <- list(
    "predicted_outbreak_count" = round(predicted_value,0)
  )
  
  return(result)
}
