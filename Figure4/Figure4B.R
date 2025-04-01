#Figure 4B IBS genus level species structure diagram
MAE |>
  EMP_assay_extract('silva') |>
  EMP_filter(sample_condition = Group %in% c('IBS_before','IBS_after'))|>
  EMP_collapse(estimate_group = 'Group',collapse_by = 'col') |>
  EMP_decostand(method = 'relative') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row')|>
  EMP_structure_plot(top_num=10,bar_level = c('IBS_before','IBS_after'))