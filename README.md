brain-map
=========

[A,b] = buildLeastSquareProblem(correlationMatrix, adjacencyMatrixSource, adjacencyMatrixDestination)
> inputs the two adajacencyMatrices between areas, and a correlation matrix between the expression of each two areas.
> it then generate the matrices A and b that are needed to solve the least squares problem.

regionSimilarity = computeRegionSimilarities(correlationMatrix, adjacencyMatrixSource, adjacencyMatrixDestination)
> compute the region similarity between regions. This function first build the least sqaure problems (using buildLeastSquareProblem) and then obtains the solution.




Reading and early processing functions:
================
mainBuildDataFiles
> The main file for reading and processing the data files.
* 1. some checks on the probes metadata ( compareData(samples) )
* 2. the structure files are combined into one matrix
* 3. builds the expression data matrix of size #probes x #structures x #donors
* 4. save 'expressionMatrixCombainedByStructure.mat'
* 5. reduces the data to only the most correlative probes for each gene
* 6. save 'onlyCorrelativeProbes.mat'


[textProblems,numericProblems] = compareData(samples)
> checks that the all the probe files have the same probes in the same order

[allStructuresData, reverseIndex, location_xyz, location_std] = unifiedStuctures(structuresData)
> since different experiments 9on different subjects) sometime checked different areas, we combine all the examined structure into one matrix.
> each area get also the mean location ( using getStuctureMeanLocation).

structureData = getStructuresData(csvFile)
> reads the structure files into matlab.

probeData = getDonorProbeData(csvFile)
> reads the probe data into matlab. These files describe the probes used in the microarray experiments.

expressionData = getExpressionData(expressionFile)
> reads the microarray expression data from the file.

[selectedProbesData,dataMatrix] = getCorrelativeProbes(dataMatrix, probeData)
> returns the one probes for each gene. the probes selected are the ones which are most correlative among subjects.

[location_xyz, location_std] = getStuctureMeanLocation(structureData, reverseIndex, allStructures)
> for each structure compute the mean location xyz and the standard deviation

dataMatrix = getMeanExpressionInAnArea(expressionData, allStructures, reverseIndex)
>  builds an expression data matrix of size #probes x #structures x #donors
> areas for which we have no data are filled with NaN

