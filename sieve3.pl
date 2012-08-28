#!/usr/bin/perl -w

# 25 January 2011		Lenna Xiao Ping Peterson
# 
# sample runtimes 
# 100000: 0.058407
# 1000000: 0.799151
# 10000000: 8.885771
# 100000000: 98.034666
#
# switched to unless


use Time::HiRes ("gettimeofday", "tv_interval"); 
$start = [gettimeofday];
$maximum = 1000000; 

use POSIX;
$stop = ceil(sqrt($maximum));
for $n ( 2 .. $stop ) {
	unless ( $numbers[$n] ) { 				# first loop: 2 is prime
		$composite = 2*$n; 					# thus 4 cannot be prime
		while ($composite <= $maximum) { 	# set all multiples of 2 composite
			$numbers[$composite] = -1; 
			$composite += $n;
		}
	}
}

for $j ( 2 .. $#numbers ) {
	unless ( $numbers[$j] ) { 	# if the element hasn't been set -1, it's prime
		push @primes, $j;
	}
}

#print "@primes\n";

$clock = tv_interval($start);
print "$maximum: $clock\n"; 