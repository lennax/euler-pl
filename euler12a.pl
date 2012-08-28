#!/usr/bin/perl -w

# 29 January 2011		Lenna Xiao Ping Peterson

use Time::HiRes ("gettimeofday", "tv_interval"); 
$start = [gettimeofday];

$seed = 1;
$triangle = ($seed**2 + $seed)/2; # calculate nth term
$max = 12376;
$max_factors = 2;

for $n ( $seed+1 .. $max ) {
	$triangle += $n; 	# calculate recursively
	print ".\n" unless $n % 500; 
	$factors = 2; # every number is divisible by 1 and itself
	for $k (2 .. sqrt $triangle) {
		$factors += 2 unless $triangle % $k; # if k is a factor 
	}		
	$max_factors = $factors if $factors > $max_factors;
	if ( $factors >= 500 ) { 
		print "triangle: $triangle\n";
		last;
	}	
}
print "max factors: $max_factors\n";

$clock = tv_interval($start);
print "runtime: $clock\n";