#! /usr/bin/perl

## open files ##

open MAT, "<$ARGV[0]";
open DATA, "<$ARGV[1]";



my %state_count_in_gene;
foreach (<MAT>){
	chomp;
        my @data = split /\t/,$_;
        my $gene = $data[17];
	my $type;
        if($data[19] eq "-"){ 
        my $distance = $data[1]-$data[15];
        if($distance >= -200 && $distance <1800){
	for ($i = 3; $i<= 13 ;$i++){
	if ($data[$i] eq "6"){
	$type = join ("|",$gene,$i,"6");
	$state_count_in_gene{$type} += 1;
	}elsif($data[$i] eq "8"){
        $type = join ("|",$gene,$i,"8");
	$state_count_in_gene{$type} += 1;
        }elsif($data[$i] eq "9"){
        $type = join ("|",$gene,$i,"9");
        $state_count_in_gene{$type} += 1;
        }elsif($data[$i] eq "10"){
        $type = join ("|",$gene,$i,"10");
        $state_count_in_gene{$type} += 1;
        }
        }
	}
        }if($data[19] eq "+"){ 
        my $distance = $data[16]-$data[2];
        if($distance >= -200 && $distance <1800){
        for ($i = 3; $i<= 13 ;$i++){
        if ($data[$i] eq "6"){
        $type = join ("|",$gene,$i,"6");
        $state_count_in_gene{$type} += 1;
        }elsif($data[$i] eq "8"){
        $type = join ("|",$gene,$i,"8");
        $state_count_in_gene{$type} += 1;
        }elsif($data[$i] eq "9"){
        $type = join ("|",$gene,$i,"9");
        $state_count_in_gene{$type} += 1;
        }elsif($data[$i] eq "10"){
        $type = join ("|",$gene,$i,"10");
        $state_count_in_gene{$type} += 1;
        }
        }
        }
        }
	#$type = join ("|",$gene,"10","9");
	#print "$type\t$state_count_in_gene{$type}\n";
}

