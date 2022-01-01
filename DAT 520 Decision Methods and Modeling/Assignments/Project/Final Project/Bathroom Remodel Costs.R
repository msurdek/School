library(tidyverse)
library(readxl)

costs <- read_csv("homimp.csv")

bathrooms <- costs %>%
  filter(RAS == "'71'" & RAD < 16000)

ggplot(bathrooms, aes(x = RAD)) +
  geom_histogram(binwidth = 500) +
  theme_bw() +
  labs(title = "Bathroom Remodeling Costs", x = "Cost in Dollars", y = "")
