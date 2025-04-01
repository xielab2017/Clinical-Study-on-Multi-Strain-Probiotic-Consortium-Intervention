#S4C Box plot of joint optimal bacterial biomarkers selected through random forest algorithm in IBS subgroups
tax <-c('Blautia','Clostridium_sensu_stricto_1','[Ruminococcus]_gnavus_group','Bacteroides',
        'Dorea','Lachnospiraceae_NK4A136_group','Lactobacillus','Subdoligranulum','Roseburia'
        ,'Collinsella','Streptococcus','Lachnospiraceae_unclassified')
estimate_group <- 'Subgroup'
col_values <- c("#AD9984", "#7A5F47", "#7E89AA", "#394F7D")

k1 <- MAE |> EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_decostand(method = 'relative') |> 
  EMP_filter(sample_condition = Subgroup %in% c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great'),
             feature_condition = str_detect_multi(feature,{{tax}},exact=T),action = 'select',use_cached = F) |>
  EMP_assay_extract(action = 'get')

k2 <- MAE |> EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row')  |>
  EMP_coldata_extract(action = 'get') |>
  dplyr::select(primary,Subgroup)

data <- dplyr::left_join(k1,k2,by='primary') |>
  tidyr::pivot_longer(cols = -c(dplyr::all_of(estimate_group),'primary'),
                      values_to = 'value',names_to = 'ID')

data$Group <- factor(data$Subgroup,levels = c('IBS_before_poor','IBS_before_great','IBS_after_poor','IBS_after_great'))

data |>
  ggplot(aes(x = ID, y = value, fill = !!dplyr::sym(estimate_group))) +
  geom_boxplot(outlier.color=NA) +
  xlab(NULL) + 
  ggtitle('Feature Boxplot') +
  ylim(c(0,0.2)) +
  scale_fill_manual(values = col_values) +
  theme_bw() + 
  theme(axis.text.x =element_text(angle = 45, hjust = 1,size = 10))
ggsave(filename = 'pic/ibsYAZUBUCHONG.pdf',width = 10,height = 8)
