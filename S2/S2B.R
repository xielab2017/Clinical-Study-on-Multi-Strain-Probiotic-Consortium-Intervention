#S2B Box plot of joint optimal bacterial biomarkers selected through random forest algorithm in UC subgroups
tax <-c('Butyricicoccus','Rothia','Incertae_Sedis','Akkermansia','Veillonella',
        'Bacteroides','Prevotella','Escherichia-Shigella','Erysipelatoclostridium','Parabacteroides','Desulfovibrio')
estimate_group <- 'Subgroup'
col_values <- c("#b09c85", "#8491b4", "#4dbbd5", "#00bc51")

k1 <- MAE |> EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_decostand(method = 'relative') |>
  EMP_filter(sample_condition = Subgroup %in% c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great'),
             feature_condition = str_detect_multi(feature,tax,exact=T),action = 'select') |>
  EMP_assay_extract(action = 'get')

k2 <- MAE |> EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row')  |>
  EMP_coldata_extract(action = 'get') |>
  dplyr::select(primary,Subgroup)

data <- dplyr::left_join(k1,k2,by='primary') |>
  tidyr::pivot_longer(cols = -c(dplyr::all_of(estimate_group),'primary'),
                      values_to = 'value',names_to = 'ID')

data$Group <- factor(data$Subgroup,levels = c('UC_before_poor','UC_before_great','UC_after_poor','UC_after_great'))

data |>
  ggplot(aes(x = ID, y = value, fill = !!dplyr::sym(estimate_group))) +
  geom_boxplot(outlier.color=NA) +
  xlab(NULL) + 
  ggtitle('Feature Boxplot') +
  ylim(c(0,0.2)) +
  scale_fill_manual(values = col_values) +
  theme_bw() + 
  theme(axis.text.x =element_text(angle = 45, hjust = 1,size = 10))