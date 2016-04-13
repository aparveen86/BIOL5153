#! /usr/bin/perl

use strict; 
use warnings;

my $start = 0;
my $end = 32;
my $strand = 1; #1 means forward, -1 means reverse, 0 is non relevant

my $dna= "ATGGCCATTGTAATGGGCCGCTGAAAGGGTGCCCGATAG";

print "$dna\n";
my $sub_dna = substr ($dna, $start, 3);
print "$sub_dna\n";
if ($sub_dna eq "ATG")
{ 
$strand =1;
print "$strand\n The gene is on the forward strand.\n";
} 

else 
{
my $revcom = reverse ($dna);
$revcom =~ tr/ACGTacgt/TGCAtgca/;
print "$revcom\n";
my $sub_rcdna = substr ($revcom, $start, 3);
print "$sub_rcdna\n";
if ($sub_rcdna eq "ATG")
{ 
$strand = -1;
print "$strand\n The gene is on the reverse strand.\n";
} 

else
{}
}

exit;


