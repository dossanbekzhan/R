df = read.csv2("/media/beka/6A8C1F5C8C1F21DD/Users/Admin/IdeaProjects/Ontology/KeyAndValue.csv",sep = ";",header = TRUE)



df.out <- setNames(
  data.frame(rep(rownames(df), each = ncol(df)), stack(df)[c(2, 1)]),
  c("row", "col", "val"))

library(reshape2)
dw <-melt(as.matrix(df))

write.table(dw, "/media/beka/6A8C1F5C8C1F21DD/Users/Admin/IdeaProjects/Ontology/Data.txt", quote=F, sep=";", col.names=F, row.names=F)
