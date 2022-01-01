#Move files
#Copy from SNHU folder to Analysis folder
file.copy("~/workspace/SNHU/DAT-500/Milestones/dat500_milestone_two_data_firefighter.csv","~/workspace/Analysis")

file.copy("~/workspace/SNHU/DAT-500/Milestones/dat500_milestone_two_data_police.csv","~/workspace/Analysis")

#Rename files in Analysis folder
file.rename("~/workspace/Analysis/dat500_milestone_two_data_firefighter.csv", "~/workspace/Analysis/Firefighter.csv")

file.rename("~/workspace/Analysis/dat500_milestone_two_data_police.csv", "~/workspace/Analysis/Police.csv")

#Import data to RStudio
#Load readr package
library(readr)

firefighter <- read_csv("~/workspace/Analysis/Firefighter.csv")

police <- read_csv("~/workspace/Analysis/Police.csv")

#Perform Summary Analysis on Data
summary(firefighter)

summary(police)

#For any 2 Data Columns, Perform Min/Max/Average Analysis for each data set and store in variable
#I chose Overtime and Total Compensation in Milestone 1
firefighter_overtime_min <- min(firefighter$Overtime)
firefighter_overtime_max <- max(firefighter$Overtime)
firefighter_overtime_avg <- mean(firefighter$Overtime)
police_overtime_min <- min(police$Overtime)
police_overtime_max <- max(police$Overtime)
police_overtime_avg <- mean(police$Overtime)

firefighter_total_min <- min(firefighter$'Total Compensation')
firefighter_total_max <- max(firefighter$'Total Compensation')
firefighter_total_avg <- mean(firefighter$'Total Compensation')
police_total_min <- min(police$'Total Compensation')
police_total_max <- max(police$'Total Compensation')
police_total_avg <- mean(police$'Total Compensation')