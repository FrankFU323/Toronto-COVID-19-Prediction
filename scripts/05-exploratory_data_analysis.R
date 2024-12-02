#### Preamble ####
# Purpose: Plot the outcome and predict variable
# Author: Tianrui Fu
# Date: 29 November 2024
# Contact: tianrui.fu@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(ggplot2)

#### Read data ####
data <- read_parquet(here::here("data/02-analysis_data/analysis_data.parquet"))

### Plot data
## Outcome variable -- Outbreak count
plot_data <- data %>%
  group_by(causative_agent_1, season) %>% # Group by agent and season for detailed view
  summarise(total_outbreaks = sum(outbreak_count), .groups = "drop")

ggplot(data, aes(x = outbreak_count)) +
  geom_bar()
# Create the bar plot
ggplot(plot_data, aes(x = causative_agent_1, y = total_outbreaks, fill = season)) +
  geom_bar(stat = "identity", position = "dodge") + # Dodge for season-wise bars
  geom_text(aes(label = total_outbreaks),
    position = position_dodge(width = 0.9),
    vjust = -0.5, size = 3
  )

## Predict variable
### Causative Agent
ggplot(data, aes(x = causative_agent_1, fill = causative_agent_1)) +
  geom_bar() +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5)

### Season
ggplot(data, aes(x = season, fill = season)) +
  geom_bar() +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5)

### Month
ggplot(data, aes(x = factor(month, levels = 1:12), fill = factor(month))) +
  geom_bar() +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5)

### Outbreak setting
ggplot(data, aes(x = outbreak_setting, fill = outbreak_setting)) +
  geom_bar() +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5)
