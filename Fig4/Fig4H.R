#Figure 4H KEGG enrichment analysis based on KO annotation, screening for metabolic pathways associated with IBS with p<0.05
tax <-c('Fructose and mannose metabolism','Glyoxylate and dicarboxylate metabolism','Propanoate metabolism'
        ,'Pyruvate metabolism','Biosynthesis of amino acids')
MAE |>
  EMP_assay_extract(experiment = 'ko') |>
  EMP_filter(sample_condition = Group %in% c('IBS_before','IBS_after')) |> 
  EMP_diff_analysis(method='DESeq2',.formula = ~Group)|> 
  EMP_enrich_analysis(condition = pvalue<0.05,keyType ='ko',KEGG_Type = 'KEGG',
                      pvalueCutoff=0.05,species = 'hsa',combineGroup = TRUE) |>
  EMP_enrich_dotplot(showCategory=tax)