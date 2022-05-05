rm(list=ls())
args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 2){
  infile= args[1]
  outfile = args[2]
} else {
  cat('usage: Rscript myscript.R <infile> <output tfile>\n', file=stderr())
  stop()
}

df = read.csv(infile, sep = '\t',header= F)
colnames(df) <- c("product_category","ratio","length","star_rating")
df$star_rating = factor(df$star_rating)
df$product_category = factor(df$product_category)
model1 = glm(star_rating ~ length + ratio, data = df, family = "binomial")
model2 = glm(star_rating ~ length * ratio , data = df, family = "binomial")
model3 = glm(star_rating ~ product_category + ratio , data = df, family = "binomial")
model4 = glm(star_rating ~ product_category * ratio , data = df, family = "binomial")
sink(file=outfile)
summary(model1)
summary(model2)
summary(model3)
summary(model4)
sink()
