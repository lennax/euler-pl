#!/usr/bin/perl -w

# 25 January 2011		Lenna Xiao Ping Peterson
#
# sample runtimes
# 100000: 0.320609
# 1000000: 4.639301
# 5000000: 27.549565
# (hash appears to be slower than filling an entire array and running through it)

use Time::HiRes ("gettimeofday", "tv_interval"); 
$start = [gettimeofday];
$maximum = 100000; 

use POSIX;
$stop = ceil(sqrt($maximum));
for $n ( 2 .. $stop ) {
	if ( !$numbers{$n} ) {
		$composite = $n+$n;
		while ($composite <= $maximum) {
			$numbers{$composite} = -1;
			$composite += $n;
		}
	}
}


@keys = sort { $a <=> $b } keys %numbers;
$size = pop @keys;

for $j ( 2 .. $size ) {
	if ( !$numbers{$j} ) {
		push @primes, $j;
	}
}

#print "@primes\n";

$clock = tv_interval($start);
print "$maximum: $clock\n"; 