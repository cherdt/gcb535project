# GCB535 Project - finding cis-regulatory elements
This project is primarily about motif-finding.
It's a little unorganized, some of the info is here,
some is at [http://osric.com/chris/gcb535/project/links.html],
and some is hanging around in Google Docs.

## Basic Outline
1. Download RefSeq sequences for genes-of-interest (use mm9).
2. Use MEME to find overexpressed motifs in the pre-identified group of 6 genes that are co-regulated.
3. Use FIMO to find all instances of the motifs in all genes-of-interest.
4. Compare matches from FIMO to UW DNase hypersensitivity sites/hotspots in cerebrum tissue. This uses mm9, which is why we used mm9 above.
5. Are the motifs of interest that align to DNase HS hotspots more common in the co-regulated genes? (and how do we normalize this?)
6. If all else fails, run oPOSSUM3 using the co-regulated genes as foreground and the other genes as background.

### hotspots1-length.tsv
Something cobbled together. It lists the length of the total hotspots in each gene region (the sum of the count of basepairs) and also the count of motifs that overlap any of those hotspots. Makes perfect sense, right?
