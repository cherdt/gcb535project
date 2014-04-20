#!/usr/bin/perl
# Find substrings
# @author Chris Herdt
use warnings;

# Part 1, Read in all all of input sequence into the scalar variable $seq
# Open the input file
open(IN, "<", $ARGV[0]);

$seq = "";
# Read all lines in the file
while ($line = <IN>) {
  chomp($line);
  # only include lines of sequence
  if ($line !~ />/) {
    $seq .= $line;
  }
}

# Close the input file
close(IN);

# Part 2: Find the positions of all substring matches in $seq 
# and "push" those positions into the array @match_pos
$seq = uc($seq); # make $seq all uppercase, to make matching easier
@match_pos = ();
while($seq =~ /$ARGV[1]/g) {
  push @match_pos, $-[0];
}

# Part 3: Print out all substring match positions
# Open the output file, substring_matches.txt, for writing
open(OUT, ">", $ARGV[0] . ".matches.txt");

# Write each item in the match_pos array to the file, one per line
for ($i = 0; $i < scalar @match_pos; $i++) {
  print OUT $match_pos[$i], "\n";
}

# Close the output file
close OUT;
