library(tidyverse)
library(DBI)

#read in files

countpath <- "Counted/allcounts.tsv"
genelengthpath <- "rrgenelengths.tsv"

counts <- read.delim(countpath, header=FALSE, sep="\t")
counts <- as.data.frame(counts)
colnames(counts) <- c("gene", "ERR1817363", "ERR1817364", "ERR1817365", "ERR1817366", "ERR1817367", "ERR1817368", "SRR10076578", "SRR10076579", "SRR10076584", "SRR10076587", "SRR11794975", "SRR11794980", "SRR5241935", "SRR5241937", "SRR5241942", "SRR5826131", "SRR5826134", "SRR5826136", "SRR5826138", "SRR6995967", "SRR6995969", "SRR6995971", "SRR7157738", "SRR7157740", "SRR8298763", "SRR8298764", "SRR8298765", "SRR8298766", "SRR8298767", "SRR8298768", "SRR8298769", "SRR8298770", "SRR8298771", "SRR8298772")
counts <- sqlColumnToRownames(counts, row.names="gene")

genelengths <- read.delim(genelengthpath, header=TRUE, sep="\t")
genelengthvect <- as.vector(genelengths[,2])

#calculate reads per kilobase per million (rpkm)

rpkm.fun <- function(column) {
	
	10^9 * column/genelengthvect/sum(column)
}
exp.rpkm <- data.frame(sapply(counts, rpkm.fun))

#write output

counts <- sqlRownamesToColumn(counts, row.names = "gene")
output <- cbind(counts$gene, exp.rpkm)

summary(output)

write.table(output, "rpkm.tsv", sep="\t", quote=FALSE, row.names=FALSE)
