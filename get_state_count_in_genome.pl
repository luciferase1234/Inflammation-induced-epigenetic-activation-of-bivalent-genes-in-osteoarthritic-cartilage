#! /usr/bin/perl

## open files ##

open MAT, "<$ARGV[0]";

my %N21_state_bin_count;
my %N22_state_bin_count;
my %N30_state_bin_count;
my %O15_state_bin_count;
my %O17_state_bin_count;
my %O18_state_bin_count;
my %O28_state_bin_count;
my %D26_state_bin_count;
my %D27_state_bin_count;
my %I26_state_bin_count;
my %I27_state_bin_count;

foreach (<MAT>){
	chomp;
	my @data = split /\t/,$_;
	$N21_state_bin_count{$data[3]} += 1;
	$N22_state_bin_count{$data[4]} += 1;
	$N30_state_bin_count{$data[5]} += 1;
	$O15_state_bin_count{$data[6]} += 1;
	$O17_state_bin_count{$data[7]} += 1;
	$O18_state_bin_count{$data[8]} += 1;
	$O28_state_bin_count{$data[13]} += 1;
	$D26_state_bin_count{$data[9]} += 1;
	$D27_state_bin_count{$data[11]} += 1;
           $I26_state_bin_count{$data[10]} += 1;
	$I27_state_bin_count{$data[12]} += 1;
}



for ($i = 1; $i<=12;$i++){
	print "$i\t$N21_state_bin_count{$i}\t$N22_state_bin_count{$i}\t$N30_state_bin_count{$i}\t$O15_state_bin_count{$i}\t$O17_state_bin_count{$i}\t$O18_state_bin_count{$i}\t$O28_state_bin_count{$i}\t$I26_state_bin_count{$i}\t$I27_state_bin_count{$i}\t$D26_state_bin_count{$i}\t$D27_state_bin_count{$i}\n";
}
