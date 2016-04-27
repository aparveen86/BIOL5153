#! /usr/bin/perl


my $usage = "\nUsage: $0 fasta-file \n\n";
$ARGV[0] or die $usage;
	
$count=0;
$char=0;
@seqs;
@species;
$seq;
$maxlength; 


open (FASTA,$ARGV[0]) || die "Cant open $ARGV[0]";	

while ($line=<FASTA>) {
	chomp $line;
	if ($line=~/^\A>/) 
	{ 
		chomp $line; 
		@poo=split(/\>/,$line); 
		
		$count++;
		
		unless ($species[0] eq '') 
		{
		push @seqs,$seq;
		}
		push @species,$poo[1]; 
		$seq=''; 
		$char=0;
		next;
		 }
	else 
	{ 
	$char=$char+length $line; 
	$seq=$seq.$line; 
	
	if ($maxlength<$char) 
	{
	$maxlength=$char;
	} 
	}

}
push @seqs,$seq;
print $count, " ", $maxlength; # first line with total no of species and total length of an aligned seq

for ($i=0;$i<scalar@species;$i++)
 {
	$len=length$seqs[$i];
	
	if ($len<$maxlength) 
	{ 
	$add=$maxlength-$len; 
	
	for (my $j=0; $j<$add; $j++) 
	{
	$seqs[$i]=$seqs[$i].'-'; #adding gaps
	}
	}
	print "\n$species[$i]\t$seqs[$i]"; #Header and sequences
}
print "\n";


close FASTA;



exit;

