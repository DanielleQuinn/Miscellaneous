# Set up sample data; a vector of strings, each containing information about
# vial labels, plate number, sequence ID, species, and region
mysamples <- c("E001_P1714161_065_Leucoraja_erinacea_bay_of_fundy",
  "E008_P1714161_068_Leucoraja_erinacea_bay_of_fundy",
  "B336_P1409813_045_Leucoraja_erinacea_avon_estuary",
  "B338_P1409813_071_Leucoraja_erinacea_avon_estuary",
  "B332_P1409813_047_Leucoraja_erinacea_avon_estuary",
  "E112_P1714162_068_Leucoraja_erinacea_bay_of_fundy",
  "E029_P1714161_090_Leucoraja_erinacea_bay_of_fundy",
  "B317_P1409813_048_Leucoraja_erinacea_avon_estuary",
  "G045_P1714132_024_Leucoraja_erinacea_bay_of_fundy",
  "E005_P1714171_042_Leucoraja_erinacea_bay_of_fundy",
  "N195_P1814942_013_Leucoraja_erinacea_southern_bight",
  "N228_P1814942_043_Leucoraja_erinacea_southern_bight")

# Objective: extract information, convert to data frame, pull sequence IDs by region

# Load packages
library(dplyr)
library(tidyr)

# Convert the vector into a data frame
data <- data.frame(sample = mysamples)

# Separate the components of the sample ID, using "_" as a guide (separate)
  # Use mutate to paste genus and species together and remove "_" in locations
  # Select the clean columns of interest

data <- data %>% separate(sample, into = c("finclip", "plate","id", "genus","species", "location"), sep="_", extra = "merge") %>%
  mutate(taxon = paste(genus, species), location = gsub("_"," ", location)) %>%
  select(finclip, plate, id, taxon, location)

# To get all of the values of a particular identifier from one region, you can use
data$id[data$location == "avon estuary"]

# or, using dplyr
data %>% filter(location == "avon estuary") %>% pull(id)
