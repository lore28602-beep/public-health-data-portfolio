# Hispanic Obesity Analysis
# CDC obesity data by state, 2024
# Author: Lorena Rojas

# Load packages
library(ggplot2)

# Load the dataset
obesity_2024 <- read.csv("01-hispanic-obesity-analysis/data/2-Obesity-by-state-in-2024.csv")

# Inspect the dataset
dim(obesity_2024)
names(obesity_2024)
head(obesity_2024)
# View all states and jurisdictions
obesity_2024$State
# Check data quality
sum(is.na(obesity_2024$Prevalence))
class(obesity_2024$Prevalence)
# Check data quality
sum(is.na(obesity_2024$Prevalence))
class(obesity_2024$Prevalence)
# Check unique prevalence values
unique(obesity_2024$Prevalence)
# Identify jurisdiction with insufficient prevalence data
obesity_2024[obesity_2024$Prevalence == "Insufficient data*", ]
# Create a numeric prevalence variable
obesity_2024$Prevalence_numeric <- as.numeric(
  ifelse(obesity_2024$Prevalence == "Insufficient data*", 
         NA, 
         obesity_2024$Prevalence)
)
class(obesity_2024$Prevalence_numeric)
sum(is.na(obesity_2024$Prevalence_numeric))
# Calculate descriptive statistics
mean(obesity_2024$Prevalence_numeric, na.rm = TRUE)
median(obesity_2024$Prevalence_numeric, na.rm = TRUE)
min(obesity_2024$Prevalence_numeric, na.rm = TRUE)
max(obesity_2024$Prevalence_numeric, na.rm = TRUE)
# Identify jurisdictions with lowest and highest prevalence
obesity_2024[which.min(obesity_2024$Prevalence_numeric), ]
obesity_2024[which.max(obesity_2024$Prevalence_numeric), ]

# Create a dataset for visualization
plot_data <- obesity_2024[!is.na(obesity_2024$Prevalence_numeric), ]

# Sort jurisdictions from lowest to highest prevalence
plot_data <- plot_data[order(plot_data$Prevalence_numeric), ]
# Create horizontal bar chart
barplot(
  plot_data$Prevalence_numeric,
  names.arg = plot_data$State,
  horiz = TRUE,
  las = 1,
  cex.names = 0.6,
  xlab = "Obesity Prevalence (%)",
  main = "Obesity Prevalence by U.S. State and Jurisdiction, 2024"
)
# Create horizontal bar chart
barplot(
  plot_data$Prevalence_numeric,
  names.arg = plot_data$State,
  horiz = TRUE,
  las = 1,
  cex.names = 0.6,
  xlab = "Obesity Prevalence (%)",
  main = "Obesity Prevalence by U.S. State and Jurisdiction, 2024"
)
# Select 10 lowest and 10 highest prevalence estimates
lowest_10 <- head(plot_data, 10)
highest_10 <- tail(plot_data, 10)
# Plot 10 highest prevalence estimates
par(mar = c(5, 9, 4, 2))

bar_positions <- barplot(
  highest_10$Prevalence_numeric,
  names.arg = highest_10$State,
  horiz = TRUE,
  las = 1,
  xlim = c(0, 48),
  xlab = "Obesity Prevalence (%)",
  main = "10 Highest Obesity Prevalence Estimates, 2024"
)
# Add prevalence labels to the bars
text(
  x = highest_10$Prevalence_numeric + 0.7,
  y = bar_positions,
  labels = paste0(highest_10$Prevalence_numeric, "%"),
  cex = 0.75
)
# Increase left margin for state names
par(mar = c(5, 9, 4, 2))
# Create portfolio visualization with ggplot2
ggplot(highest_10, aes(x = Prevalence_numeric, y = reorder(State, Prevalence_numeric))) +
  geom_col() +
  geom_text(
    aes(label = paste0(Prevalence_numeric, "%")),
    hjust = 1.1,
    size = 3.5
  ) +
  labs(
    title = "10 Highest Obesity Prevalence Estimates, 2024",
    subtitle = "U.S. states and jurisdictions with available prevalence data",
    x = "Obesity Prevalence (%)",
    y = NULL
  )

