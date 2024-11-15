#### Preamble ####
# Purpose: Calls and saves the cleaned data (data pre-cleaned with SQL in DB Browser)
# Author: Jimin Lee
# Date: 14 November 2024
# Contact: jamiejimin.lee@mail.utoronto.ca
# License: MIT
# Pre-requisites: SQLite raw data file obtained from Project Hammer and cleaned in DB Browser
# Any other information needed? N/A


#### Workspace setup ####
library(tidyverse)

#### Download data ####
price_analysis_data <- read_csv("/Users/jamielee/Downloads/price_analysis.csv")

#### Save data ####
write_csv(price_analysis_data, "data/02-analysis_data/analysis_data.csv")