foreach (<DATA>){
	chomp;
        my @data = split /\t/,$_;
	my $geneID = $data[0];
	print "$geneID";
	my $N21_type;
	my $N21_bi = join("|",$geneID,3,8);
	my $N21_bi_ratio = $state_count_in_gene{$N21_bi}/10;
	my $N21_K4me3_9 = join("|",$geneID,3,9);
	my $N21_K4me3_10 = join("|",$geneID,3,10);
        my $N21_K4me3_ratio = ($state_count_in_gene{$N21_K4me3_9}+$state_count_in_gene{$N21_K4me3_10})/10;
	my $N21_K27me3 = join("|",$geneID,3,6);
        my $N21_K27me3_ratio = $state_count_in_gene{$N21_K27me3}/10;
	if ($N21_K4me3_ratio >=0.4 && $N21_K4me3_ratio>$N21_K27me3_ratio){
	$N21_type = "K4me3";
	print "\t$N21_K4me3_ratio\t$N21_type";
	}elsif ($N21_K27me3_ratio >=0.4 && $N21_K27me3_ratio>$N21_K4me3_ratio){
        $N21_type = "K27me3";
        print "\t$N21_K27me3_ratio\t$N21_type";
        }elsif ($N21_bi_ratio >=0.6){
        $N21_type = "Bivalent";
        print "\t$N21_bi_ratio\t$N21_type";
        }else {
	$N21_type = "Others";
	print "\t0\t$N21_type";
	}
	my $N22_type;
        my $N22_bi = join("|",$geneID,4,8);
        my $N22_bi_ratio = $state_count_in_gene{$N22_bi}/10;
        my $N22_K4me3_9 = join("|",$geneID,4,9);
	my $N22_K4me3_10 = join("|",$geneID,4,10);
        my $N22_K4me3_ratio = ($state_count_in_gene{$N22_K4me3_9}+$state_count_in_gene{$N22_K4me3_10})/10;
        my $N22_K27me3 = join("|",$geneID,4,6);
        my $N22_K27me3_ratio = $state_count_in_gene{$N22_K27me3}/10;
        if ($N22_K4me3_ratio >=0.4 && $N22_K4me3_ratio>$N22_K27me3_ratio){
        $N22_type = "K4me3";
        print "\t$N22_K4me3_ratio\t$N22_type";
        }elsif ($N22_K27me3_ratio >=0.4 && $N22_K27me3_ratio>$N22_K4me3_ratio){
        $N22_type = "K27me3";
        print "\t$N22_K27me3_ratio\t$N22_type";
        }elsif ($N22_bi_ratio >=0.6){
        $N22_type = "Bivalent";
        print "\t$N22_bi_ratio\t$N22_type";
        }else {
        $N22_type = "Others";   
        print "\t0\t$N22_type";
        }
	my $N30_type;
        my $N30_bi = join("|",$geneID,5,8);
        my $N30_bi_ratio = $state_count_in_gene{$N30_bi}/10;
        my $N30_K4me3_9 = join("|",$geneID,5,9);
	my $N30_K4me3_10 = join("|",$geneID,5,10);
        my $N30_K4me3_ratio = ($state_count_in_gene{$N30_K4me3_9}+$state_count_in_gene{$N30_K4me3_10})/10;
        my $N30_K27me3 = join("|",$geneID,5,6);
        my $N30_K27me3_ratio = $state_count_in_gene{$N30_K27me3}/10;
        if ($N30_K4me3_ratio >=0.4 && $N30_K4me3_ratio>$N30_K27me3_ratio){
        $N30_type = "K4me3";
        print "\t$N30_K4me3_ratio\t$N30_type";
        }elsif ($N30_K27me3_ratio >=0.4 && $N30_K27me3_ratio>$N30_K4me3_ratio){
        $N30_type = "K27me3";
        print "\t$N30_K27me3_ratio\t$N30_type";
        }elsif ($N30_bi_ratio >=0.6){
        $N30_type = "Bivalent";
        print "\t$N30_bi_ratio\t$N30_type";
        }else {
        $N30_type = "Others";   
        print "\t0\t$N30_type";
        }
	my $O15_type;
        my $O15_bi = join("|",$geneID,6,8);
        my $O15_bi_ratio = $state_count_in_gene{$O15_bi}/10;
        my $O15_K4me3_9 = join("|",$geneID,6,9);
	my $O15_K4me3_10 = join("|",$geneID,6,10);
        my $O15_K4me3_ratio = ($state_count_in_gene{$O15_K4me3_9}+$state_count_in_gene{$O15_K4me3_10})/10;
        my $O15_K27me3 = join("|",$geneID,6,6);
        my $O15_K27me3_ratio = $state_count_in_gene{$O15_K27me3}/10;
        if ($O15_K4me3_ratio >=0.4 && $O15_K4me3_ratio>$O15_K27me3_ratio){
        $O15_type = "K4me3";
        print "\t$O15_K4me3_ratio\t$O15_type";
        }elsif ($O15_K27me3_ratio >=0.4 && $O15_K27me3_ratio>$O15_K4me3_ratio){
        $O15_type = "K27me3";
        print "\t$O15_K27me3_ratio\t$O15_type";
        }elsif ($O15_bi_ratio >=0.6){
        $O15_type = "Bivalent";
        print "\t$O15_bi_ratio\t$O15_type";
        }else {
        $O15_type = "Others";
        print "\t0\t$O15_type";
        }
        my $O17_type;
        my $O17_bi = join("|",$geneID,7,8);
        my $O17_bi_ratio = $state_count_in_gene{$O17_bi}/10;
        my $O17_K4me3_9 = join("|",$geneID,7,9);
	my $O17_K4me3_10 = join("|",$geneID,7,10);
        my $O17_K4me3_ratio = ($state_count_in_gene{$O17_K4me3_9}+$state_count_in_gene{$O17_K4me3_10})/10;
        my $O17_K27me3 = join("|",$geneID,7,6);
        my $O17_K27me3_ratio = $state_count_in_gene{$O17_K27me3}/10;
        if ($O17_K4me3_ratio >=0.4 && $O17_K4me3_ratio>$O17_K27me3_ratio){
        $O17_type = "K4me3";
        print "\t$O17_K4me3_ratio\t$O17_type";
        }elsif ($O17_K27me3_ratio >=0.4 && $O17_K27me3_ratio>$O17_K4me3_ratio){
        $O17_type = "K27me3";
        print "\t$O17_K27me3_ratio\t$O17_type";
        }elsif ($O17_bi_ratio >=0.6){
        $O17_type = "Bivalent";
        print "\t$O17_bi_ratio\t$O17_type";
        }else {
        $O17_type = "Others";
        print "\t0\t$O17_type";
        }
        my $O18_type;
        my $O18_bi = join("|",$geneID,8,8);
        my $O18_bi_ratio = $state_count_in_gene{$O18_bi}/10;
        my $O18_K4me3_9 = join("|",$geneID,8,9);
	my $O18_K4me3_10 = join("|",$geneID,8,10);
        my $O18_K4me3_ratio = ($state_count_in_gene{$O18_K4me3_9}+$state_count_in_gene{$O18_K4me3_10})/10;
        my $O18_K27me3 = join("|",$geneID,8,6);
        my $O18_K27me3_ratio = $state_count_in_gene{$O18_K27me3}/10;
        if ($O18_K4me3_ratio >=0.4 && $O18_K4me3_ratio>$O18_K27me3_ratio){
        $O18_type = "K4me3";
        print "\t$O18_K4me3_ratio\t$O18_type";
        }elsif ($O18_K27me3_ratio >=0.4 && $O18_K27me3_ratio>$O18_K4me3_ratio){
        $O18_type = "K27me3";
        print "\t$O18_K27me3_ratio\t$O18_type";
        }elsif ($O18_bi_ratio >=0.6){
        $O18_type = "Bivalent";
        print "\t$O18_bi_ratio\t$O18_type";
        }else {
        $O18_type = "Others";
        print "\t0\t$O18_type";
        }
	my $O28_type;
        my $O28_bi = join("|",$geneID,13,8);
        my $O28_bi_ratio = $state_count_in_gene{$O28_bi}/10;
        my $O28_K4me3_9 = join("|",$geneID,13,9);
	my $O28_K4me3_10 = join("|",$geneID,13,10);
        my $O28_K4me3_ratio = ($state_count_in_gene{$O28_K4me3_9}+$state_count_in_gene{$O28_K4me3_10})/10;
        my $O28_K27me3 = join("|",$geneID,13,6);
        my $O28_K27me3_ratio = $state_count_in_gene{$O28_K27me3}/10;
        if ($O28_K4me3_ratio >=0.4 && $O28_K4me3_ratio>$O28_K27me3_ratio){
        $O28_type = "K4me3";
        print "\t$O28_K4me3_ratio\t$O28_type";
        }elsif ($O28_K27me3_ratio >=0.4 && $O28_K27me3_ratio>$O28_K4me3_ratio){
        $O28_type = "K27me3";
        print "\t$O28_K27me3_ratio\t$O28_type";
        }elsif ($O28_bi_ratio >=0.6){
        $O28_type = "Bivalent";
        print "\t$O28_bi_ratio\t$O28_type";
        }else {
        $O28_type = "Others";
        print "\t0\t$O28_type";
        }
	my $O26I_type;
        my $O26I_bi = join("|",$geneID,10,8);
        my $O26I_bi_ratio = $state_count_in_gene{$O26I_bi}/10;
        my $O26I_K4me3_9 = join("|",$geneID,10,9);
	my $O26I_K4me3_10 = join("|",$geneID,10,10);
        my $O26I_K4me3_ratio = ($state_count_in_gene{$O26I_K4me3_9}+$state_count_in_gene{$O26I_K4me3_10})/10;
        my $O26I_K27me3 = join("|",$geneID,10,6);
        my $O26I_K27me3_ratio = $state_count_in_gene{$O26I_K27me3}/10;
        if ($O26I_K4me3_ratio >=0.4 && $O26I_K4me3_ratio>$O26I_K27me3_ratio){
        $O26I_type = "K4me3";
        print "\t$O26I_K4me3_ratio\t$O26I_type";
        }elsif ($O26I_K27me3_ratio >=0.4 && $O26I_K27me3_ratio>$O26I_K4me3_ratio){
        $O26I_type = "K27me3";
        print "\t$O26I_K27me3_ratio\t$O26I_type";
        }elsif ($O26I_bi_ratio >=0.6){
        $O26I_type = "Bivalent";
        print "\t$O26I_bi_ratio\t$O26I_type";
        }else {
        $O26I_type = "Others";
        print "\t0\t$O26I_type";
        }
        my $O27I_type;
        my $O27I_bi = join("|",$geneID,12,8);
        my $O27I_bi_ratio = $state_count_in_gene{$O27I_bi}/10;
        my $O27I_K4me3_9 = join("|",$geneID,12,9);
	my $O27I_K4me3_10 = join("|",$geneID,12,10);
        my $O27I_K4me3_ratio = ($state_count_in_gene{$O27I_K4me3_9}+$state_count_in_gene{$O27I_K4me3_10})/10;
        my $O27I_K27me3 = join("|",$geneID,12,6);
        my $O27I_K27me3_ratio = $state_count_in_gene{$O27I_K27me3}/10;
        if ($O27I_K4me3_ratio >=0.4 && $O27I_K4me3_ratio>$O27I_K27me3_ratio){
        $O27I_type = "K4me3";
        print "\t$O27I_K4me3_ratio\t$O27I_type";
        }elsif ($O27I_K27me3_ratio >=0.4 && $O27I_K27me3_ratio>$O27I_K4me3_ratio){
        $O27I_type = "K27me3";
        print "\t$O27I_K27me3_ratio\t$O27I_type";
        }elsif ($O27I_bi_ratio >=0.6){
        $O27I_type = "Bivalent";
        print "\t$O27I_bi_ratio\t$O27I_type";
        }else {
        $O27I_type = "Others";
        print "\t0\t$O27I_type";
        }
        my $O26D_type;
        my $O26D_bi = join("|",$geneID,9,8);
        my $O26D_bi_ratio = $state_count_in_gene{$O26D_bi}/10;
        my $O26D_K4me3_9 = join("|",$geneID,9,9);
	my $O26D_K4me3_10 = join("|",$geneID,9,10);
        my $O26D_K4me3_ratio = ($state_count_in_gene{$O26D_K4me3_9}+$state_count_in_gene{$O26D_K4me3_10})/10;
        my $O26D_K27me3 = join("|",$geneID,9,6);
        my $O26D_K27me3_ratio = $state_count_in_gene{$O26D_K27me3}/10;
        if ($O26D_K4me3_ratio >=0.4 && $O26D_K4me3_ratio>$O26D_K27me3_ratio){
        $O26D_type = "K4me3";
        print "\t$O26D_K4me3_ratio\t$O26D_type";
        }elsif ($O26D_K27me3_ratio >=0.4 && $O26D_K27me3_ratio>$O26D_K4me3_ratio){
        $O26D_type = "K27me3";
        print "\t$O26D_K27me3_ratio\t$O26D_type";
        }elsif ($O26D_bi_ratio >=0.6){
        $O26D_type = "Bivalent";
        print "\t$O26D_bi_ratio\t$O26D_type";
        }else {
        $O26D_type = "Others";
        print "\t0\t$O26D_type";
        }
        my $O27D_type;
        my $O27D_bi = join("|",$geneID,11,8);
        my $O27D_bi_ratio = $state_count_in_gene{$O27D_bi}/10;
        my $O27D_K4me3_9 = join("|",$geneID,11,9);
	my $O27D_K4me3_10 = join("|",$geneID,11,10);
        my $O27D_K4me3_ratio = ($state_count_in_gene{$O27D_K4me3_9}+$state_count_in_gene{$O27D_K4me3_10})/10;
        my $O27D_K27me3 = join("|",$geneID,11,6);
        my $O27D_K27me3_ratio = $state_count_in_gene{$O27D_K27me3}/10;
        if ($O27D_K4me3_ratio >=0.4 && $O27D_K4me3_ratio>$O27D_K27me3_ratio){
        $O27D_type = "K4me3";
        print "\t$O27D_K4me3_ratio\t$O27D_type";
        }elsif ($O27D_K27me3_ratio >=0.4 && $O27D_K27me3_ratio>$O27D_K4me3_ratio){
        $O27D_type = "K27me3";
        print "\t$O27D_K27me3_ratio\t$O27D_type";
        }elsif ($O27D_bi_ratio >=0.6){
        $O27D_type = "Bivalent";
        print "\t$O27D_bi_ratio\t$O27D_type";
        }else {
        $O27D_type = "Others";
        print "\t0\t$O27D_type";
        }
	print "\n";
}

