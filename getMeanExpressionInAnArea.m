function dataMatrix = getMeanExpressionInAnArea(expressionData, allStructures, reverseIndex)

    numberOfProbes = size(expressionData{1},1);
    numberOfDonors = length(expressionData);
    
    dataMatrix = nan(numberOfProbes, length(allStructures), numberOfDonors);
    for i =1:numberOfDonors
        
        for j=1:length(allStructures)
           dataMatrix(:,j,i) = mean( expressionData{i}(:,reverseIndex{i} == j),2);
        end
%         for j=1:numberOfProbes
%             dataMatrix(j,:,i) = accumarray(reverseIndex{i}, expressionData{i}(j,:), [], @mean);
%             
%             if mod(j,1000) == 0
%                disp(round(100* j/numberOfProbes) /100); 
%             end
% 
%         end
    end

end