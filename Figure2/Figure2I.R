#Figure 2I KEGG enrichment analysis based on KO annotation, screening for metabolic pathways associated with UC with p<0.05
tax <-c('Pyruvate metabolism','Biosynthesis of amino acids','Pyrimidine metabolism'
        ,'Fatty acid biosynthesis','Arginine biosynthesis','Butanoate metabolism',
        'Lipoic acid metabolism','Glycolysis / Gluconeogenesis','Fatty acid metabolism',
        'Biosynthesis of amino acids','Pentose phosphate pathway','Galactose metabolism')
MAE |>
  EMP_assay_extract(experiment = 'ko') |>
  EMP_filter(sample_condition = Group %in% c('UC_before','UC_after')) |> 
  EMP_diff_analysis(method='DESeq2',.formula = ~Group)|> 
  EMP_enrich_analysis(condition = pvalue<0.05,keyType ='ko',KEGG_Type = 'KEGG',
                      pvalueCutoff=0.05,species = 'hsa',combineGroup = TRUE) |>
  EMP_enrich_dotplot(showCategory=tax)