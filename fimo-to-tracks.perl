#!/usr/bin/perl
# Turn FIMO matches into UCSC Genome Browser tracks
# Usage: perl fimo-to-tracks.perl input id gene chromosome start finish strand
# Requires sorted input, e.g. 'sort -n fimo-output.txt'
# @author Chris Herdt
use warnings;

# Part 1, Read in all all of input sequence into the scalar variable $seq
# Open the input file
open(IN, "<", $ARGV[0]);
# Open the output file
open(OUT, ">", $ARGV[3] . "-" . $ARGV[2] . "-fimo.bed");

# print header to file
print OUT "browser position " . $ARGV[3] . ":" . $ARGV[4] . "-" . $ARGV[5] . "\n"; 
print OUT "browser hide all\n"; 
print OUT "browser pack refGene\n";

$track = "";
# Read all lines in the file
while ($line = <IN>) {
  chomp($line);
  @fields = split /\t/, $line;

  # try to match the sequence ID to the input sequnce string
  # and we are only looking for cis-regulatory stuff
  if ($fields[1] eq $ARGV[1] && $fields[4] eq $ARGV[6]) {

    if ($track ne $fields[0]) {
      $track = $fields[0];
      print OUT "track name=motif" . $track . "\t" . "description=FIMO2track\n";
    }

    # pos or neg strand?
    if ($fields[4] eq "+") {
        $start = $ARGV[4] + $fields[2] - 2;
        $end = $ARGV[4] + $fields[3] - 1;
    } else {
        $start = $ARGV[5] - $fields[3];
        $end = $ARGV[5] - $fields[2] + 1;
    }
    print OUT $ARGV[3] . "\t" . $start . "\t" . $end . "\n";
  }
}

# Close the input file
close(IN);
close(OUT);

