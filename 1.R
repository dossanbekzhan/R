#read file 
  KeyandValue = read.table('/media/beka/6B0065904B67B69B/Mobile.txt',sep=';',header = FALSE)

#set name for table
tableForData <- table(KeyandValue$V1,KeyandValue$V2)
tableForData[tableForData > 1] <- 1

#view table
View(tableForData)

#write matrix
csvFile<- write.table(tableForData,file = "/media/beka/6B0065904B67B69B/Mobile.csv",quote = F,sep = ";")
write.csv(csvFile)
