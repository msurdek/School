#Use this template to begin milestone 3  
#Use the code provided to read the files into RStudio and then add your code below each of the comment prompts that follow

#Move files
#Copy from SNHU folder to Analysis folder
file.copy("~/workspace/SNHU/DAT-500/Milestones/dat500_milestone_three_data_firefighter.csv","~/workspace/Analysis")

file.copy("~/workspace/SNHU/DAT-500/Milestones/dat500_milestone_three_data_police.csv","~/workspace/Analysis")

#Rename files in Analysis folder
file.rename("~/workspace/Analysis/dat500_milestone_three_data_firefighter.csv", "~/workspace/Analysis/Firefighter.csv")

file.rename("~/workspace/Analysis/dat500_milestone_three_data_police.csv", "~/workspace/Analysis/Police.csv")

#Import data to RStudio
#Load readr package
library(readr)

firefighter <- read_csv("~/workspace/Analysis/Firefighter.csv")

police <- read_csv("~/workspace/Analysis/Police.csv")

#To begin milestone 3, you will continue from your milestone 2.  Below is a sample of what your 
# milestone 2 variables would have looked like.
#To begin milestone 3, adjust the sample field names and variable names below to be the same fields used in Milestone 2

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

#Milestone 3 data structures
#add your code below each of the prompts below
#Create your vector
firefighterV <- c(firefighter_overtime_min, firefighter_overtime_max, firefighter_overtime_avg,
                  firefighter_total_min, firefighter_total_max,firefighter_total_avg)
firefighterV

#Create your matrix
policeM <- rbind(police_overtime_min, police_overtime_max, police_overtime_avg,
                 police_total_min, police_total_max, police_total_avg)
rownames(policeM) <- c("OTMin", "OTMax", "OTMean", "TotalMin", "TotalMax", "TotalMean")
policeM

#Create your combined matrix
compensationM <- cbind(firefighterV, policeM)
colnames(compensationM) <- c("Firefighter","Police")
compensationM

#Create your dataframe
df <- cbind(compensationM, policeM-firefighterV)
colnames(df) <- c("Firefighter","Police", "Difference")
df