#S4A IBS subgroup level alpha analysis
MAE |>
  EMP_assay_extract(experiment='silva') |> 
  EMP_collapse(collapse_by='row',
               estimate_group = 'Genus',method = 'sum',collapse_sep = '+') |>
  EMP_identify_assay(estimate_group = 'Subgroup',method = 'default',min=0.001,min_ratio = 0.6) %>% 
  EMP_filter(sample_condition = Subgroup %in% c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great')) |>
  EMP_alpha_analysis() |>
  EMP_boxplot(est='Subgroup',html_height=11,group_level=c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great'))