#!/usr/local/bin/perl

# Generate table of profile results from srun[0-9].txt
# Want to measure time spent
# sorting: sort_words
# lower case: lower1 or lower2
# Hash function: h_xor or h_add
# Walking linked list: find_ele_rec, find_ele_iter_f, find_ele_iter_r
# Misc: Everything else summed together

@case = ("Initial", "Quicksort", "Iter First", "Iter Last", "Big Table", "Better Hash", "Linear Lower");

print "Case\tSort\tList\tLower\tHash\tRest\n";

foreach $i (1..7) {
    $fname = "sprof" . $i . ".txt";
    $sort_time = 0.0;
    $lower_time = 0.0;
    $hash_time = 0.0;
    $list_time = 0.0;
    $rest_time = 0.0;
    open(INFILE, $fname) || die("Cannot open '" . $fname . "'");
    while ($line = <INFILE>) {
	chomp $line;
	@fields = split("[ ]+", $line);
	$cnt = @fields;
	if ($cnt == 8) {
	    $time = $fields[3];
	    $funct = $fields[7];
	    if ($time =~ /^[0-9]+\.[0-9]+/) {
		if ($funct =~ /lower[1-2]/) {
		    $lower_time = $time;
		} elsif ($funct eq "sort_words") {
		    $sort_time = $time;
		} elsif ($funct =~ /^h_/) {
		    $hash_time = $time;
		} elsif ($funct =~ /^find_ele_/) {
		    $list_time = $time;
		} else {
		    $rest_time += $time;
		}
	    }
	}
    }
    print "$case[$i-1]\t$sort_time\t$list_time\t$lower_time\t$hash_time\t$rest_time\n";
}

