function structureData = getStructuresData(csvFile)

%structure_id,slab_num,well_id,slab_type,structure_acronym,structure_name,
%polygon_id,mri_voxel_x,mri_voxel_y,mri_voxel_z,mni_x,mni_y,mni_z


    fid = fopen(csvFile);
       csvData = textscan(fid, '%f %f %f %s %s %q %f %f %f %f %f %f %f', 'delimiter', ',','HeaderLines', 1,'BufSize',101024);
    fclose(fid);
    %csvData = importdata(csvFile,',',1);
    
    structureData.structureShortName = csvData{5};
    structureData.structureFullName = csvData{6};
    structureData.mri_voxel_xyz = [csvData{8}, csvData{9},csvData{10}] ;
    structureData.mni_xyz = [csvData{11}, csvData{12},csvData{13}] ;
    
    
    structureData.textData = [csvData{4}, csvData{5},csvData{6}];
    structureData.textTitles = {'slab_type','structure_acronym','structure_name'};
    
    structureData.numericData = [csvData{1}, csvData{2},csvData{3},csvData{7}, csvData{8},csvData{9},csvData{10}, csvData{11}, csvData{12},csvData{13}];
    structureData.numericTitles = {'structure_id','slab_num','well_id','polygon_id','mri_voxel_x','mri_voxel_y','mri_voxel_z','mni_x','mni_y','mni_z'};
end