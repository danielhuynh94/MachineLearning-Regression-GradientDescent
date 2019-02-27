function [RMSE] = myLocallyWeightedLinearRegression(trainFeatures, trainLabels, testFeatures, testLabels)
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

    % Vector for the squared errors
    squaredErrors = zeros(size(standardizedTestFeaturesIncludingBias, 1), 1);

    for i = 1:size(standardizedTestFeatures, 1)

        % Get the train sample
        testSample = standardizedTestFeaturesIncludingBias(i, :);

        % Compute the distance matrices relative to the training data using L1
        distances = sum(abs(standardizedTrainFeaturesIncludingBias - testSample), 2);

        % Compute the local model
        W = diag(exp(distances .* -1));
        transX = transpose(standardizedTrainFeaturesIncludingBias);
        thetas = inv(transX*W*standardizedTrainFeaturesIncludingBias)*transX*W*trainLabels;

        % Compute the squared error of the testing sample
        predictedLabel = testSample * thetas;
        squaredErrors(i) = (predictedLabel-testLabels(i,:)) .^ 2;

    end
    
    RMSE = num2str(sqrt(sum(squaredErrors)/size(standardizedTestFeatures, 1)));
end
