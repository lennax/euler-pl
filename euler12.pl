#!/usr/bin/perl -w

# 29 January 2011		Lenna Xiao Ping Peterson

# $triangle = 1;
# $factors = 1;
# $max = 1000;
# for $n ( 2 .. $max) {
# 	$triangle += $n;
	# for $k (2 .. $triangle) {
	# 	push @factor_list, $k;
	# 	# $factors++;
	# 	if (length @factor_list >= 500) { print $triangle; }
	# }	
# }
# print "@factor_list\n";


$seed = 4000;
$max = 4001;
$factors = 1;

for $n ( $seed .. $max ) {
	$triangle = ($n**2 + $n)/2; # calculate non-recursively
	@factor_list = ();
	unless ($n % 20) { print ".\n"; }
	for $k (2 .. $triangle) {
		if ($triangle % $k == 0) {
			push @factor_list, $k;
			# $factors++;
			# if (length @factor_list >= 500) { print $triangle; }
		}
		if ( $#factor_list > 500 ) { 
			print $triangle;
			last;
		}
		if ( $#factor_list > $factors ) {
			$factors = $#factor_list;
		}
	}	
	# print "$triangle: $#factor_list\n";
}
print "max factors: $factors\n";