probeData1 = getDonorProbeData('donor 9861/Probes.csv');
probeData2 = getDonorProbeData('donor 10021/Probes.csv');
probeData3 = getDonorProbeData('donor 12876/Probes.csv');
probeData4 = getDonorProbeData('donor 14380/Probes.csv');


[textDiff, numericDiff] = compareData( {probeData1, probeData2 , probeData3 , probeData4} );



structureData1 = getStructuresData('donor 9861/SampleAnnot.csv');
structureData2 = getStructuresData('donor 10021/SampleAnnot.csv');
structureData3 = getStructuresData('donor 12876/SampleAnnot.csv');
structureData4 = getStructuresData('donor 14380/SampleAnnot.csv');


[allStructures, reverseIndex, location_xyz, location_std] = unifiedStuctures({structureData1, structureData2 , structureData3 , structureData4});



%%%%%%%%%%%%%%%%%%%%%%%%%
% failed because different subjects were measured at different areas
%%%%%%%%%%%%%%%%%%%%%%%%%
%[textDiff, numericDiff] = compareData({structureData1, structureData2 , structureData3 , structureData4});


expressionData1 = getExpressionData('donor 9861/MicroarrayExpression.mat');
expressionData2 = getExpressionData('donor 10021/MicroarrayExpression.mat');
expressionData3 = getExpressionData('donor 12876/MicroarrayExpression.mat');
expressionData4 = getExpressionData('donor 14380/MicroarrayExpression.mat');

dataMatrix = getMeanExpressionInAnArea({expressionData1.expressionMatrix, expressionData2.expressionMatrix, expressionData3.expressionMatrix, expressionData4.expressionMatrix}, allStructures, reverseIndex);
save('expressionMatrixCombainedByStructure.mat', 'dataMatrix', 'allStructures', 'reverseIndex', 'location_xyz', 'location_std');

[selectedProbesData,dataMatrixOfSelectedProbes] = getCorrelativeProbes(dataMatrix, probeData1);
save('onlyCorrelativeProbes.mat', 'selectedProbesData','dataMatrixOfSelectedProbes');


computeCorrelationBetweenExpressionMatrix(dataMatrix(:,:,1), dataMatrix(:,:,2), allStructures)
% showExpressionOfKClusters(expressionData1.expressionMatrix, structureData1.mri_voxel_xyz, 3)
% 
% plotScatterForLocation(structureData1.mri_voxel_xyz);
% expressionMatrix1 = expressionData1.expressionMatrix;
% 
% save('humanData.mat','expressionMatrix1', 'expressionMatrix2', 'expressionMatrix3', 'expressionMatrix4', 'probeData', 'structureData1', 'structureData2', 'structureData3', 'structureData4');

