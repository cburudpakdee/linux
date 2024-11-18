#---if on new machine and install is required
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install g++
sudo apt-get make

wget https://github.com/alexdobin/STAR/archive/2.7.11a.tar.gz
tar -xzf 2.7.11a.tar.gz
rm -r 2.7.11a.tar.gz
cd STAR-2.7.11a
cd source
make STAR
#-----STAR can only be run in source folder
./STAR --help
#---Add to bash
export PATH=$PATH:/home/deviancedev/Desktop/drive_nov2023/STAR/STAR-2.7.11a/source/:$PATH
#-----download index and annotation file at https://useast.ensembl.org/Homo_sapiens/Info/Index
#-----ie Homo_sapiens.GRCh38.dna_rm.primary_assembly.fa.gz and Homo_sapiens.GRCh38.96.chr.gtf.gz
#-----Generate STAR alignment index
STAR --runMode genomeGenerate --genomeDir /home/deviancedev/Desktop/drive_nov2023/Genome_indexes 
--genomeFastaFiles /home/deviancedev/Desktop/drive_nov2023/Genome_indexes/Homo_sapiens.GRCh38.dna.primary_assembly.fa 
--sjdbGTFfile /home/deviancedev/Desktop/drive_nov2023/Genome_indexes/Homo_sapiens.GRCh38.110.chr.gtf 
--sjdbOverhang 51
