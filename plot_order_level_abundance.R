library(tidyverse)
library(ggpubr)

# Load data (Expected file: reads_abundance.csv)
# long_data <- read.csv("data/reads_abundance.csv")

long_data %>% 
  mutate(Order = fct_reorder(Order, Phylum)) %>%
  ggplot(aes(y = value, x = Order, fill = Phylum)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_viridis_c() +
  facet_grid(marker ~ ., scales = "free_x") + 
  theme_pubr() +
  geom_text(aes(label = round(value, digits = 1)), 
            position = position_dodge(width = 0.9), vjust = -0.25, size = 3) +
  theme(axis.text.x = element_text(angle = 25, vjust = 1, hjust = 1)) +
  labs(y = "Difference in Relative Proportion (%)", x = "Fungal Order")
