function computeCorrelationBetweenExpressionMatrix(expressionMatrix1, expressionMatrix2, regionLabels)


    assert(all(size(expressionMatrix1) == size(expressionMatrix2)));
    assert(all(size(expressionMatrix1,2) == length(regionLabels)));
    

    correlationBetweenRegions = corr(expressionMatrix1, expressionMatrix2);
    %correlationBetweenRegions = corr(expressionMatrix1, expressionMatrix2, 'type', 'Spearman');

    [cleanCorrelationMatrix, cleanLabelsRows, cleanLabelsColumns] = removeNaNRowsAndColumn(correlationBetweenRegions, regionLabels);
  
    imagesc(cleanCorrelationMatrix)
end

function [cleanCorrelationMatrix, cleanLabelsRows, cleanLabelsColumns] = removeNaNRowsAndColumn(inputMatrix, matrixLabels)
    
    nanElements = isnan(inputMatrix);
    rowsToRemove = all(nanElements,2);
    columnsToRemove = all(nanElements);
    
    cleanCorrelationMatrix = inputMatrix(~rowsToRemove, ~columnsToRemove);
    cleanLabelsRows = matrixLabels(~rowsToRemove,:);
    cleanLabelsColumns = matrixLabels(~columnsToRemove,:);
end