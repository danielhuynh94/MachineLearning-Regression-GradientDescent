function [coefficients, RMSEs, predictedTestLabels] = myGradientDescent(trainFeatures, trainLabels, testFeatures, testLabels)
    % Compute the mean and sd of the train features
    trainMean = mean(trainFeatures);
    trainStd = std(trainFeatures);

    % Standardize the train features
    standardizedTrainFeatures = (trainFeatures - trainMean) ./ trainStd;
    % Add the bias feature to the train features
    standardizedTrainFeaturesIncludingBias = [ones(size(trainFeatures,1),1) standardizedTrainFeatures];

    % Standardize the test features
    standardizedTestFeatures = (testFeatures - trainMean) ./ trainStd;
    % Add the bias feature to the test features
    standardizedTestFeaturesIncludingBias = [ones(size(testFeatures,1),1) standardizedTestFeatures];

    % Use random values [-1,1] for the coefficients at first
    thetas = -1 + (1+1) .* rand(size(standardizedTrainFeaturesIncludingBias, 2),1);

    prevRMSE = 0;
    trainRMSE = 0;
    iteration = 1;
    RMSEs = [];
    while (iteration == 1 || (iteration < 1000000 && abs((trainRMSE-prevRMSE)*100/prevRMSE) >= eps('single')))

        % Compute the RMSE of the training data
        predictedTrainLabels = standardizedTrainFeaturesIncludingBias*thetas;
        prevRMSE = trainRMSE;
        trainRMSE = sqrt(sum((trainLabels - predictedTrainLabels) .^ 2)/size(trainLabels,1));

        % Compute
        predictedTestLabels = standardizedTestFeaturesIncludingBias*thetas;
        testRMSE = sqrt(sum((testLabels - predictedTestLabels) .^ 2)/size(testLabels,1));

        RMSEs = [RMSEs; [iteration, trainRMSE, testRMSE]];

        % Update each parameter using batch gradient descent
        coefficients = thetas;
        thetas = thetas - (0.01/size(standardizedTrainFeaturesIncludingBias,1)).*transpose(standardizedTrainFeaturesIncludingBias)*((standardizedTrainFeaturesIncludingBias*thetas)-trainLabels);

        iteration = iteration + 1;
    end
    
    predictedTestLabels = standardizedTestFeaturesIncludingBias*coefficients;
end