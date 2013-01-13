function probeData = getDonorProbeData(csvFile)


    fid = fopen(csvFile);
       csvData = textscan(fid, '%f %q %f %q %q %f %s', 'delimiter', ',','HeaderLines', 1,'BufSize',101024);
    fclose(fid);
    %csvData = importdata(csvFile,',',1);
    

    probeData.probe_ids = csvData{1};
    probeData.probe_names = csvData{2};
    probeData.gene_ids = csvData{3};
    probeData.gene_symbols = csvData{4};
    probeData.gene_names = csvData{5};
    probeData.entrez_id = csvData{6};
    probeData.chromosome = csvData{7};

    probeData.textData = [probeData.probe_names, probeData.gene_symbols,  probeData.gene_names, probeData.chromosome];
    probeData.textTitles = {'probe_name','gene_symbol','gene_name','chromosome'};
    
    probeData.numericData = [probeData.probe_ids, probeData.gene_ids,  probeData.entrez_id];
    probeData.numericTitles = {'probe_id','gene_id','entrez_id'};

end
