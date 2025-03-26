#S1A Species structure diagram at the family and genus levels
MAE |>
  EMP_assay_extract('silva') |>
  EMP_filter(sample_condition = Group %in% c('UC_before','UC_after'))|>
  EMP_collapse(estimate_group = 'Group',collapse_by = 'col') |>
  EMP_decostand(method = 'relative') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row')|>
  EMP_structure_plot(top_num=10,bar_level = c('UC_before','UC_after'))

MAE |>
  EMP_assay_extract('silva') |>
  EMP_filter(sample_condition = Group %in% c('UC_before','UC_after'))|>
  EMP_collapse(estimate_group = 'Group',collapse_by = 'col') |>
  EMP_decostand(method = 'relative') |>
  EMP_collapse(estimate_group = 'Family',collapse_by = 'row')|>
  EMP_structure_plot(top_num=10,bar_level = c('UC_before','UC_after'))