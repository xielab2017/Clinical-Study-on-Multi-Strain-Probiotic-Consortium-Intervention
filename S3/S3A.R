#S3A IBS level alpha analysis
MAE |>
  EMP_assay_extract(experiment='silva') |> 
  EMP_collapse(collapse_by='row',
               estimate_group = 'Genus',method = 'sum',collapse_sep = '+') |>
  EMP_identify_assay(estimate_group = 'Group',method = 'default',min=0.001,min_ratio = 0.6) %>% 
  EMP_filter(sample_condition = Group %in% c('IBS_before','IBS_after')) |>
  EMP_alpha_analysis() |>
  EMP_boxplot(est='Group',html_height=11,group_level=c('IBS_before','IBS_after'))