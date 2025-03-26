#Figure 2C UC group beta diversity analysis, the following code only represents the graph due to p-value calculation, and p-value is calculated using paired t-test separately
MAE |>
  EMP_assay_extract(experiment = 'silva') |>
  EMP_collapse(collapse_by='row',
               estimate_group = 'Genus',method = 'sum',collapse_sep = '+') |>
  EMP_identify_assay(estimate_group = 'Group',method = 'default',min=0.001,min_ratio = 0.6) %>%
  EMP_filter(sample_condition = Group %in% c('UC_before','UC_after')) |>
  EMP_dimension_analysis(method = 'pcoa',distance = 'bray') |>
  EMP_scatterplot(method='t.test',esti='Group',html_height=13,show='p12',ellipse=0.3,group_level=c('UC_before','UC_after'))
