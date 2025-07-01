library(tidyverse)
library(DBI)
library(reshape)
library(viridis)

# read and process data 

pmr4expr <- read.delim("frpkm.tsv", header = TRUE)
meltexpr <- melt(pmr4expr)

# create samplekey

samplekey <- data.frame(variable = c("ERR1817363", "ERR1817364", "ERR1817365", "ERR1817366", "ERR1817367", "ERR1817368", "SRR10076578", "SRR10076579", "SRR10076584", "SRR10076587", "SRR11794975", "SRR11794980", "SRR5241935", "SRR5241937", "SRR5241942", "SRR5826131", "SRR5826134", "SRR5826136", "SRR5826138", "SRR6995967", "SRR6995969", "SRR6995971", "SRR7157738", "SRR7157740", "SRR8298763", "SRR8298764", "SRR8298765", "SRR8298766", "SRR8298767", "SRR8298768", "SRR8298769", "SRR8298770", "SRR8298771", "SRR8298772"), sample = c("Leaf 1", "Leaf 2", "Leaf 3", "Root 1", "Root 2", "Root 3", "Sunnyberry Whole Fruit 1", "Sunnyberry Whole Fruit 2", "Kingsberry Whole Fruit 1", "Kingsberry Whole Fruit 2", "Leaf XANTH 1", "Leaf XANTH 2", "Leaf COLL 96h", "Leaf COLL 72h", "Leaf COLL 24h", "Toyonoka Green Fruit", "Toyonoka White Fruit", "Toyonoka Turning Fruit", "Toyonoka Red Fruit", "Hongjia Green Fruit", "Hongjia Turning Fruit", "Hongjia Red Fruit", "Leaf SA 1", "Leaf SA 2", "Camarosa Runner", "Camarosa Leaf MJ 24hr", "Camarosa Leaf MJ 4hr", "Camarosa Leaf MJ 30min", "Camarosa Leaf Night", "Camarosa Leaf Day", "Camarosa Flower Anthesis", "Camarosa Flower Bud", "Camarosa Root Salt", "Camarosa Root"))

# merge key to data

finalexpr <- full_join(meltexpr, samplekey, by = "variable")
colnames(finalexpr) <- c("gene", "variable", "value", "sample")

# heatmap

png("pmr4exp.png", width = 21, height = 15, units = "cm", res = 900)

myplot <- ggplot(finalexpr, aes(sample, gene)) + geom_tile(aes(fill = value)) + scale_fill_viridis(name = "RPKM") + labs(title = "PMR4 Homeologue Expression", x = "Sample", y = "Gene") + theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(myplot)
dev.off()
