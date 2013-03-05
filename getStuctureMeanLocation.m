function [location_xyz, location_std] = getStuctureMeanLocation(structureData, reverseIndex, allStructures)
%for each structure compute the mean location xyz and the standard deviation
    
    location_xyz = nan(length(allStructures),3,length(structureData));
    location_std = nan(length(allStructures),3,length(structureData));
    for i=1:length(structureData)
        
        cur_structure = structureData{i};
        cur_reverseIndex = reverseIndex{i};
        
        cur_xyz = nan(length(allStructures),3);
        cur_std = nan(length(allStructures),3);

        for j=1:length(allStructures)
            
           releventEnties = cur_reverseIndex == j;
           if sum(releventEnties) >0;
                cur_xyz(j,:) = mean( cur_structure.mri_voxel_xyz( releventEnties,:),1);
                cur_std(j,:) = std( cur_structure.mri_voxel_xyz( releventEnties,:),0,1);
           end
            
        end
        location_std(:,:,i) = cur_std;
        location_xyz(:,:,i) = cur_xyz;
    end
    
    
end