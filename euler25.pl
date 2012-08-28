#!/usr/bin/perl -w

# 29 January 2011		Lenna Xiao Ping Peterson

$seed = 49;
# $phi = 1.618033988749894; 
$phi = (1 + sqrt 5)/2;

for ($seed = 1400; $seed <= 1420; $seed += 1 ) {
	use POSIX;
	$fib = floor(($phi**$seed - (1 - $phi)**$seed)/sqrt 5);
	( $num , $length ) = split /\+/, $fib, 2;
	print "$seed: $fib ($length)\n";
}

# print "$seed: $fib\n";
# can I make it ballpark itself? if (length($fib) < 4) { $seed *= 5; } ?

### $phi ** 1480 == inf ###
### possible pattern in increase in number of digits