#Figure 3H UC subgroup phenotype data and microbial correlation heatmap
micro_data <- MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Subgroup',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method='relative') |>
  EMP_filter(sample_condition = Subgroup %in% c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great'))
micro_data

meta_data <- MAE |>
  EMP_assay_extract('silva') |>
  EMP_coldata_extract(action = 'add',
                      coldata_to_assay = c('disease_duration','D_partial_Mayo','D_Mayo_SFS','D_Mayo_RBS'))
meta_data

(micro_data + meta_data) |>
  EMP_cor_analysis() |>
  EMP_heatmap_plot(label_size=2,palette='Spectral',
                   clust_row=FALSE,clust_col=T)
