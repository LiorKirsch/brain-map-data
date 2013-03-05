function [selectedProbesData,dataMatrix] = getCorrelativeProbes(dataMatrix, probeData)
% probeData holds the metadata on each probe in the microarray expriment
% dataMatrix hold the expression value of [#probes x #regions]
%
% - compute the correlation of each probe across pairs of donors
% - for each gene it finds the probe which has the best correlation between subjects
% - returns the probes and the dataMatrix filtered to only the most correlative probes for each gene.

    gene_ids = probeData.gene_ids;
    numberOfDonors = size(dataMatrix,3);
    numberOfProbes = length(gene_ids);
    pairs = nchoosek(1:numberOfDonors,2);
    probeCorrelation = nan(numberOfProbes, size(pairs,1));
    
    for i = 1:size(pairs,1)
        for j = 1:numberOfProbes
            probeCorrelation(j,i) = corr(dataMatrix(j,:,pairs(i,1))', dataMatrix(j,:,pairs(i,2))', 'rows',  'complete');
        end
    end
    
    meanCorrelation = mean(probeCorrelation,2);
    
    [uniqueGenes,~, rev_ind] = unique(gene_ids);
    
    bestProbeForGene = nan(size(uniqueGenes));
    for j=1:length(uniqueGenes)
            releventIndecies = (rev_ind==j) ;
            [maxValue,maxInd]  = max( meanCorrelation(releventIndecies));
            if maxValue < 0 
                disp(maxValue)
            end
            releventIndeciesNumbers = find(releventIndecies);
            bestProbeForGene(j) = releventIndeciesNumbers(maxInd);
    end
    
    selectedProbesData.probe_ids = probeData.probe_ids(bestProbeForGene);
    selectedProbesData.probe_names = probeData.probe_names(bestProbeForGene);
    selectedProbesData.gene_ids = probeData.gene_ids(bestProbeForGene);
    selectedProbesData.gene_symbols = probeData.gene_symbols(bestProbeForGene);
    selectedProbesData.gene_names = probeData.gene_names(bestProbeForGene);
    selectedProbesData.entrez_ids = probeData.entrez_id(bestProbeForGene);
    selectedProbesData.chromosome = probeData.chromosome(bestProbeForGene);
    selectedProbesData.bestProbeForGene = bestProbeForGene;

    dataMatrix = dataMatrix(bestProbeForGene,:,:);
    assert( sum(selectedProbesData.gene_ids ~= uniqueGenes)==0 );
    
end
