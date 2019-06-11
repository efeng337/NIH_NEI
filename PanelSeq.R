library(ggplot2)
library(dplyr)
library(tidyr)
stat <- COL003.2.recali.normalized.coverage %>%
  group_by(CHR) %>%
  summarize(avg_of_normalized_autosomal=mean(NORMALIZED_AUTOSOMAL))
stat <- as.data.frame(stat)
chrOrder<-c(paste(1:22,sep=""),"X")
stat$CHR<-factor(stat$CHR, levels=chrOrder)
stat=stat[order(stat$CHR),]
ggplot(stat,aes(x=CHR,y=avg_of_normalized_autosomal))+ 
  #scale_color_discrete (breaks=c("1","2","3","4","5","6","7","8","9","10", "11", "12","13","14","15","16","17","19","20", "21","22","X"))+
  geom_hline(yintercept = 1, color = "red", linetype="dotted")+
  geom_point()+
  scale_y_continuous(breaks=c(0,0.2, 0.4,0.6,0.8,1,1.2,1.4,1.6,1.8,2), limits=c(0,2)) +
  theme_minimal() +
  theme(axis.text.x  = element_text(angle=90, vjust=0.5, size=10)) +
  labs(x = "CHR #", y = "Avg of Normalized Autosomal Read Depths") 
  
getwd()
  


