#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
data <- read_parquet("data/02-analysis_data/analysis_data_cleaned.parquet")

### Model data ####
# The first model
poisson_model_1 <- glm(count ~ institution_address, family = poisson(), data = data)

# Add one more variable
poisson_model_2 <- glm(count ~ institution_address + outbreak_setting, family = poisson(), data = data)

# Add all the variable
poisson_model_3 <- glm(count ~ institution_address + outbreak_setting + date_outbreak_began, family = poisson(), data = data)

# check the model AIC to choose
AIC(poisson_model_1, poisson_model_2, poisson_model_3)

fitted_values <- fitted(poisson_model_3)
residuals_values <- residuals(poisson_model_3)

# 绘制拟合值与残差的散点图
plot(fitted_values, residuals_values, 
     main = "Residuals vs Fitted Values", 
     xlab = "Fitted Values", 
     ylab = "Residuals")
abline(h = 0, col = "red")

# 使用训练数据的实际值和预测值来比较
actual_counts <- cleaned_data$count
predicted_counts <- fitted(poisson_model_3)

# 绘制预测值与实际值的散点图
ggplot(data.frame(actual = actual_counts, predicted = predicted_counts), aes(x = actual, y = predicted)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  labs(title = "Actual vs Predicted Counts", x = "Actual Counts", y = "Predicted Counts")

qqnorm(residuals(poisson_model_3))
qqline(residuals(poisson_model_3), col = "red")

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


