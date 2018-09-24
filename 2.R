
dat = read.csv2("/media/beka/6B0065904B67B69B/Mobile.csv", sep=";",row.names = 1, header= TRUE, encoding = "UTF-8")
dat[1:10, 1:5]
dat[dat>0]<-1

nrow(dat)
ncol(dat)


km<-kmeans(dat, 10)
#km$cluster
#table(km$cluster, rownames(dat))
#km$centers

centers <- km$centers
length(centers)
centers[1:3]

distances <- sqrt(rowSums((dat - centers)^2))
outs <- distances[order(distances, decreasing=T)]
tail(outs)


x1<-dat[km$cluster==1,]
x2<-dat[km$cluster==2,]
x3<-dat[km$cluster==3,]
x4<-dat[km$cluster==4,]
x5<-dat[km$cluster==5,]
x6<-dat[km$cluster==6,]
x7<-dat[km$cluster==7,]
x8<-dat[km$cluster==8,]
x9<-dat[km$cluster==9,]
x10<-dat[km$cluster==10,]


rownames(x1)
rownames(x2)
rownames(x3)
rownames(x4)
rownames(x5)
rownames(x6)
rownames(x7)
rownames(x8)
rownames(x9)
rownames(x10)


idx <- 9
x<-dat[km$cluster==idx,]
one.cluster<-rownames(x)

rows.to.keep<-which(rownames(dat) %in% one.cluster)
cols.to.keep<-head(order(centers[idx,], decreasing=T),100)
mio<-dat[rows.to.keep,cols.to.keep]

mio.cluster<-kmeans(mio, 5)
for (i in 1:5){
  print(mio[mio.cluster$cluster==i,1:3])
}


write.table(mio, file ="~/Рабочий стол/10.csv",quote = F,row.names=TRUE,sep=";")



d <- dist(mio, method = "binary") # distance matrix
fit <- hclust(d, method="ward.D2") 
plot(fit) # display dendogram

fit <- hclust(d, method="single") 
plot(fit) # display dendogram
attributes(fit)
fit[4]
