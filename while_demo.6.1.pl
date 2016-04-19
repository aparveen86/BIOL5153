#! /usr/bin/perl


$sum = 0;

print "Please enter the initial value for while loop:  ";

#Testing for valid number
Test:{
$count = <STDIN>;
chomp ($count);
if ($count !~ /^[+]?\d+$/) #only positive integers
{
print "Invalid input! Please enter a valid number:  ";
redo Test;
}
}

print "Please enter a value that will determine how long while loop runs: ";

#Testing for valid number
Test1:{
$max = <STDIN>;
chomp ($max);
if ($max !~ /^[+]?\d+$/) #only positive integers
{
print "Invalid input! Please enter a valid number:  ";
redo Test1;
}
}

#while loop
while( $count <= $max )
{
  print "The count is ", $count, "\n";
  $sum += $count;
  print "The sum is ", $sum, "\n";
  $count++;
}

#printing final values 
print "The final count: $count\n";
print "The sum total was: $sum\n";



exit;







