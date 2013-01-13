function expressionData = getExpressionData(expressionFile)

    load(expressionFile);
    expressionData.expressionMatrix = MicroarrayExpression(:,2:end);
    expressionData.probeCode = MicroarrayExpression(:,1);
end