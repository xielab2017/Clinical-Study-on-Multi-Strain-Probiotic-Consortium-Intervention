#Figure 2D,E UC group based on genus level random forest model
#Result Output result file name
#├── RFCV_result Summary of Microbial Species Level Random Forest Model Results
#│   ├── model Figure2D Random Forest Cross Validation Error Rate Curve
#│   ├── Imprortance Figure2E,S1C Importance assessment of random forest species under different random number seeds


library(EasyMicroPlot) 
df<-read.csv('level-6.csv',header = T)
mapping<-read.csv('UCmapping.csv')
meta_data<-read.csv('metadata.csv')
EMP_MICRO(data  = df,design = mapping,set_color_level='genus',RFCV_estimate='genus',
          min_relative = 0.001,min_ratio = 0.6,pattern = 'txt')


