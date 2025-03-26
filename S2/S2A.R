#S2A UC Subgroup Genus Level Species Structure Diagram
MAE |>
  EMP_assay_extract('silva') |>
  EMP_filter(sample_condition = Subgroup %in% c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great'))|>
  EMP_collapse(estimate_group = 'Subgroup',collapse_by = 'col') |>
  EMP_decostand(method = 'relative') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row')|>
  EMP_structure_plot(top_num=10,bar_level=c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great'))