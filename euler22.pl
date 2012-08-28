#!/usr/bin/perl -w

# 29 January 2011		Lenna Xiao Ping Peterson

open(NAMES, "names22.txt") || die; 

@names = split /,/, <NAMES>;

close (NAMES);

%scores = ( A,1, B,2, C,3, D,4, E,5,
		F,6, G,7, H,8, I,9, J,10,
		K,11, L,12, M,13, N,14, O,15,
		P,16, Q,17, R,18, S,19, T,20,
		U,21, V,22, W,23, X,24, Y,25, Z,26
);

# print "$scores{Y}\n";

$row = 1;
for $name ( sort @names ) {
	$name =~ s/"//g;
	$score = 0;
	@tmp = split "", $name;
	for $char (@tmp) {
		$score += $scores{$char};
	}
	# print "$name: $score\n";
	$score *= $row;
	# print "row $row; $score\n";
	$row++;
	$total_score += $score;
}


print "$total_score\n";


