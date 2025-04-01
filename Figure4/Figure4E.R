#Figure 4E Differential analysis of bacterial community in IBS group 
MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Group',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method='relative') |>
  EMP_filter(sample_condition = Group %in% c('IBS_before','IBS_after')) |>
  EMP_diff_analysis(method='wilcox.test',estimate_group = 'Group',
                    p.adjust = 'bonferroni',paired_group='patient')|>
  EMP_boxplot(est='Group',paired_group='patient')

