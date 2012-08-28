#!/usr/bin/perl -w

@numbers = qw(2 3 4 5 6);

for $n (@numbers) {
	unless ($n % 3) { print "$n is divisible by 3\n"; }
}

print "-" x 20;
print "\n";

$seed = 76576500;
$factors = 2;
for $k ( 2 .. $seed-1 ) {
	unless ($seed % $k) {
		$factors++;
	} 
}
print "$factors\n";

$factors = 2;
for $k ( 2 .. sqrt $seed ) {
	unless ( $seed % $k ) { $factors += 2; }
}
print "sqrt $factors\n";