#Figure 3G Differential analysis of UC subgroup microbiota, the following code only produces graphs, and p-values are calculated using paired Wilcox test
MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Subgroup',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method='relative') |>
  EMP_filter(sample_condition = Subgroup %in% c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great')) |>
  EMP_assay_extract(action = 'add',pattern = 'Bifidobacterium',pattern_ref = 'feature') |>
  EMP_diff_analysis(method='oneway.test',estimate_group = 'Subgroup',p.adjust = 'bonferroni')|>
  EMP_boxplot(est='Subgroup',html_height=11,group_level=c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great'))

MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Subgroup',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method='relative') |>
  EMP_filter(sample_condition = Subgroup %in% c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great')) |>
  EMP_assay_extract(action = 'add',pattern = 'Rothia',pattern_ref = 'feature') |>
  EMP_diff_analysis(method='oneway.test',estimate_group = 'Subgroup',p.adjust = 'bonferroni')|>
  EMP_boxplot(est='Subgroup',html_height=11,group_level=c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great'))