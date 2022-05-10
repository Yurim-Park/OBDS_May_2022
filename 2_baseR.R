data("iris")
coding_gene_region <- read.table(file="/project/obds/shared/resources/2_r/baseR/coding_gene_region.bed", header=FALSE, sep = "\t")
View(coding_gene_region)
dim(coding_gene_region)
nrow(coding_gene_region)
ncol(coding_gene_region)

colnames(coding_gene_region)<- c("chr", "start", "stop", "name", "score", "strand")
coding_gene_region[30,3]
start_subset <- coding_gene_region$start

coding_gene_region$int_length <- coding_gene_region$stop - coding_gene_region$start
medium_size <- coding_gene_region[coding_gene_region$int_length >= 100001 & coding_gene_region$int_length<=200000,]
medium_size_new <- subset(coding_gene_region, int_length >= 100001 & int_length<=200000)
identical(medium_size, medium_size_new)

#Save the subset file with no quote
write.table(medium_size, file = "subset_medium_size_coding_gene_region.txt", col.names = TRUE, row.names = FALSE, sep = "\t", quote = FALSE)
