rm(list=ls())
args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
  process = as.numeric(args[1])
} else {
  cat('usage: Rscript myscript.R <process number>\n', file=stderr())
  stop()
}

df = read.table(paste("extract_",process,".tsv",sep=""), sep = "\t",header=T)
df1 = df[,c("star_rating","helpful_votes","total_votes","review_body","product_category")]
df2 = na.omit(df1)
df3 = df2[df2$total_votes!=0,]
df3$length = sapply(strsplit(df3$review_body, " "), length)
df3$ratio = df3$helpful_votes/df3$total_votes
df4 = df3[,c("product_category","ratio","length","star_rating")]
write.table(df4,paste("clean_",process,".tsv",sep=''), sep = '\t',row.names = F,col.names = F)
