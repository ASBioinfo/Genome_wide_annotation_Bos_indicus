
## _Bos indicus_ db for GO annotation using clusterProfiler,enrichGO

### _Bos indicus_ assembly used UOA_Brahman_1 (GCF_003369695.1)
<br/>

* Download zip file & unzip the folder 

> cd Genome_wide_annotation_Bos_indicus

**or**

* Download using git clone

> git clone --recursive https://github.com/ASBioinfo/Genome_wide_annotation_Bos_indicus.git
>
> cd Genome_wide_annotation_Bos_indicus
>
<br/><br/>

### Installing the package in R:

* Open the R terminal and install the package

 > install.packages("./org.Bindicus.eg.db", repos=NULL)

* Import the package to R :

 > library(org.Bindicus.eg.db)

* For gene enrichment analysis please follow the clusterProfiler,enrichGO tutorial
