#Figure3E,F UC subgroup based on genus level random forest model
#Result Output result file name
#├── RFCV_result Summary of Microbial Species Level Random Forest Model Results
#│   ├── model Figure3E Random Forest Cross Validation Error Rate Curve
#│   ├── Imprortance Figure3F、S2C Importance assessment of random forest species under different random number seeds

library(EasyMicroPlot) # 加载包
df<-read.csv('level-6.csv',header = T)
mapping<-read.csv('UCyazumapping.csv')
meta_data<-read.csv('metadata.csv')
EMP_MICRO(data  = df,design = mapping,set_color_level='genus',RFCV_estimate='genus',
          min_relative = 0.001,min_ratio = 0.6,pattern = 'txt')

