# read the data set
data=read.csv(file.choose(),header = F,sep = "")
df=na.omit(data)
#write.table(df,file = "comple.txt",row.names = F,col.names = F)
# wchich element you want
df2=df[df$V14=="O26",]
# which column you want
d026=cbind(as.numeric(df2$V3),as.numeric(df2$V4),as.numeric(df2$V5))
d026=as.data.frame(d026)
#distances for each frame
h.max=numeric(1002)
h.min=numeric(1002)
h=numeric(1002)
m=36
for(q in 1:1002){
  l=numeric(630)
  k=1
  for (i in (m-35):(m-1)){
    for (j in (i+1):m){
      l[k]=((d026[i,1]-d026[j:m,1])^2+(d026[i,2]-d026[j:m,2])^2+(d026[i,3]-d026[j:m,3])^2)^(1/2)
      k=k+1
    }
  }
  h.max[q]=max(l)
  h.min[q]=min(l)
  h[q]=mean(l)
  m=m+36
  print(q)
}
fd024=cbind(h.max,h.min,h)
# how many frames have max distance-mean distance over 40
sum(h.max-h>40)
o40=which(h.max-h>40)
h40-numeric(888)
m=36
for(q in 1:888){
  l=numeric(630)
  k=1
  for (i in (m-35):(m-1)){
    for (j in (i+1):m){
      l[k]=((d026[i,1]-d026[j:m,1])^2+(d026[i,2]-d026[j:m,2])^2+(d026[i,3]-d026[j:m,3])^2)^(1/2)
      k=k+1
    }
  }
  if (q!=)
  m=m+36
  print(q)
}
adf.test(h)
hist(h)
shapiro.test(h)
adf.test(h)
             