#Figure 4G Analysis of functional differences in IBS group KO
MAE |>
  EMP_assay_extract('ko') |>
  EMP_filter(sample_condition = Group %in% c('IBS_before','IBS_after')) |>
  EMP_diff_analysis(method='DESeq2',.formula = ~Group) |>
  EMP_volcanol_plot(show='html') 
ggsave(filename = 'pic/图4G.pdf',width = 12,height = 12)