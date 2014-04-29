# This R script will read in a tab-separated file in this format:
# Gene	Chr	Chars	Lines	Length	MotifN	MotifN+1	etc.
#   Gene: a gene label, e.g. Oprk1
#   Chr: chromosome number
#   Chars: the number of characters in all the associates hotspots
#   Lines: the number of lines in the associates hotspots
#   Length: Chars-Lines (each line has an LF character)
# It then performs calculations to find the ratio of 
# hotspot-overlapping motif sites to the number of hotspot basepairs
# and then performs a one-sides Wilcoxon rank sum (AKA Mann Whitney U test)
# to compare the target gene ratio against the background gene ratio

cat("Read in table of hotspot lengths...\n")
data = read.table("/Users/cherdt/GCB535/project/hotspot1-lengths.tsv", TRUE)

# Create a subset of the table with only the motif sites
motifsites <- data[,c(6:15)]

hotspotlengths <- data[,c(5)]
# Create a table containing the ratio of motif sites to hotspot basepairs
sitesperhotspotbase <- motifsites / t(hotspotlengths)

header <- "\n\nMann-Whitney U Test for: "
# Run Mann-Whitney U Test for each ratio (motif site:hotspot basepair)

# I don't know why my FOR loop didn't work here....
cat(paste(header, colnames(sitesperhotspotbase[1])))
wilcox.test(sitesperhotspotbase[1:6, 1], sitesperhotspotbase[7:16, 1], alternative=c("greater"))

cat(paste(header, colnames(sitesperhotspotbase[2])))
wilcox.test(sitesperhotspotbase[1:6,2],sitesperhotspotbase[7:16,2], alternative=c("greater"))

cat(paste(header, colnames(sitesperhotspotbase[3])))
wilcox.test(sitesperhotspotbase[1:6,3],sitesperhotspotbase[7:16,3], alternative=c("greater"))

cat(paste(header, colnames(sitesperhotspotbase[4])))
wilcox.test(sitesperhotspotbase[1:6,4],sitesperhotspotbase[7:16,4], alternative=c("greater"))

cat(paste(header, colnames(sitesperhotspotbase[5])))
wilcox.test(sitesperhotspotbase[1:6,5],sitesperhotspotbase[7:16,5], alternative=c("greater"))

cat(paste(header, colnames(sitesperhotspotbase[6])))
wilcox.test(sitesperhotspotbase[1:6,6],sitesperhotspotbase[7:16,6], alternative=c("greater"))

cat(paste(header, colnames(sitesperhotspotbase[7])))
wilcox.test(sitesperhotspotbase[1:6,7],sitesperhotspotbase[7:16,7], alternative=c("greater"))

cat(paste(header, colnames(sitesperhotspotbase[8])))
wilcox.test(sitesperhotspotbase[1:6,8],sitesperhotspotbase[7:16,8], alternative=c("greater"))

cat(paste(header, colnames(sitesperhotspotbase[9])))
wilcox.test(sitesperhotspotbase[1:6,9],sitesperhotspotbase[7:16,9], alternative=c("greater"))

cat(paste(header, colnames(sitesperhotspotbase[10])))
wilcox.test(sitesperhotspotbase[1:6,10],sitesperhotspotbase[7:16,10], alternative=c("greater"))

