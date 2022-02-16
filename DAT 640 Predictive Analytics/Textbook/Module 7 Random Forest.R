library(rattle)
library(randomForest)

data(weather)
weather

weatherDS <- new.env()

evalq({
  data <- na.omit(weather)
  nobs <- nrow(data)
  form <- formula(RainTomorrow ~ .)
  target <- all.vars(form)[1]
  vars <- -grep('^(Date|Location|Risk)', names(data))
  set.seed(42)
  train <- sample(nobs, .7 * nobs)
}, weatherDS)

weatherRF <- new.env(parent = weatherDS)

evalq({
  model <- randomForest(formula = form,
                        data = data[train, vars],
                        ntree = 500, mtry = 4,
                        importance = TRUE,
                        localImp =TRUE,
                        na.action = na.roughfix,
                        replace = FALSE)
}, weatherRF)

str(weatherRF$model)

head(weatherRF$model$predicted, 10)

head(weatherRF$model$importance)

head(weatherRF$model$localImp)[,1:4]

weatherRF$model$err.rate

round(head(weatherRF$model$err.rate, 15), 4)

evalq({
  min.err <- min(data.frame(model$err.rate)["OOB"])
  min.err.idx <- which(data.frame(model$err.rate)["OOB"] == min.err)
}, weatherRF)

weatherRF$min.err

weatherRF$min.err.idx

weatherRF$model$err.rate[weatherRF$min.err.idx]

head(weatherRF$model$votes)

head(apply(weatherRF$model$votes, 1, sum))

