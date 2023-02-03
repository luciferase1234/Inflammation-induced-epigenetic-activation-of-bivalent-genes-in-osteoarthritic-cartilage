#! /usr/bin/perl

## open files ##

open MAT, "<$ARGV[0]";
open DATA, "<$ARGV[1]";
open N2OA, ">$ARGV[2]";
open I2D, ">$ARGV[3]";


my %N_2_OA_state_Bivalent_to_K27me3_transition;
my %N_2_OA_state_Bivalent_to_K4me3_transition;
my %N_2_OA_state_Bivalent_to_Bivalent_transition;
my %I_2_D_state_Bivalent_to_K27me3_transition;
my %I_2_D_state_Bivalent_to_K4me3_transition;
my %I_2_D_state_Bivalent_to_Bivalent_transition;
my %N_count;
my %I_count;


foreach (<MAT>){
	chomp;
        my @data = split /\t/,$_;
        my $gene = $data[14];
        if($data[16] eq "-"){
        my $distance = $data[1]-$data[12];
        if($distance >= -200 && $distance <1800){
	if($data[3] eq "Bivalent"){
	$N_count{$gene} += 1;
	}if($data[7] eq "Bivalent"){
	$I_count{$gene} += 1;
	}
 	if($data[3] eq "Bivalent" && $data[5] eq "K27me3"){
	$N_2_OA_state_Bivalent_to_K27me3_transition{$gene} += 1;
	}
	if($data[3] eq "Bivalent" && $data[5] eq "K4me3"){
        $N_2_OA_state_Bivalent_to_K4me3_transition{$gene} += 1;
        }
	if($data[3] eq "Bivalent" && $data[5] eq "Bivalent"){
        $N_2_OA_state_Bivalent_to_Bivalent_transition{$gene} += 1;
        }
	if($data[7] eq "Bivalent" && $data[9] eq "K27me3"){
        $I_2_D_state_Bivalent_to_K27me3_transition{$gene} += 1;
        }
        if($data[7] eq "Bivalent" && $data[9] eq "K4me3"){
        $I_2_D_state_Bivalent_to_K4me3_transition{$gene} += 1;
        }
        if($data[7] eq "Bivalent" && $data[9] eq "Bivalent"){
        $I_2_D_state_Bivalent_to_Bivalent_transition{$gene} += 1;
        }
        }
        }if($data[16] eq "+"){
        my $distance = $data[13]-$data[2];
        if($distance >= -200 && $distance <1800){
	if($data[3] eq "Bivalent"){
        $N_count{$gene} += 1;
        }if($data[7] eq "Bivalent"){
        $I_count{$gene} += 1;
        }
        if($data[3] eq "Bivalent" && $data[5] eq "K27me3"){
        $N_2_OA_state_Bivalent_to_K27me3_transition{$gene} += 1;
        }
        if($data[3] eq "Bivalent" && $data[5] eq "K4me3"){
        $N_2_OA_state_Bivalent_to_K4me3_transition{$gene} += 1;
        }
        if($data[3] eq "Bivalent" && $data[5] eq "Bivalent"){
        $N_2_OA_state_Bivalent_to_Bivalent_transition{$gene} += 1;
        }
        if($data[7] eq "Bivalent" && $data[9] eq "K27me3"){
        $I_2_D_state_Bivalent_to_K27me3_transition{$gene} += 1;
        }
        if($data[7] eq "Bivalent" && $data[9] eq "K4me3"){
        $I_2_D_state_Bivalent_to_K4me3_transition{$gene} += 1;
        }
        if($data[7] eq "Bivalent" && $data[9] eq "Bivalent"){
        $I_2_D_state_Bivalent_to_Bivalent_transition{$gene} += 1;
        }
        }
      	}
	#print "$gene\t$N_count{$gene}\t$G_count{$gene}\n";
}

foreach (<DATA>){
	chomp;
        my @data = split /\t/,$_;
	my $N_total_count = $N_count{$data[0]};
	my $I_total_count = 0;
	if(exists $I_count{$data[0]}){
	$I_total_count = $I_count{$data[0]};
	#print "$G_total_count\t$G_count{$data[0]}\n";
        }#else{
	#my $G_total_count = 0;
	#print "$_\t$G_total_count\n";
	#}
	#print "$data[0]\t$N_total_count\t$G_total_count\n";
	print N2OA "$data[0]\t$N_total_count\t$I_total_count";
	print I2D "$data[0]\t$N_total_count\t$I_total_count";
	if( exists($N_2_OA_state_Bivalent_to_K4me3_transition{$data[0]})) {
	my $N_2_OA_Bivalent_to_K4me3_count = $N_2_OA_state_Bivalent_to_K4me3_transition{$data[0]};
	print N2OA "\t$N_2_OA_Bivalent_to_K4me3_count";
	}else{
	print N2OA "\t0";
	}
	if( exists($N_2_OA_state_Bivalent_to_K27me3_transition{$data[0]})) {
        my $N_2_OA_Bivalent_to_K27me3_count = $N_2_OA_state_Bivalent_to_K27me3_transition{$data[0]};
        print N2OA "\t$N_2_OA_Bivalent_to_K27me3_count";
        }else{
        print N2OA "\t0";
        }
	if( exists($N_2_OA_state_Bivalent_to_Bivalent_transition{$data[0]})) {
        my $N_2_OA_Bivalent_to_Bivalent_count = $N_2_OA_state_Bivalent_to_Bivalent_transition{$data[0]};
        print N2OA "\t$N_2_OA_Bivalent_to_Bivalent_count";
        }else{
        print N2OA "\t0";
        }
	if( exists($I_2_D_state_Bivalent_to_K4me3_transition{$data[0]})) {
        my $I_2_D_Bivalent_to_K4me3_count = $I_2_D_state_Bivalent_to_K4me3_transition{$data[0]};
        print I2D "\t$I_2_D_Bivalent_to_K4me3_count";
        }else{
        print I2D "\t0";
        }
        if( exists($I_2_D_state_Bivalent_to_K27me3_transition{$data[0]})) {
        my $I_2_D_Bivalent_to_K27me3_count = $I_2_D_state_Bivalent_to_K27me3_transition{$data[0]};
        print I2D "\t$I_2_D_Bivalent_to_K27me3_count";
        }else{
        print I2D "\t0";
        }
        if( exists($I_2_D_state_Bivalent_to_Bivalent_transition{$data[0]})) {
        my $I_2_D_Bivalent_to_Bivalent_count = $I_2_D_state_Bivalent_to_Bivalent_transition{$data[0]};
        print I2D "\t$I_2_D_Bivalent_to_Bivalent_count";
        }else{
        print I2D "\t0";
        }
	print N2OA "\n";
        print I2D "\n";
}
