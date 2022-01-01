install.packages("rattle")
library(rattle)
install.packages("RGtk2")
library(RGtk2)
rattle()

# Rattle timestamp: 2021-03-21 20:40:57 x86_64-w64-mingw32 

# Load a dataset from file.

fname         <- "file:///C:/Users/msurd/Documents/SCHOOL/DAT 520 Decision Methods and Modeling/Module 4 Data Files/CLEM3TrainingP2.csv" 
crs$dataset <- read.csv(fname,
                        na.strings=c(".", "NA", "", "?"),
                        strip.white=TRUE, encoding="UTF-8")

#=======================================================================
# Rattle timestamp: 2021-03-21 20:41:12 x86_64-w64-mingw32 

# Action the user selections from the Data tab. 

# Build the train/validate/test datasets.

# nobs=25000 train=17500 validate=3750 test=3750

set.seed(crv$seed)

crs$nobs <- nrow(crs$dataset)

crs$train <- sample(crs$nobs, 0.7*crs$nobs)

crs$nobs %>%
  seq_len() %>%
  setdiff(crs$train) %>%
  sample(0.15*crs$nobs) ->
  crs$validate

crs$nobs %>%
  seq_len() %>%
  setdiff(crs$train) %>%
  setdiff(crs$validate) ->
  crs$test

# The following variable selections have been noted.

crs$input     <- c("age", "demogweight", "education",
                   "education.num", "marital.status", "occupation",
                   "relationship", "race", "sex", "capital.gain",
                   "capital.loss", "hours.per.week",
                   "native.country", "income", "age.z",
                   "education.num.z", "capital.gain.z",
                   "capital.loss.z", "hours.per.week.z")

crs$numeric   <- c("age", "demogweight", "education.num",
                   "capital.gain", "capital.loss", "hours.per.week",
                   "age.z", "education.num.z", "capital.gain.z",
                   "capital.loss.z", "hours.per.week.z")

crs$categoric <- c("education", "marital.status", "occupation",
                   "relationship", "race", "sex", "native.country",
                   "income")

crs$target    <- "workclass"
crs$risk      <- NULL
crs$ident     <- "X"
crs$ignore    <- NULL
crs$weights   <- NULL

#=======================================================================
# Rattle timestamp: 2021-03-21 20:41:25 x86_64-w64-mingw32 

# Action the user selections from the Data tab. 

# Build the train/validate/test datasets.

# nobs=25000 train=17500 validate=3750 test=3750

set.seed(crv$seed)

crs$nobs <- nrow(crs$dataset)

crs$train <- sample(crs$nobs, 0.7*crs$nobs)

crs$nobs %>%
  seq_len() %>%
  setdiff(crs$train) %>%
  sample(0.15*crs$nobs) ->
  crs$validate

crs$nobs %>%
  seq_len() %>%
  setdiff(crs$train) %>%
  setdiff(crs$validate) ->
  crs$test

# The following variable selections have been noted.

crs$input     <- c("age", "workclass", "demogweight", "education",
                   "education.num", "marital.status", "occupation",
                   "relationship", "race", "sex", "capital.gain",
                   "capital.loss", "hours.per.week",
                   "native.country", "age.z", "education.num.z",
                   "capital.gain.z", "capital.loss.z",
                   "hours.per.week.z")

crs$numeric   <- c("age", "demogweight", "education.num",
                   "capital.gain", "capital.loss", "hours.per.week",
                   "age.z", "education.num.z", "capital.gain.z",
                   "capital.loss.z", "hours.per.week.z")

crs$categoric <- c("workclass", "education", "marital.status",
                   "occupation", "relationship", "race", "sex",
                   "native.country")

crs$target    <- "income"
crs$risk      <- NULL
crs$ident     <- "X"
crs$ignore    <- NULL
crs$weights   <- NULL

#=======================================================================
# Rattle timestamp: 2021-03-21 20:41:31 x86_64-w64-mingw32 

# Decision Tree 

# The 'rpart' package provides the 'rpart' function.

library(rpart, quietly=TRUE)

# Reset the random number seed to obtain the same results each time.

set.seed(crv$seed)

# Build the Decision Tree model.

crs$rpart <- rpart(income ~ .,
                   data=crs$dataset[crs$train, c(crs$input, crs$target)],
                   method="class",
                   parms=list(split="information"),
                   control=rpart.control(usesurrogate=0, 
                                         maxsurrogate=0),
                   model=TRUE)

# Generate a textual view of the Decision Tree model.

print(crs$rpart)
printcp(crs$rpart)
cat("\n")

# Time taken: 9.01 secs

# List the rules from the tree using a Rattle support function.

asRules(crs$rpart)

#=======================================================================
# Rattle timestamp: 2021-03-21 20:41:45 x86_64-w64-mingw32 

# Plot the resulting Decision Tree. 

# We use the rpart.plot package.

fancyRpartPlot(crs$rpart, main="Decision Tree CLEM3TrainingP2.csv $ income")