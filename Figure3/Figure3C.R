#Figure 3C UC subgroup genus level alpha diversity structure
MAE |>
  EMP_assay_extract(experiment='silva') |> 
  EMP_collapse(collapse_by='row',
               estimate_group = 'Genus',method = 'sum',collapse_sep = '+') |>
  EMP_identify_assay(estimate_group = 'Subgroup',method = 'default',min=0.001,min_ratio = 0.6) %>% 
  EMP_filter(sample_condition = Subgroup %in% c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great')) |>
  EMP_alpha_analysis() |>
  EMP_boxplot(est='Subgroup',html_height=11,group_level=c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great'))