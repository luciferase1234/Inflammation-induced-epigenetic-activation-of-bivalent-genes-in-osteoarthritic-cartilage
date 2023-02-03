#! /usr/bin/perl
open MAT1, "<$ARGV[0]";


foreach (<MAT1>){
        chomp;
        my @data = split /\t/,$_;
        my $N_count_in_bin = 0;
	if($data[3] eq "8"){
	$N_count_in_bin +=1;
	}if($data[4] eq "8"){
	$N_count_in_bin +=1;
	}if($data[5] eq "8"){
	$N_count_in_bin +=1;
        }
	print "$N_count_in_bin\t$_\n";
}

