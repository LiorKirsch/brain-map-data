function [allStructuresData, reverseIndex, location_xyz, location_std] = unifiedStuctures(structuresData)
    allStructuresShort = {};
    allStructuresData = {};
    reverseIndex = cell(size(structuresData));

    
    for i=1:length(structuresData)
        shortNames = structuresData{i}.structureShortName;
        fullData = structuresData{i}.textData;
        [~, nameIndicesA, nameIndicesB] = union(shortNames, allStructuresShort) ;
        allStructuresShort = [ shortNames(nameIndicesA); allStructuresShort(nameIndicesB)];
        allStructuresData = [ fullData(nameIndicesA,:); allStructuresData(nameIndicesB,:)];
    end
    
    for i=1:length(structuresData)
       [tf, reverseIndex{i}] = ismember(structuresData{i}.structureShortName,   allStructuresData(:,2));
    end
    
    
    [location_xyz, location_std] = getStuctureMeanLocation(structuresData, reverseIndex, allStructuresShort);
end