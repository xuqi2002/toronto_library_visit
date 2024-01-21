#### Preamble ####
# Purpose: Downloads, saves, and reads data from the Open Data Toronto portal
# Author: Xu Qi
# Date: 20 January 2024 
# Contact: xu.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####

install.packages("opendatatoronto")
install.packages("knitr")

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)

#### Download ####

toronto_libraries <-
  # Each package is associated with a unique id found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/library-visits/
  list_package_resources("932efbb4-644f-401b-9f59-af0b31713f44") |>
  # Within that package, we are interested in the 2012-2022 dataset
  filter(name == 
           "tpl-visits-annual-by-branch-2012-2022.csv") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()

# Saving the dataset as csv file in the folder
write_csv(
  x = toronto_libraries,
  file = "toronto_libraries.csv"
)

# Viewing the first few rows of the dataset
head(toronto_libraries)

