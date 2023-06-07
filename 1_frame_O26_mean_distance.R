data=read.csv(file.choose(),sep=" ",header=FALSE)
head(data)
data2=data[data$V17=="O26",]
data2
data3=cbind(data2$V5,data2$V6,data2$V7)
data3
data3=data.frame(data3)
d1=((data3[1,1]-data3[2:36,1])^2+(data3[1,2]-data3[2:36,2])^2+(data3[1,3]-data3[2:36,3])^2)^(1/2)
l=numeric(630)
k=1
for (i in 1:35){
  for (j in (i+1):36){
  l[k]=((data3[i,1]-data3[j:36,1])^2+(data3[i,2]-data3[j:36,2])^2+(data3[i,3]-data3[j:36,3])^2)^(1/2)
  k=k+1
  }
}
l
mean(l)
scatter3D(data3$X1, data3$X2, data3$X3)
install.packages("plot3D")
library("plot3D")
##### 026 mean distance-1002 frames- ####
data=read.csv("df.txt",header = F,sep = "")
df=na.omit(data)
write.table(df,file = "comple.txt",row.names = F,col.names = F)
df2=df[df$V14=="O26",]
d026=cbind(as.numeric(df2$V3),as.numeric(df2$V4),as.numeric(df2$V5))
d026=as.data.frame(d026)
# distances for each frame
h=numeric(1002)
m=36
for(q in 1:1002){
  l=numeric(630)
  k=1
  for (i in 1:(m-1)){
    for (j in (i+1):m){
      l[k]=((d026[i,1]-d026[j:m,1])^2+(d026[i,2]-d026[j:m,2])^2+(d026[i,3]-d026[j:m,3])^2)^(1/2)
      k=k+1
    }
  }
  h[q]=mean(l)
  m=m+36
  print(q)
}
library(tseries)
plot(ts(h),ylab = "Mean Distance 0",xlab="Frames")
plot(ts(h.max-h))
adf.test(ts(h.max-h))

