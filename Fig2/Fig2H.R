#Figure 2H Analysis of functional differences in UC group KO
MAE |>
  EMP_assay_extract('ko') |>
  EMP_filter(sample_condition = Group %in% c('UC_before','UC_after')) |>
  EMP_diff_analysis(method='DESeq2',.formula = ~Group) |>
  EMP_volcanol_plot(show='html') 