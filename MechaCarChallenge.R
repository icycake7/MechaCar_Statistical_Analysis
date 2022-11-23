# Deliverable 1
library(dplyr)

# import csv
cars <- read_csv("MechaCar_mpg.csv")

#Linear Regression to Predict MPG
linreg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=cars)
linreg_summary <- summary(linreg)
linreg_summary


# Deliverable 2
# import csv
Suspension_Coil <- read_csv("Suspension_Coil.csv")
summary(Suspension_Coil[c('PSI')])

# Statistical Summary
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
total_summary

# Statistical Summary per individual lot
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
lot_summary


# Deliverable 3
# 1.Determine if PSI across all manufacturing lots is statistically different from the population mean of 1,500 PSI
t.test(Suspension_Coil$PSI, mu=1500)

#2. determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 PSI

# separate the lots 
lot1 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot3")

# perform t-test                                      
t.test(lot1$PSI, mu=1500)
t.test(lot2$PSI, mu=1500)
t.test(lot3$PSI, mu=1500)