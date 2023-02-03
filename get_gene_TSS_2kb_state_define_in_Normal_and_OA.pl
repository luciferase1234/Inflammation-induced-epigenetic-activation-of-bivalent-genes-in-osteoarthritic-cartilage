#! /usr/bin/perl
open MAT1, "<$ARGV[0]";


foreach (<MAT1>){
        chomp;
        my @data = split /\t/,$_;
	my %N_count_in_gene;
        my %OA_count_in_gene;
	my $N_state="Others";
	my $OA_state="Others";
        $N_count_in_gene{$data[2]} +=1;
        $N_count_in_gene{$data[3]} +=1;
        $N_count_in_gene{$data[4]} +=1;
        $OA_count_in_gene{$data[5]} += 1;
        $OA_count_in_gene{$data[6]} += 1;
        $OA_count_in_gene{$data[7]} += 1;
        $OA_count_in_gene{$data[8]} += 1;
	#print "$N_count_in_gene{12}\n";
	for ($i = 1; $i<= 12 ;$i++){
	if ($N_count_in_gene{$i} >=2){
	$N_state = $i;
	}
	if ($OA_count_in_gene{$i} >=2){
	$OA_state =$i;
	}
	}
	
	print "$data[0]\t$data[1]\t$N_state\t$OA_state\n" ;
}


