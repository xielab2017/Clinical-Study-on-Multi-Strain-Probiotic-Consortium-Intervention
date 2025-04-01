#S1B Box plot of relative abundance of joint optimal bacterial biomarkers selected by random forest algorithm in UC group
tax <-c('Akkermansia','Enterobacteriaceae_unclassified','Erysipelotrichaceae_UCG-003','Romboutsia',
        'Agathobacter','Escherichia-Shigella')
estimate_group <- 'Group'
col_values <- c("#AD9984", "#7A5F47", "#7E89AA", "#394F7D")

k1 <- MAE |> EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_decostand(method = 'relative') |> 
  EMP_filter(sample_condition = Group %in% c('UC_before','UC_after'),
             feature_condition = str_detect_multi(feature,!!tax,exact=F),action = 'select') |>
  EMP_assay_extract(action = 'get')

k2 <- MAE |> EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row')  |>
  EMP_coldata_extract(action = 'get') |>
  dplyr::select(primary,Group)

data <- dplyr::left_join(k1,k2,by='primary') |>
  tidyr::pivot_longer(cols = -c(dplyr::all_of(estimate_group),'primary'),
                      values_to = 'value',names_to = 'ID')

data$Group <- factor(data$Group,levels = c('UC_before','UC_after'))

data |>
  ggplot(aes(x = ID, y = value, fill = !!dplyr::sym(estimate_group))) +
  geom_boxplot(outlier.color=NA) +
  xlab(NULL) + 
  ggtitle('Feature Boxplot') +
  ylim(c(0,0.2)) +
  scale_fill_manual(values = col_values) +
  theme_bw() + 
  theme(axis.text.x =element_text(angle = 45, hjust = 1,size = 10))
