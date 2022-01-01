#Import data to RStudio
#Load readr package
library(readr)

GBR <- read_csv("~/workspace/Analysis/GBR_data")

USA <- read_csv("~/workspace/Analysis/USA_data")

#Perform Summary Analysis on Data
summary(GBR)

summary(USA)

#Summary results of year, month, and country columns are irrelevant
#Summary results of Temperature and Rainfall columns show
# the min, 1st quartile, median, 3rd quartile, max, and mean for each variable for each country

#For the 2 Data Columns, Perform Min/Max/Average Analysis for each data set and store in variable
GBR_temperature_min <- min(GBR$`Temperature (C)`)
GBR_temperature_max <- max(GBR$`Temperature (C)`)
GBR_temperature_avg <- mean(GBR$`Temperature (C)`)

GBR_rainfall_min <- min(GBR$`Rainfall (mm)`)
GBR_rainfall_max <- max(GBR$`Rainfall (mm)`)
GBR_rainfall_avg <- mean(GBR$`Rainfall (mm)`)

USA_temperature_min <- min(USA$`Temperature (C)`)
USA_temperature_max <- max(USA$`Temperature (C)`)
USA_temperature_avg <- mean(USA$`Temperature (C)`)

USA_rainfall_min <- min(USA$`Rainfall (mm)`)
USA_rainfall_max <- max(USA$`Rainfall (mm)`)
USA_rainfall_avg <- mean(USA$`Rainfall (mm)`)

#Create vectors for GBR and USA
GBRV <- c(GBR_temperature_min, GBR_temperature_max, GBR_temperature_avg,
          GBR_rainfall_min, GBR_rainfall_max, GBR_rainfall_avg)

GBRV

USAV <- c(USA_temperature_min, USA_temperature_max, USA_temperature_avg,
          USA_rainfall_min, USA_rainfall_max, USA_rainfall_avg)

USAV

#Create a matrix that combines data from both data sets
CombinedM <- cbind(GBRV, USAV)

rownames(CombinedM) <- c("Temperature Min", "Temperature Max", "Temperature Mean", "Rainfall Min", "Rainfall Max", "Rainfall Mean")

CombinedM

#Create a dataframe that includes the both data sets and their difference
df <- cbind(CombinedM, GBRV-USAV)

colnames(df) <- c("GBR","USA", "Difference")

df