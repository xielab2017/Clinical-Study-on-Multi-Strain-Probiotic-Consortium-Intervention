#Figure 2A The following script only draws a paired plot of UCEIS index before and after UC intervention, and the P-value is calculated using a paired t-test separately
install.packages("PairedData")
library("PairedData")
before <-c(2,4,2,3,4)
after <-c(0,1,2,2,2)
my_data <- data.frame( 
  group = rep(c("before", "after"), each = 5),
  UCEIS = c(before,  after))

before <- subset(my_data,  group == "before", UCEIS,
                 drop = TRUE)
after <- subset(my_data,  group == "after", UCEIS,
                drop = TRUE)
pd <- paired(before, after)
plot(pd, type = "profile") + theme_bw()


