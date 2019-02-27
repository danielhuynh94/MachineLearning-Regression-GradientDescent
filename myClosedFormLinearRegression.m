function [thetas, testRMSE, predictedTestLabels] = myClosedFormLinearRegression(trainFeatures, trainLabels, testFeatures, testLabels)
    
    [standardizedTrainFeatures, meanTrainFeatures, stdTrainFeatures] = getStandardizedData(trainFeatures); 

    % X: standardized training data including bias feature
    X = [ones(size(trainFeatures,1),1) standardizedTrainFeatures];

    % Calculate the weights
    transX = transpose(X);
    thetas = (transX*X)\transX*trainLabels;
    
    % Standardize testing data
    standardizedTestFeatures = (testFeatures - meanTrainFeatures) ./ stdTrainFeatures;
    standardizedTestFeaturesIncludingBias = [ones(size(standardizedTestFeatures,1), 1) standardizedTestFeatures];
    predictedTestLabels = standardizedTestFeaturesIncludingBias * thetas;

    % Calculate RMSE from the testing data
    testRMSE = sqrt(sum((testLabels - predictedTestLabels) .^ 2)/size(testLabels,1));
end