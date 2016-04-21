#!/usr/bin/perl

print "Enter the name of the input FASTA file to extract from: ";

$input_filename= <STDIN>;
chomp $input_filename;

$line_number =0;

open (FASTA, $input_filename) || die "Can't open $input_file: $!\n";

while ($line = <FASTA>)
{
$line_number++;

if ($line =~ /\A>/)
{
$header = $line;
}
else 
{
$sequence = $line;

}
}

print "Please enter the start coordinate of the substring: ";
Test2:
{
$start= <STDIN>;
chomp $start;
if ($start !~ /^[+]?\d+$/) 
{ 
print "Invalid number. Re-enter a correct number.";

redo Test2;
}}
print "Please enter the end coordinate of the substring: ";
Test3:
{
$end= <STDIN>;
chomp $end;
if ($end !~ /^[+]?\d+$/)
{ 
print "Invalid number. Re-enter a correct number.";

redo Test2;
}}
#substring 
$extracted_substr = substr ($sequence, $start-1, $end-$start+1);

print "Please enter the strand of feature (forward = 1 and reverse = -1: ";

Test3:{

$strand_feature= <STDIN>;
chomp $strand_feature;

#output fasta file  
my $output_filename = "ouput_file.fasta";
open(OUT, ">$output_filename") || die "can't open $outfile: $!\n";
$header = ">sequencefilename_start_end_strand";

#forward strand
if( $strand_feature == 1)
{
print OUT $header, "\n", $extracted_substr;

}
#reverse strand
elsif($strand_feature == -1)
{

$revcom = reverse $extracted_substr;
$revcom =~ tr/ACGTacgt/TGCAtgca/;
$header = ">sequencefilename_start_end_strand";
print OUT $header, "\n", $revcom;

}
else
{
	print "Invalid input. Enter the strand of feature (forward = 1 and reverse = -1: ";
	redo Test3;

}
}

close FASTA;
close OUT;





exit;

