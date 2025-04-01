#Figure 2A Changes after UCEIS probiotic intervention
MAE |>    
  EMP_coldata_extract(experiment='silva',action='add') |>
  EMP_filter(sample_condition = Group %in% c('UC_before','UC_after'),filterFeature = 'UCEIS') |>
  EMP_boxplot(method = 't.test',estimate_group = 'Group',paired_group='patient',ggroup_level=c('UC_before','UC_after'))


