conda install bioconda::star

#---get fasta and gtf files
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_46/gencode.v46.primary_assembly.annotation.gtf.gz
wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_46/GRCh38.primary_assembly.genome.fa.gz
gunzip gencode.v46.primary_assembly.annotation.gtf.gz
gunzip GRCh38.primary_assembly.genome.fa.gz

#---make reference
STAR --runThreadN 20 --runMode genomeGenerate --genomeDir STAR_ref --genomeFastaFiles GRCh38.primary_assembly.genome.fa --sjdbGTFfile gencode.v46.primary_assembly.annotation.gtf --genomeSAsparseD 3
