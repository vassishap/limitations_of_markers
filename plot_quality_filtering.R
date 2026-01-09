# Load necessary libraries
library(tidyverse)
library(ggpubr)

# Load your data (Expected file: reads_quality_table.csv)
# filter_data <- read.csv("data/reads_quality_table.csv")

# Data preparation and plotting
long_data <- gather(filter_data, key = 'quality', value = 'value', -marker,
                    factor_key = TRUE, na.rm = TRUE)

ggplot(long_data, aes(x = marker, y = value, fill = quality)) +
  geom_col(position = position_fill()) +
  scale_fill_brewer(palette = "Set1") +
  theme_pubr() +
  labs(y = "Proportion of Reads", x = "Molecular Marker") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.major.y = element_line(),
        legend.position = 'right')
