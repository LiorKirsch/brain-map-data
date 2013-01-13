function [textProblems,numericProblems] = compareData(samples)
    [p,q] = meshgrid(1: size(samples,2), 1: size(samples,2));
    pairs = [p(:) q(:)];
    pairs = unique(sort(pairs,2),'rows');
    
    textCategories = size(samples{1}.textTitles,2);
    numericCategories = size(samples{1}.numericTitles,2);

    textProblems = cell(textCategories,1);
    numericProblems = cell(numericCategories,1);

    for i =1:size(pairs,1);
        firstIndex = pairs(i,1);
        secondIndex = pairs(i,2);
        for j=1:size(textCategories)
            textProblems{j} = [textProblems{j}, find(~strcmp(samples{firstIndex}.textData(:,j), samples{secondIndex}.textData(:,j)))];
        end
        
        for j=1:size(numericCategories)
            numericProblems{j} = [numericProblems{j}, find(~(samples{firstIndex}.numericData(:,j) == samples{secondIndex}.numericData(:,j) ))];
        end
        
    end
end