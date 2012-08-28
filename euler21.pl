#!/usr/bin/perl -w

# 1 February 2011		Lenna Xiao Ping Peterson
# coded in 42 minutes

$max = 10000;

for $n ( 1 .. $max ) {
	$sum = 1;
	for $k ( 2 .. $n-1 ) {
		unless ( $n % $k ) {
			$sum += $k;
		}
	}
	$sums{$n} = $sum;
}

# d(j) == k
# d(k) == j
#    k != j

for $j (sort keys %sums) {
	$d_j = $sums{$j};
	# print "$d_j\n";
	$d_k = $sums{$d_j} if $d_j <= $max;
	# print "$d_k\n";
	if ( $j == $d_k && $d_j != $d_k && !$amicable{$d_j}) {
		$amicable{$j} = $d_j;
	}
}

# 1184, 1210
# 220, 284
# 2620, 2924
# 5020, 5564
# 6232, 6368

for $i (sort keys %amicable) {
	$total += $i;
	$total += $amicable{$i};
}

print "$total\n";