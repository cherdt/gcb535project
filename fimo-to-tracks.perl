#!/usr/bin/perl
# Turn FIMO matches into UCSC Genome Browser tracks
# Usage: perl fimo-to-tracks.perl input id chromosome start finish strand
# @author Chris Herdt
use warnings;

# Part 1, Read in all all of input sequence into the scalar variable $seq
# Open the input file
open(IN, "<", $ARGV[0]);
# Open the output file
open(OUT, ">", $ARGV[2] . "-fimo.bed");

# print header to file
print OUT "browser position " . $ARGV[2] . ":" . $ARGV[3] . "-" . $ARGV[4] . "\n"; 
print OUT "browser hide all\n"; 
print OUT "browser pack refGene\n";

$track = "";
# Read all lines in the file
while ($line = <IN>) {
  chomp($line);
  @fields = split /\t/, $line;

  # try to match the sequence ID to the input sequnce string
  # and we are only looking for cis-regulatory stuff
  if ($fields[1] eq $ARGV[1] && $fields[4] eq $ARGV[5]) {

    if ($track ne $fields[0]) {
      $track = $fields[0];
      print OUT "track name=motif" . $track . "\t" . "description=FIMO2track\n";
    }

    # pos or neg strand?
    if ($fields[4] eq "+") {
        $start = $ARGV[3] + $fields[2] - 2;
        $end = $ARGV[3] + $fields[3] - 1;
    } else {
        $start = $ARGV[4] - $fields[3];
        $end = $ARGV[4] - $fields[2] + 1;
    }
    print OUT $ARGV[2] . "\t" . $start . "\t" . $end . "\n";
  }
}

# Close the input file
close(IN);
close(OUT);

# Part 2: Find the positions of all substring matches in $seq 
# and "push" those positions into the array @match_pos
#@match_pos = ();
#while($seq =~ /$ARGV[1]/g) {
#  push @match_pos, $-[0];
#}

# Part 3: Print out all substring match positions
# Open the output file, substring_matches.txt, for writing
#open(OUT, ">", $ARGV[0] . ".matches.txt");

# Write each item in the match_pos array to the file, one per line
#for ($i = 0; $i < scalar @match_pos; $i++) {
#  print OUT $match_pos[$i], "\n";
#}

# Close the output file
#close OUT;
