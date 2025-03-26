#Figure 3D Beta diversity analysis of UC subgroups at the genus level
MAE |>
  EMP_assay_extract(experiment = 'silva') |>
  EMP_identify_assay(estimate_group = 'Subgroup',method = 'default',min=0.001,min_ratio = 0.6) %>%
  EMP_collapse(collapse_by='row',
               estimate_group = 'Genus',method = 'sum',collapse_sep = '+') |>
  EMP_filter(sample_condition = Subgroup %in% c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great')) |>
  EMP_dimension_analysis(method = 'pcoa',distance = 'bray') |>
  EMP_scatterplot(method='t.test',esti='Subgroup',html_height=13,show='p12',ellipse=0.3,group_level=c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great'))