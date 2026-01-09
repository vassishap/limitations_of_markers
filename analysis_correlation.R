# Load necessary libraries
library(rstatix)
library(tidyverse)

# Load the read count matrix (Expected: rows = orders, columns = markers)
# corr_mat_reads <- read.csv("data/read_counts.csv")

# Calculate Spearman's correlation matrix
cor.mat.r <- corr_mat_reads %>% cor_mat(., method = 'spearman')

# Extract p-values for the correlations
cor.mat.p <- cor.mat.r %>% cor_get_pval()

# Export results for the manuscript supplement
write.csv(cor.mat.r, "output/correlation_r_values.csv")
write.csv(cor.mat.p, "output/correlation_p_values.csv")

# Print matrix to console for verification
print(cor.mat.r)
