#! /usr/bin/perl

## open files ##

open MAT, "<$ARGV[0]";
open DATA, "<$ARGV[1]";
open DATA1, ">$ARGV[2]";

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
	for ($j = 1; $j<= 12 ;$j++){
	if ($data[$i] eq "$j"){
	$type = join ("|",$gene,$i,$j);
	$state_count_in_gene{$type} += 1;
			}
        		}
		}
	}
       	}if($data[19] eq "+"){ 
       	my $distance = $data[16]-$data[2];
                if($distance >= -200 && $distance <1800){
                for ($i = 3; $i<= 5 ;$i++){
	for ($j = 1; $j<= 12 ;$j++){
	if ($data[$i] eq "$j"){
	$type = join ("|",$gene,$i,$j);
	$state_count_in_gene{$type} += 1;
			}
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
	my @geneID = split /\./,$data[5];
	my $geneID = $geneID[0];
	my $genename = $data[7];
	print DATA1 "$geneID\t$genename\t";
	


	my $N21_type="Others";
	my $N21_type_count;
	my $N21_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$N21_type_ID = join("|",$geneID,3,$i);
	if (exists $state_count_in_gene{$N21_type_ID}){
	$N21_type_count =$state_count_in_gene{$N21_type_ID};
	}else{
	$N21_type_count = 0;
	}
	my $N21_type_ratio = $N21_type_count/10;
	if( $N21_type_ratio >=0.6) {
	$N21_type = $i;
	}
	}
	print DATA1 "$N21_type\t";


	my $N22_type="Others";
	my $N22_type_count;
	my $N22_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$N22_type_ID = join("|",$geneID,4,$i);
	if (exists $state_count_in_gene{$N22_type_ID}){
	$N22_type_count =$state_count_in_gene{$N22_type_ID};
	}else{
	$N22_type_count = 0;
	}
	my $N22_type_ratio = $N22_type_count/10;
	if( $N22_type_ratio >=0.6) {
	$N22_type = $i;
	}
	}
	print DATA1 "$N22_type\t";


	my $N30_type="Others";
	my $N30_type_count;
	my $N30_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$N30_type_ID = join("|",$geneID,5,$i);
	if (exists $state_count_in_gene{$N30_type_ID}){
	$N30_type_count =$state_count_in_gene{$N30_type_ID};
	}else{
	$N30_type_count = 0;
	}
	my $N30_type_ratio = $N30_type_count/10;
	if( $N30_type_ratio >=0.6) {
	$N30_type = $i;
	}
	}
	print DATA1 "$N30_type\t";


	my $O15_type="Others";
	my $O15_type_count;
	my $O15_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$O15_type_ID = join("|",$geneID,6,$i);
	if (exists $state_count_in_gene{$O15_type_ID}){
	$O15_type_count =$state_count_in_gene{$O15_type_ID};
	}else{
	$O15_type_count = 0;
	}
	my $O15_type_ratio = $O15_type_count/10;
	if( $O15_type_ratio >=0.6) {
	$O15_type = $i;
	}
	}
	print DATA1 "$O15_type\t";	


	my $O17_type="Others";
	my $O17_type_count;
	my $O17_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$O17_type_ID = join("|",$geneID,7,$i);
	if (exists $state_count_in_gene{$O17_type_ID}){
	$O17_type_count =$state_count_in_gene{$O17_type_ID};
	}else{
	$O17_type_count = 0;
	}
	my $O17_type_ratio = $O17_type_count/10;
	if( $O17_type_ratio >=0.6) {
	$O17_type = $i;
	}
	}
	print DATA1 "$O17_type\t";


	my $O18_type="Others";
	my $O18_type_count;
	my $O18_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$O18_type_ID = join("|",$geneID,8,$i);
	if (exists $state_count_in_gene{$O18_type_ID}){
	$O18_type_count =$state_count_in_gene{$O18_type_ID};
	}else{
	$O18_type_count = 0;
	}
	my $O18_type_ratio = $O18_type_count/10;
	if( $O18_type_ratio >=0.6) {
	$O18_type = $i;
	}
	}
	print DATA1 "$O18_type\t";


	my $O28_type="Others";
	my $O28_type_count;
	my $O28_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$O28_type_ID = join("|",$geneID,13,$i);
	if (exists $state_count_in_gene{$O28_type_ID}){
	$O28_type_count =$state_count_in_gene{$O28_type_ID};
	}else{
	$O28_type_count = 0;
	}
	my $O28_type_ratio = $O28_type_count/10;
	if( $O28_type_ratio >=0.6) {
	$O28_type = $i;
	}
	}
	print DATA1 "$O28_type\t";


	my $O26I_type="Others";
	my $O26I_type_count;
	my $O26I_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$O26I_type_ID = join("|",$geneID,10,$i);
	if (exists $state_count_in_gene{$O26I_type_ID}){
	$O26I_type_count =$state_count_in_gene{$O26I_type_ID};
	}else{
	$O26I_type_count = 0;
	}
	my $O26I_type_ratio = $O26I_type_count/10;
	if( $O26I_type_ratio >=0.6) {
	$O26I_type = $i;
	}
	}
	print DATA1 "$O26I_type\t";	


	my $O27I_type="Others";
	my $O27I_type_count;
	my $O27I_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$O27I_type_ID = join("|",$geneID,12,$i);
	if (exists $state_count_in_gene{$O27I_type_ID}){
	$O27I_type_count =$state_count_in_gene{$O27I_type_ID};
	}else{
	$O27I_type_count = 0;
	}
	my $O27I_type_ratio = $O27I_type_count/10;
	if( $O27I_type_ratio >=0.6) {
	$O27I_type = $i;
	}
	}
	print DATA1 "$O27I_type\t";


	my $O26D_type="Others";
	my $O26D_type_count;
	my $O26D_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$O26D_type_ID = join("|",$geneID,9,$i);
	if (exists $state_count_in_gene{$O26D_type_ID}){
	$O26D_type_count =$state_count_in_gene{$O26D_type_ID};
	}else{
	$O26D_type_count = 0;
	}
	my $O26D_type_ratio = $O26D_type_count/10;
	if( $O26D_type_ratio >=0.6) {
	$O26D_type = $i;
	}
	}
	print DATA1 "$O26D_type\t";	


	my $O27D_type="Others";
	my $O27D_type_count;
	my $O27D_type_ID;
	for ($i = 1; $i<= 12 ;$i++){
	$O27D_type_ID = join("|",$geneID,11,$i);
	if (exists $state_count_in_gene{$O27D_type_ID}){
	$O27D_type_count =$state_count_in_gene{$O27D_type_ID};
	}else{
	$O27D_type_count = 0;
	}
	my $O27D_type_ratio = $O27D_type_count/10;
	if( $O27D_type_ratio >=0.6) {
	$O27D_type = $i;
	}
	}
	print DATA1 "$O27D_type\t";


	print DATA1 "\n";
}

