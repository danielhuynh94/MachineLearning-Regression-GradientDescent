clear all;

% Read the data
data = getSimpleData("x06Simple.csv");

% Randomize the data
randomizedData = randomizeData(data, 0);

% Split the data
[trainFeatures, trainLabels, testFeatures, testLabels] = splitData(randomizedData, 2/3);

% Run the Closed Form Linear Regression algorithm
[coefficients, testRMSE, predictedTestLabels] = myClosedFormLinearRegression(trainFeatures, trainLabels, testFeatures, testLabels);

% Display final model
disp(getFinalModelString(coefficients));

% Display the testing RMSE
disp(strcat("Root mean squared error (RMSE): ", num2str(testRMSE)));
