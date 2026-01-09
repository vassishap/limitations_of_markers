# Fungal Multi-Marker Metabarcoding Analysis
This repository contains the bioinformatic parameters and R scripts used for the data analysis in the study: "Limitations of common molecular markers in fungal biodiversity analysis and the benefits of their synergistic use".  
## 1. Project Overview  
This study evaluates and compares the performance of seven fungal DNA barcode markers—ITS1, ITS2, mtLSU, $rpb2a$, $rpb2b$, $ef1-α$, and $mcm7$—using a taxonomically diverse mock community comprising 413 fungal species across 32 orders. The goal was to identify optimal marker combinations to improve species richness and relative sequence abundance (RSA) estimates in fungal metabarcoding.  
## 2. Bioinformatic Processing (SEED 2)  
### Raw Illumina MiSeq amplicon sequences were processed using the SEED 2 pipeline ([link](https://www.biomed.cas.cz/mbu/lbwrf/seed/)).  
The following parameters were applied:  
* **Read Joining:** Forward and reverse reads were joined using Fastq-join ([link](https://github.com/brwnj/fastq-join)) with a minimum 40 bp overlap and $<15\%$ mismatches.
* **Quality Filtering:** Reads with a mean PHRED quality score below 30, ambiguous bases, or tag mismatches were excluded.
* **Subregion Extraction:** ITS1 and ITS2 regions were truncated to highly variable regions using ITSx v. 1.0.11 ([link](https://microbiology.se/software/itsx/)).
* **Length Filtering:** ITS reads shorter than 30 bp and protein-coding/mtLSU reads shorter than 200 bp were excluded.
* **Chimera Detection:** Putative chimeras were identified and removed via the de novo strategy in the UCHIME algorithm.
* **Taxonomic Assignment:** Unique sequence variants were identified using BLASTn against curated reference databases with thresholds set at $\ge 98.5\%$ sequence similarity and $\ge 95\%$ coverage.
* **OTU Clustering:** For analysis of the mock community subsets (for reference sequence generation), reads were grouped into Operational Taxonomic Units (OTUs) at a 97% similarity threshold using the UPARSE algorithm ([link](https://www.drive5.com/usearch/)).
## 3. Script Descriptions  
### The folder contains modularized R scripts for reproducing the figures and statistical analyses:  
* **plot_quality_filtering.R** $Manuscript Figure: Figure 1.$  
Description: Visualizes the proportion of sequence reads retained or discarded at each filtering step, including low quality, chimeric, non-target, and low-similarity reads.  
* **plot_taxonomic_overlap.R** $Manuscript Figure: Figure 2.$  
Description: Uses the ComplexUpset package to generate matrix layout plots visualizing the overlap in species detections between different marker combinations (e.g., how many species are exclusive to ITS2 vs. shared with $ef1-α$).  
* **plot_venn_diagram.R** $Manuscript Figure: Figure 3.$  
Description: Generates proportional diagrams using the nVennR package to show the additive value of alternative markers (mtLSU, $ef1-α$, $rpb2b$) when combined with the ITS2 baseline.  
* **plot_order_level_abundance.R** $Manuscript Figure: Figure 4.$  
Description: Compares the Relative Sequence Abundance (RSA) of fungal orders against the original specimen counts (DNA input proxy) to identify amplification biases.  
* **analysis_correlation.R**  
Description: Performs Spearman's correlation analysis between the absolute number of reads and the number of specimens per species in the mock community.
## 4. Dependencies
### To run the provided scripts, the following R packages are required:
**tidyverse:** Data manipulation and visualization. https://tidyverse.org/  
**ggplot2:** Core plotting engine. https://ggplot2.tidyverse.org/  
**ComplexUpset:** Advanced UpSet plots. https://krassowski.github.io/complex-upset/  
**UpSetR:** Foundation for intersection visualizations. https://cran.r-project.org/web/packages/UpSetR/index.html  
**ggpubr:** Publication-ready theme adjustments. https://rpkgs.datanovia.com/ggpubr/  
**rstatix:** Pipe-friendly framework for basic statistical tests. https://rpkgs.datanovia.com/rstatix/  
**nVennR:** Proportional Venn diagrams. https://github.com/cran/nVennR  
**viridis:** Color-blind friendly color scales. https://sjmgarnier.github.io/viridis/  
## 5. Data Availability  
* Raw Sequences: FASTQ files are deposited in the Dryad digital repository (DOI: XXX).  
* Reference Sequences: Curated FASTA files for all tested markers are provided in the Dryad digital repository (DOI: XXX).  
* Mock Community Info: Detailed taxonomy and origin of the 676 fungal strains are available in Supplementary Table S1.
## 6. Citation
### If you utilize this code or the associated datasets, please cite:  
Shapkin, V., Zelenka, T., Větrovský, T., Kostovčík, M., Eichlerová, I., Kohout, P., Žifčáková, L., Borovička, J., Tomšovský, M., Adamčík, S., Baldrian, P., & Kolařík, M. (2026). Limitations of common molecular markers in fungal biodiversity analysis and the benefits of their synergistic use. Molecular Ecology Resources.
