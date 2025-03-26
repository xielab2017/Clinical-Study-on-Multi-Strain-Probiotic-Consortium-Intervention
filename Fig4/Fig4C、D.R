#Figure4C,D Random forest model based on genus level
#Result Output result file name
#├── RFCV_result Summary of Microbial Species Level Random Forest Model Results
#│   ├── model Figure4C Random Forest Cross Validation Error Rate Curve
#│   ├── Imprortance Figure4D、S3D Importance assessment of random forest species under different random number seeds

library(EasyMicroPlot) # 加载包
df<-read.csv('level-6.csv',header = T)
mapping<-read.csv('IBSmapping.csv')
EMP_MICRO(data  = df,design = mapping,set_color_level='genus',RFCV_estimate='genus',
          min_relative = 0.001,min_ratio = 0.6,pattern = 'txt')


