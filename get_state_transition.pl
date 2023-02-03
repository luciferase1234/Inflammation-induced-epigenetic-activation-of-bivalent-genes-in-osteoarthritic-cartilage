#! /usr/bin/perl

## open files ##

open MAT, "<$ARGV[0]";

my %N_2_OA_state_transition_count;



foreach (<MAT>){
	chomp;
	my @data = split /\t/,$_;
	my $N_2_OA_transition = join (".",$data[3],$data[4]);
	$N_2_OA_state_transition_count{$N_2_OA_transition} += 1;
}


my @state = {1,2,3,4,5,6,7,8,9,10,11,12,Others};

for ($i = 1; $i<=13;$i++){
	for ($j = 1; $j<=13;$j++){
	my $transition = join (".",$state[$i],$state[$j]);
	print "$transition\t";
	if (exists $N_2_OA_state_transition_count{$transition}){
	my $values = $N_2_OA_state_transition_count{$transition} ;
	print "$values\n";
	}else{
	 print "0\n";
	}
	
	}
}

