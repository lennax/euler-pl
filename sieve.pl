#!/usr/bin/perl -w

# 25 January 2011		Lenna Xiao Ping Peterson
# 
# sample runtimes
# 100000: 0.066562
# 1000000: 0.84392
# 10000000: 9.443371
# 100000000: 104.505623
#

use Time::HiRes ("gettimeofday", "tv_interval"); 
$start = [gettimeofday];
#print "start: $start\n";
$maximum = 100000000; 

for $i ( 0 .. $maximum ) {
	$numbers[$i] = 0; 	# fill array with 0 (prime until proven composite)

}
$numbers[0] = -1;
$numbers[1] = -1;

use POSIX;
$stop = ceil(sqrt($maximum));
for $n ( 2 .. $stop ) {
	if ( $numbers[$n] == 0 ) { 				# first loop: 2 is prime
		$composite = 2*$n; 					# thus 4 cannot be prime
		while ($composite <= $maximum) { 	# set all multiples of 2 composite
			$numbers[$composite] = -1; 
			$composite += $n;
		}
	}
}




for $j ( 2 .. $#numbers ) {
	if ( $numbers[$j] == 0 ) { 	# if the element is still 0, it's prime
		push @primes, $j;
	}
}

#print "@primes\n";

$clock = tv_interval($start);
print "$maximum: $clock\n"; 