appointment_data <- data.frame(
  Month = c("January", "February", "March", "April", "May", "June"),
  Appointments = c(100, 120, 110, 130, 125, 140),
  No_Shows = c(12, 18, 22, 13, 10, 14)
)
appointment_data$No_Show_Rate <- 
  (appointment_data$No_Shows / appointment_data$Appointments) * 100
max(appointment_data$No_Show_Rate)
appointment_data$Month[
  which.max(appointment_data$No_Show_Rate)
]
min(appointment_data$No_Show_Rate)
appointment_data$Month[
  which.min(appointment_data$No_Show_Rate)
]
mean(appointment_data$No_Show_Rate)
library(ggplot2)
appointment_data$Month <- factor(
  appointment_data$Month,
  levels = c("January", "February", "March", "April", "May", "June")
)
ggplot(appointment_data)
ggplot(appointment_data, aes(x = Month, y = No_Show_Rate))
ggplot(appointment_data, aes(x = Month, y = No_Show_Rate)) +
  geom_line()
ggplot(appointment_data, aes(x = Month, y = No_Show_Rate, group = 1)) +
  geom_line()
ggplot(appointment_data, aes(x = Month, y = No_Show_Rate, group = 1)) +
  geom_line() +
  geom_point()
ggplot(appointment_data, aes(x = Month, y = No_Show_Rate, group = 1)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = paste0(No_Show_Rate, "%")), vjust = -0.7) +
  labs(
    title = "Patient Appointment No-Show Rates",
    x = "Month",
    y = "No-Show Rate (%)"
  )
geom_text(aes(label = paste0(No_Show_Rate, "%")), vjust = -0.7) +
  ggplot(appointment_data, aes(x = Month, y = No_Show_Rate, group = 1)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = paste0(No_Show_Rate, "%")), vjust = -0.7) +
  geom_text(aes(label = paste0(No_Show_Rate, "%")), vjust = -0.7) +
  labs(
    title = "Patient Appointment No-Show Rates",
    x = "Month",
    y = "No-Show Rate (%)"
  )
geom_text(aes(label = paste0(No_Show_Rate, "%")), vjust = -0.7) +
ggplot(appointment_data, aes(x = Month, y = No_Show_Rate, group = 1)) +
  geom_line() +
  geom_point() +
  geom_text(aes(label = paste0(No_Show_Rate, "%")), vjust = -0.7) +
  labs(
    title = "Patient Appointment No-Show Rates",
    x = "Month",
    y = "No-Show Rate (%)"
  )  +
  theme_minimal()
getwd()
ggsave(
  "02-patient-no-show-analysis/Figures/patient-no-show-rates.png"
)
ggsave(
  "02-patient-no-show-analysis/Figures/patient-no-show-rates.png"
)
list.files("02-patient-no-show-analysis/Figures")
write.csv(
  appointment_data,
  "02-patient-no-show-analysis/Data/patient-no-show-data.csv",
  row.names = FALSE
)
list.files("02-patient-no-show-analysis/Data")
