setwd("~/Projects/datasets/Human allen brain")

donors = list('9861', '10021', '12876', '14380')
donorsFiles = list()
for (donor in donors){
  folder = paste('donor',donor)
  fullfile = paste(folder , 'Probes.csv', sep = '/')
  donorsFiles = c(donorsFiles, fullfile)
}


probesIDs = c()
probe_names = c()
gene_ids = c()
gene_symbols = c()
gene_names = c()
entrez_ids = c()
chromosomes = c()

for (donorfile in donorsFiles){
  probeData <- read.csv(file=donorfile,head=TRUE,sep=",")
  probesIDs = c(probesIDs, probeData['probe_id'])
  probe_names = c(probe_names, probeData['probe_name'])
  gene_ids = c(gene_ids, probeData['gene_id'])
  gene_symbols = c(gene_symbols, probeData['gene_symbol'])
  gene_names = c(gene_names, probeData['gene_name'])
  entrez_ids = c(entrez_ids, probeData['entrez_id'])
  chromosomes = c(chromosomes, probeData['chromosome'])
}


a = expand.grid(probesIDs,probesIDs) 
for (i in 1:dim(a)[1]){
  a[i,1] == a[i,2]
}
