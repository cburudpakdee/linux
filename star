conda install bioconda::star

#---get fasta and gtf files
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_46/gencode.v46.primary_assembly.annotation.gtf.gz
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_46/GRCh38.primary_assembly.genome.fa.gz
gunzip gencode.v46.primary_assembly.annotation.gtf.gz
gunzip GRCh38.primary_assembly.genome.fa.gz

#---make reference
STAR --runThreadN 20 --runMode genomeGenerate --genomeDir STAR_ref --genomeFastaFiles GRCh38.primary_assembly.genome.fa --sjdbGTFfile gencode.v46.primary_assembly.annotation.gtf --genomeSAsparseD 3

#---download BD Rhapsody WTA barcodes for whitelist at https://teichlab.github.io/scg_lib_structs/methods_html/BD_Rhapsody.html
#---find CLS1-3 and save it as CLS1.txt, CLS2.txt and CLS3.txt

#---run STAR
STAR --runThreadN 10 --genomeDir /home/em/Desktop/microbiome_test/genome_files/STAR_ref --readFilesIn sample_S1_L001_R2_001.fastq.gz sample_S1_L001_R1_001.fastq.gz --readFilesCommand zcat --soloType CB_UMI_Complex --soloCBmatchWLtype 1MM --soloCBposition 0_0_0_8 0_13_0_21 0_26_0_34 --soloUMIposition 0_35_0_43 --soloCBwhitelist CLS1.txt CLS2.txt CLS3.txt --outFileNamePrefix star_out --outSAMattributes CB UB --outSAMtype BAM SortedByCoordinate
