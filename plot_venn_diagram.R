# Load necessary libraries
library(tidyverse)
library(nVennR)

# Load your 0/1 presence-absence data
# venn_data <- read.csv("data/species_presence_data.csv")

# Filter out species not detected by any of the four markers
venn_no_zero <- venn_data[rowSums(venn_data) > 0, ]
venn_set_columns <- c("its1", "mtlsu", "ef1a", "rpb2b")

# Convert 0/1 data frame to a list of species names for each set
nVennR_input_list <- list()
for (col_name in venn_set_columns) {
  members <- venn.no.zero %>% filter(!!sym(col_name) == 1)
  nVennR_input_list[[col_name]] <- rownames(members)
}

# Generate and plot the Venn diagram
myVenn <- plotVenn(list(
  ITS1 = nVennR_input_list$its1, 
  mtLSU = nVennR_input_list$mtlsu, 
  ef1a = nVennR_input_list$ef1a, 
  rpb2b = nVennR_input_list$rpb2b
), outFile = 'venn_output.svg')
