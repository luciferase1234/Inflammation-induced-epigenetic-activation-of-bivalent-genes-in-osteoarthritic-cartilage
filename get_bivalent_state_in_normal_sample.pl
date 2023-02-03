#! /usr/bin/perl
open MAT1, "<$ARGV[0]";
open MAT2, "<$ARGV[1]";
open OUT1, ">$ARGV[2]";
open OUT3, ">$ARGV[3]";


my %N_count_in_promoter;
foreach (<MAT1>){
        chomp;
        my @data = split /\t/,$_;
        my $gene = $data[18];
        if($data[20] eq "-"){ 
        my $distance = $data[2]-$data[16];
        if($distance >= -200 && $distance <1800 && $data[0] >= 2){
        $N_count_in_promoter{$gene} += 1;
        }
        }if($data[20] eq "+"){ 
        my $distance = $data[17]-$data[3];
        if($distance >= -200 && $distance <1800 && $data[0] >=2){
        $N_count_in_promoter{$gene} += 1;
        }
        }
}

#foreach (keys %N_count_in_promoter){
#        my $values =%N_count_in_promoter{$_};
#        print "$_\t$values\n";
#        }

my %N_gene;
foreach (<MAT2>){
	chomp;
        my @data = split /\t/,$_;
	my $gene = $data[17];
	my $N_count = $N_count_in_promoter{$gene};
	#print "$gene\t$N_count\n";
	if ($N_count_in_promoter{$gene} >=6){
	$N_gene{$gene} = 1;
	print OUT1 "$_\n";
}
}


foreach (keys %N_gene){
        print OUT3 "$_\n";
   	}

