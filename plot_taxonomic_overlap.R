library(tidyverse)
library(ComplexUpset)

# Load your data (Expected file: species_presence_matrix.csv)
# upset_data <- read.csv("data/species_presence_matrix.csv")

sets <- c("its1", "its2", "mtlsu", "ef1a", "rpb2b")

ComplexUpset::upset(
  upset_data, 
  sets, 
  sort_sets = FALSE,
  width_ratio = 0.3,
  base_annotations = list(
    'Intersection size' = intersection_size(
      counts = TRUE,
      mapping = aes(fill = Division)) + scale_fill_viridis_d()
  ),
  set_sizes = (
    upset_set_size(geom = geom_bar(aes(fill = Division, x = group), width = 0.6)) + 
    scale_fill_viridis_d()
  )
)
