#!/usr/bin/perl -w

# 29 January 2011		Lenna Xiao Ping Peterson
# sample runtime: 40.44939

use Time::HiRes ("gettimeofday", "tv_interval"); 
$start = [gettimeofday];

$seed = 2;
$max = 999999;
$max_length = 1;

for $n ( $seed .. $max ) {
	print ".\n" unless $n % 50000;
	$length = 1;
	# print "$n ";
	$cur_seed = $n;
	while ( $n > 1 ) {
		if ( $n % 2 ) {
			$n = 3*$n + 1;
			# print "$n ";
			$length++;
		}
		else {
			$n = $n/2;
			# print "$n ";
			$length++;
		}
	}
	# print "\n";
	if ( $length > $max_length ) {
		$max_length = $length;
		$max_seed = $cur_seed;
	}
}

print "max: $max_length\nmax seed: $max_seed\n";

$clock = tv_interval($start);
print "runtime: $clock\n";