
library(dplyr)
library(ggplot2)
library(ggrepel)
full_data=read.csv("G:\\My Drive\\ADNI\\Haoran\\GM\\UASPMVBM.csv",header=TRUE)
head(full_data)

Roster=read.csv("G:\\My Drive\\ADNI\\DATA\\ROSTER.csv",header=TRUE)
head(Roster)


PC_new=read.csv("G:\\My Drive\\ADNI\\Haoran\\features_WI_with_aug_with_chr.csv",header=TRUE)
PC_new



attach(PC_new)


Combined=c()
for(i in 1: nrow(PC_new))
{
  Index=which(full_data$RID==PC_new$rid[i])
  Index=Index[1]
  if(is.na(Index)==FALSE)
  {
    Combined<-rbind(Combined,cbind(PC_new[i,c(2:11)], full_data[Index,14:ncol(full_data)-2]))
  }
}
#colnames(Combined)[11]<-c("character")
dim(Combined)
#View(Combined)




Combined<-as.data.frame(Combined)

attach(Combined)



pval=c()

for (i in 11:ncol(Combined)) 
  
  {
  result=summary(lm(Combined$PC3~Combined[,i]))
  pval=c(pval,result$coefficients[2,4]) # record p-values of t-test
  
  
}

#pval[which((-log(pval))>4)]

data<-as.data.frame(cbind(-log(pval),c(1:length(pval))))
colnames(data)<-c("p_value","Index")
data$LABEL1<-colnames(Combined)[11:ncol(Combined)]

#View(data)
LABEL=colnames(Combined)[11:ncol(Combined)]
colnames(Combined)[which.max(-log(pval))+10]
#par(mfrow=c(2,1))
df <-  data %>%
  filter((p_value > 40 & Index>0) )
First<-ggplot(data,aes(x=Index,y=p_value), xlab="ROI Index")+geom_point()+
  geom_text_repel(data=df,aes(x=Index,y=p_value,label=LABEL1), size = 3,col="RED")+
  xlab("ROI Index")+ylab("-log(p_value)")
#First

#Second<-ggplot(data,aes(x=Index,y=p_value))+geom_point()+
#  geom_text_repel(aes(label =LABEL), size = 3,,col="RED")+xlab("ROI Index")+ylab("-log(p_value)")

First+Second
df <-  data %>%
  filter((p_value > 4&Index>0) )
Second<-ggplot(data,aes(x=Index,y=p_value))+geom_point()+
  geom_text_repel(data=df,aes(x=Index,y=p_value,label=LABEL1),size = 3,,col="RED")+
  xlab("ROI Index")+ylab("-log(p_value)")



length(LABEL)

library(gridExtra)
grid.arrange(First, Second, nrow = 2)

