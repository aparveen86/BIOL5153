#! /usr/bin/perl 


my $usage = "\nUsage: $0 fasta-file \n\n";
$ARGV[0] or die $usage;


open (PHYLIP,$ARGV[0]) || die "Cant open $ARGV[0]";

while($line = <PHYLIP>) {
	chomp $line;
	next if (!$line || $line =~ /\d+\s+\d+/);
	if($line =~ /^(.*)\s+(\S+)\s*$/) {
		$name = $1;
		$sequence = $2;
		$name =~ s/\s+$//;
		print ">$name\n$sequence\n";
	}
}
close PHYLIP;


exit;