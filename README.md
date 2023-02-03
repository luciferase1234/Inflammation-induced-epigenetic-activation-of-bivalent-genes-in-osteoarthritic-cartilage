# worksotre
Count the number of each state in genome of all the samples.
perl get_state_count_in_genome.pl chromHMM_state_output.txt >state_count_in_genome.txt


Get chromHMM bins around TSS region(-5000 to 1000) of human genes.
intersectBed -a chromHMM_state_output.txt -b human_tss_-5000_to_1000_region.bed -wa -wb >chromHMM_state_around_tss.txt

Get promoter state define of all genes in each sample by the chromHMM states of 2kb region around TSS.
perl get_gene_TSS_2kb_state_define_in_all_sample.pl chromHMM_state_around_tss.txt gencode.v27.annotation.gtf.gene.annotation gene_TSS_2kb_state_define_in_all_sample.txt

Get promoter state define of all genes in Normal and OA by the chromHMM states of 2kb region around TSS.
perl get_gene_TSS_2kb_state_define_in_Normal_and_OA.pl gene_TSS_2kb_state_define_in_all_sample.txt > gene_TSS_2kb_state_define_in_Normal_and_OA.txt

Get promoter state transition from Normal to OA.
perl get_state_transition.pl gene_TSS_2kb_state_define_in_Normal_and_OA.txt > Normal_to_OA_state_transition.txt


Get K4/K27 bivalent promoters in normal samples and their state changes in OA, OA-Intact and OA-Damaged samples.
perl get_state_count_in_bin_in_normal_samples.pl chromHMM_state_around_tss.txt > chromHMM_state_around_tss_with_count_of_bivalent_in_bin.txt
perl get_bivalent_state_in_normal_sample.pl chromHMM_state_around_tss_with_count_of_bivalent_in_bin.txt chromHMM_state_around_tss.txt chromHMM_state_around_tss_in_bivalent_gene_in_normal_samples.txt chromHMM_state_bivalent_gene_list_in_normal_samples.txt
perl get_bivalent_gene_changes_in_OA.pl chromHMM_state_around_tss.txt chromHMM_state_bivalent_gene_list_in_normal_samples.txt >chromHMM_state_bivalent_gene_changes_in_OA.txt


Define the dominate state in each promoter bins in Normal, OA, OA-Int and OA-Dam.
perl get_dominate_state_of_each_bin.pl chromHMM_state_around_tss_in_bivalent_gene_in_normal_samples.txt >chromHMM_state_around_tss_in_bivalent_gene_in_normal_samples_define.txt


Get transition style of bivalent genes in OA vs, Normal and OA-Dam vs, OA-Int
perl get_state_transition_in_bivalent_gene.pl chromHMM_state_around_tss_in_bivalent_gene_in_normal_samples_define.txt chromHMM_state_bivalent_gene_list_in_normal_samples.txt bivalent_gene_transition_in_Normal_to_OA.txt bivalent_gene_transition_in_OA-Int_to_OA-Dam.txt
