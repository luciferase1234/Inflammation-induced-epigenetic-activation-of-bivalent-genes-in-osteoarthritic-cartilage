#! /usr/bin/perl
open MAT1, "<$ARGV[0]";


foreach (<MAT1>){
        chomp;
          my @data = split /\t/,$_;
	my %N_count_in_bin;
          my %OA_count_in_bin;
          my %I_count_in_bin;
          my %D_count_in_bin;
	my $N_state;
	my $N_count;
	my $OA_state;
	my $OA_count;
	my $I_state;
	my $I_count;
	my $D_state;
	my $D_count;
        $N_count_in_bin{$data[3]} +=1;
        $N_count_in_bin{$data[4]} +=1;
        $N_count_in_bin{$data[5]} +=1;
        $OA_count_in_bin{$data[6]} += 1;
        $OA_count_in_bin{$data[7]} += 1;
        $OA_count_in_bin{$data[8]} += 1;
        $OA_count_in_bin{$data[13]} += 1;
        $I_count_in_bin{$data[10]} += 1;
        $I_count_in_bin{$data[12]} += 1;
        $D_count_in_bin{$data[9]} += 1;
        $D_count_in_bin{$data[11]} += 1;
	#print "$N_count_in_bin{8}\n";
        if ($N_count_in_bin{8} >=2){
	$N_state = "Bivalent";
	$N_count = $N_count_in_bin{8};
	}elsif(($N_count_in_bin{9}+$N_count_in_bin{10}) >=2){
        $N_state = "K4me3";
        $N_count = $N_count_in_bin{9}+$N_count_in_bin{10}；
        }elsif($N_count_in_bin{6} >=2){
        $N_state = "K27me3";
        $N_count = $N_count_in_bin{6};
        }else{
	$N_state = "Others";
	$N_count = "0";
	}
	if ($OA_count_in_bin{8} >=2){
        $OA_state = "Bivalent";
        $OA_count = $OA_count_in_bin{8};
        }elsif(($OA_count_in_bin{9}+$OA_count_in_bin{10}) >=2){
        $OA_state = "K4me3";
        $OA_count = $OA_count_in_bin{9}+$OA_count_in_bin{10};
        }elsif($OA_count_in_bin{6} >=2){
        $OA_state = "K27me3";
        $OA_count = $OA_count_in_bin{6};
        }else{
        $OA_state = "Others";
        $OA_count = "0";
        }
	if ($I_count_in_bin{8} >=1){
        $I_state = "Bivalent";
        $I_count = $I_count_in_bin{8};
        }elsif(($I_count_in_bin{9}+$I_count_in_bin{10}) >=1){
        $I_state = "K4me3";
        $I_count = $I_count_in_bin{9}+$I_count_in_bin{10};
        }elsif($I_count_in_bin{6} >=1){
        $I_state = "K27me3";
        $I_count = $I_count_in_bin{6};
        }else{
        $I_state = "Others";
        $I_count = "0";
        }
	if ($D_count_in_bin{8} >=1){
        $D_state = "Bivalent";
        $D_count = $D_count_in_bin{8};
        }elsif(($D_count_in_bin{9}+$D_count_in_bin{10}) >=1){
        $D_state = "K4me3";
        $D_count = $D_count_in_bin{9}+$D_count_in_bin{10};
        }elsif($D_count_in_bin{6} >=1){
        $D_state = "K27me3";
        $D_count = $D_count_in_bin{6};
        }else{
        $D_state = "Others";
        $D_count = "0";
        }
	
        print "$data[0]\t$data[1]\t$data[2]\t$N_state\t$N_count\t$OA_state\t$OA_count\t$I_state\t$I_count\t$D_state\t$D_count\t$data[14]\t$data[15]\t$data[16]\t$data[17]\t$data[18]\t$data[19]\n" ;
}


