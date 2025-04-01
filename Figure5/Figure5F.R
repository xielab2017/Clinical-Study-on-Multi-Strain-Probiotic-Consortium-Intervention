#Figure 3G Differential analysis of bacterial community in IBS Subgroup
MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Subgroup',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method='relative') |>
  EMP_filter(sample_condition = Subgroup %in% c('IBS_before_poor','IBS_after_poor')) |>
  EMP_diff_analysis(method='wilcox.test',estimate_group = 'Subgroup',
                    p.adjust = 'bonferroni',paired_group='patient')|>
  EMP_boxplot(est='Subgroup',paired_group='patient')

MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Subgroup',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method='relative') |>
  EMP_filter(sample_condition = Subgroup %in% c('IBS_before_great','IBS_after_great')) |>
  EMP_diff_analysis(method='wilcox.test',estimate_group = 'Subgroup',
                    p.adjust = 'bonferroni',paired_group='patient')|>
  EMP_boxplot(est='Subgroup',paired_group='patient')




