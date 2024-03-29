function showExpressionOfKClusters(expressionMatrix, structuresLocation, k)
    assert(size(expressionMatrix,2) == size(structuresLocation,1), 'number of columns in the expression matrix should be the same as the number of rows in the structureLocation');
    
    expressionMatrix = expressionMatrix';
    kClustersIndices = kmeans(expressionMatrix, k);
    
    
    kcolors = set_colors_dobule();
    
    structurtesColors = kcolors(kClustersIndices,:);
    scatter3(structuresLocation(:,1), structuresLocation(:,2), structuresLocation(:,3),15 , structurtesColors, 'filled');

end