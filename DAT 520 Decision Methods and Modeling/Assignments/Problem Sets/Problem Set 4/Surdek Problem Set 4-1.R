# Read in the data, install and load required package - 
getwd()
setwd("C:/Users/msurd/Documents/SCHOOL/")
dat <- read.csv("DAT 520 Decision Methods and Modeling/Module 4 Data Files/Clem3Training.csv", header = T, stringsAsFactors = T)
install.packages("rpart")
library(rpart)

# Collapse some of the categories by giving them the same factor label

# Display all levels for marital status and work class
levels(dat$marital.status)
levels(dat$workclass)

# Reassign level names
levels(dat$marital.status)[2:4] <- "Married"
levels(dat$workclass)[c(2,3,8)] <- "Gov"
levels(dat$workclass)[c(5, 6)] <- "Self"

# Standardize the numeric variables
dat$age.z <- (dat$age - mean(dat$age))/sd(dat$age)
dat$education.num.z <- (dat$education.num -
                          mean(dat$education.num))/sd(dat$education.num)
dat$capital.gain.z <- (dat$capital.gain - mean(dat$capital.gain))/sd(dat$capital.gain)
dat$capital.loss.z <- (dat$capital.loss - mean(dat$capital.loss))/sd(dat$capital.loss)
dat$hours.per.week.z <- (dat$hours.per.week -
                           mean(dat$hours.per.week))/sd(dat$hours.per.week)

# Use predictors to classify whether or not a person's income is less than $50K
cartfit <- rpart(income ~ age.z + education.num.z + capital.gain.z + capital.loss.z + hours.per.week.z + race + sex + workclass + marital.status, data = dat, method = "class")

# Print a summary of the results
print(cartfit)

# Plot the decision tree
plot(cartfit,uniform = TRUE, main = "Classification Tree")
text(cartfit, splits = TRUE, digits = 1, fancy= TRUE, fwidth = 0.6, fheight = 0.7, pretty = TRUE, FUN= text, xpd = TRUE, cex = 0.8)

#Save as Bitmap
jpeg(file="DAT 520 Decision Methods and Modeling/Module 4 Data Files/4-1 Tree")
plot(cartfit,uniform = TRUE, main = "Classification Tree")
text(cartfit, splits = TRUE, digits = 1, fancy= TRUE, fwidth = 0.6, fheight = 0.7, pretty = TRUE, FUN= text, xpd = TRUE, cex = 0.8)
dev.off()

# C5.0
# Install the C5.0 package
install.packages("C50")
library("C50")

# Put the predictors into 'x', the response into 'y'
names(dat)
x <- dat[,c(2,6, 9, 10, 16, 17, 18, 19, 20)]
names(x)
y <- dat$income

# Run C5.0
c50fit <- C5.0(x, y)
summary(c50fit)

#write file for problem 2
write.csv(dat, file="DAT 520 Decision Methods and Modeling/Module 4 Data Files/CLEM3TrainingP2.csv")
