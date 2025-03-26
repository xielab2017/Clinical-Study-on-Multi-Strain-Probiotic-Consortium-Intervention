#Figure 5B IBS subfamily level species structure diagram
MAE |>
  EMP_assay_extract('silva') |>
  EMP_filter(sample_condition = Subgroup %in% c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great'))|>
  EMP_collapse(estimate_group = 'Subgroup',collapse_by = 'col') |>
  EMP_decostand(method = 'relative') |>
  EMP_collapse(estimate_group = 'Family',collapse_by = 'row')|>
  EMP_structure_plot(top_num=10,bar_level=c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great'))