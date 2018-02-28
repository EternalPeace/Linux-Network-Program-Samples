# Configuration information for processor tests.

# Common declarations for testing code

# Where's the assembler?
$yas = "../misc/yas";

# Which simulator is being tested?
$sim = "../pipe/pipe_tty";

# By default, don't test leave instruction.
$testleave = 0;

# By default, don't test iaddl instruction.
$testiaddl = 0;

# Generate performance targets?
$gen_perf = 0;
# Check performance targets?
$check_perf = 0;

# File with performance targets
$perf_file = "";

$tcount = 0;
$ecount = 0;
$pecount = 0;

sub run_test
{
    local ($tname) = @_;
    system "$yas $tname.ys" || die "Can't open file $tname.ys\n";
    local $result = `$sim -v 0 -t $tname.yo`;
    if (!($result =~ "Succeed")) {
	print "Test $tname failed\n";
	$ecount++;
    } else {
	system "rm $tname.ys";
    }
    if ($gen_perf) {
	$_ = $result;
	m#CPI:[^0-9]*([0-9]+)[^0-9]*([0-9]+)#;
	$cycles = $1;
	$instructions = $2;
	print "$tname:$cycles:$instructions\n";
    }
    if ($check_perf) {
	$_ = $result;
	m#CPI:[^0-9]*([0-9]+)[^0-9]*([0-9]+)#;
	$tcycles = $1;
	$tinstructions = $2;
	$p = `grep $tname $perf_file` || die "Couldn't open file $perf_file\n";
	chomp $p;
	($pname, $pcycles, $pinstructions) = split /:/, $p;
	if ($tcycles != $pcycles) {
	    $pecount++;
	    print "Test $tname.\tMeasured cycles=$tcycles != Target cycles=$pcycles\n";
	}
    }
    $tcount++;
    system "rm $tname.yo";
}

sub test_stat
{
    if ($ecount == 0) {
	print "  All $tcount ISA Checks Succeed\n";
    } else {
	print "  $ecount/$tcount ISA Checks Failed\n";
    }
    if ($check_perf) {
	if ($pecount == 0) {
	    print "  All $tcount Performance Checks Succeed\n";
	} else {
	    print "   $pecount/$tcount Performance Checks Failed\n";
	}
    }
}

sub cmdline {
    # parse command line arguments
    getopts('hils:Pp:');

    if ($opt_h) {
        print STDERR "Usage $argv[0] [-h] [-i] [-s <sim>] [-P] [-p <pfile>]\n";
        print STDERR "   -h       print Help message\n";
        print STDERR "   -i       test iaddl instruction\n";
        print STDERR "   -l       test leave instruction\n";
        print STDERR "   -s <sim> Specify simulator\n";
        print STDERR "   -P Generate performance data\n";
        print STDERR "   -p <version> Check using performance file <pfile>\n";
        die "\n";
    }

    if ($opt_i) {
	$testiaddl = 1;
    }

    if ($opt_l) {
	$testleave = 1;
    }

    if ($opt_P) {
	$gen_perf = 1;
    }

    if ($opt_p) {
	$check_perf = 1;
	$perf_file = $opt_p;
    }

    if ($opt_s) {
	$sim = $opt_s;
    }
    print "Simulating with $sim\n";
}

# Perl gives error messages without the following line !?!
$junk = 1;





