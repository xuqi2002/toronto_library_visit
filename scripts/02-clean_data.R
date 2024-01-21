#### Preamble ####
# Purpose: Cleans the raw library visits data by summarizing the total visits by year and removing the "BranchCode" column
# Author: Xu Qi
# Date: 20 January 2024 
# Contact: xu.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

#### Clean ####

# Cleaning the data set by summarizing the total visits by year and removing the "BranchCode" column
cleaned_toronto_libraries <- toronto_libraries %>%
  clean_names() %>%  
  group_by(year) %>%  
  summarise(visits = sum(visits))  

# Saving the dataset as csv file in the folder
write_csv(
  x = cleaned_toronto_libraries,
  file = "cleaned_toronto_libraries.csv"
)

# Viewing the first few rows of the dataset
head(cleaned_toronto_libraries)

