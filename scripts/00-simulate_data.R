#### Preamble ####
# Purpose: Simulates the 2012-2022 annual visits at Toronto Public Library branches data set
# Author: Xu Qi
# Date: 20 January 2024 
# Contact: xu.qi@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Data sets:
## - https://open.toronto.ca/dataset/library-visits/ 
# Note: Only download the 2012-2022 visit data from the webpage

#### Workspace setup ####

library(dplyr)

#### Simulate ####

# Creating a list of years from 2012 to 2022
years <- 2012:2022

# Assuming there are one hundred library branches in Toronto
# Repeating the years one hundred times, one for each library branch
years_rep <- rep(years, each = 100)

# Creating a unique ID for each library branch
library_id <- rep(1:100, times = length(years))

# Simulating the number of visits using a Poisson distribution
# Setting a seed for reproducibility
set.seed(1212)
visits <- rpois(n = length(years_rep), lambda = 1000000)

# Creating the simulation data set
simulation_data <- data.frame(Year = years_rep, LibraryID = library_id, Visits = visits)

# Viewing the first few rows of the dataset
head(simulation_data)

