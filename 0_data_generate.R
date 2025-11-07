# 0_data_generate.R
# Generates a small synthetic dataset for demonstration.
library(tidyverse)
set.seed(1203)
countries <- c("JPN","KOR","CHN","THA","IND","AUS","FRA","DEU","USA","CAN","SGP","NLD")
years <- 2000:2023
df <- expand.grid(iso = countries, year = years) %>%
  mutate(gdp_pc = runif(n(), 20000, 60000),
         internet = pmin(100, rnorm(n(), 60 + 0.8*(year-2000), 5)),
         aged65 = runif(n(), 6, 22),
         PNI = rnorm(n()), OCPE = sample(0:1, n(), TRUE, c(0.7,0.3)),
         governance = rnorm(n()), workforce = rnorm(n()), coverage = rnorm(n())) %>%
  mutate(CRI = 42 + 0.86*governance + 0.77*workforce + 0.70*coverage + rnorm(n(),0,2))
write_csv(df, "data/sample_data.csv")
message("Saved data/sample_data.csv")
