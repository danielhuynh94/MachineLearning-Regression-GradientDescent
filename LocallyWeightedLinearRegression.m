clear all;

% Read the data
data = getSimpleData("x06Simple.csv");

% Randomize the data
randomizedData = randomizeData(data, 0);

% Split the data
[trainFeatures, trainLabels, testFeatures, testLabels] = splitData(randomizedData, 2/3);

% Get the RMSE
RMSE = myLocallyWeightedLinearRegression(trainFeatures, trainLabels, testFeatures, testLabels);

% squaredErrors
disp(strcat("Root mean squared error (RMSE): ", num2str(RMSE)));


