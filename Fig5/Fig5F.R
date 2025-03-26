#Figure 3G Analysis of differences in IBS microbiota subgroups, the following codes only represent the graph, and p-values will be analyzed using paired Wilcox test
MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Subgroup',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method='relative') |>
  EMP_filter(sample_condition = Subgroup %in% c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great')) |>
  EMP_assay_extract(action = 'add',pattern = 'Veillonella',pattern_ref = 'feature') |>
  EMP_diff_analysis(method='oneway.test',estimate_group = 'Subgroup',p.adjust = 'bonferroni')|>
  EMP_boxplot(est='Subgroup',html_height=11,group_level=c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great'))

MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Subgroup',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method='relative') |>
  EMP_filter(sample_condition = Subgroup %in% c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great')) |>
  EMP_assay_extract(action = 'add',pattern = 'Akkermansia',pattern_ref = 'feature') |>
  EMP_diff_analysis(method='oneway.test',estimate_group = 'Subgroup',p.adjust = 'bonferroni')|>
  EMP_boxplot(est='Subgroup',html_height=11,group_level=c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great'))


MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Subgroup',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method='relative') |>
  EMP_filter(sample_condition = Subgroup %in% c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great')) |>
  EMP_assay_extract(action = 'add',pattern = 'Agathobacter',pattern_ref = 'feature') |>
  EMP_diff_analysis(method='oneway.test',estimate_group = 'Subgroup',p.adjust = 'bonferroni')|>
  EMP_boxplot(est='Subgroup',html_height=11,group_level=c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great'))
