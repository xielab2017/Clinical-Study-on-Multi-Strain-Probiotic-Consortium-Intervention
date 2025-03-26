#Figure 4E Differential analysis of IBS microbiota (paired Wilcox test)
assay_df <- MAE |>
  EMP_assay_extract('silva') |>
  EMP_collapse(estimate_group = 'Genus',collapse_by = 'row') |>
  EMP_identify_assay(method='default',estimate_group = 'Group',min=0.001,min_ratio = 0.6) |>
  EMP_decostand(method = 'relative') |>
  EMP_filter(sample_condition = Group %in% c('IBS_before','IBS_after')) %>%
  tidybulk::tidybulk() %>%
  dplyr::arrange(Group,.sample) 

assay_df$Group <- factor(assay_df$Group,levels = c('IBS_before','IBS_after'))

compare <- combn(as.character(unique(assay_df[['Group']])),2) %>%
  plyr::alply(2)

ggpubr::ggpaired(assay_df,x = "Group", y = "counts",
                 color = "Group", line.color = "gray", line.size = 0.4,
                 palette = "npg") +
  ggpubr::stat_compare_means(comparisons = compare,method = 'wilcox.test',paired = TRUE) +
  facet_wrap(.feature~., scales = 'free', strip.position = 'top',ncol = NULL) +
  xlab(NULL) + 
  ggtitle('Feature Boxplot') +
  theme_bw() + 
  theme(axis.text.x =element_text(angle = 45, hjust = 1,size = 10))
