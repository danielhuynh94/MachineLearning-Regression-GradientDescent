clear all;

% Read the data
data = getSimpleData("x06Simple.csv");

% Randomize the data
randomizedData = randomizeData(data, 0);

% Split the data
[trainFeatures, trainLabels, testFeatures, testLabels] = splitData(randomizedData, 2/3);

% Run gradient descent on the data
[coefficients, RMSEs, predictedTestLabels] = myGradientDescent(trainFeatures, trainLabels, testFeatures, testLabels);

% Final model
disp(getFinalModelString(coefficients));

% Plot
RMSEPlot = plot(RMSEs(:,1), RMSEs(:,2), RMSEs(:,1), RMSEs(:,3));
xlabel("Iteration #");
ylabel("Root Mean Square Error (RMSE)");
legend('Training Set', 'Testing Set');

% Compute the RMSE of the testing data
finalTestRMSE = sqrt(sum((testLabels - predictedTestLabels) .^ 2)/size(testLabels,1));
disp(strcat("Final RMSE testing error: ", num2str(finalTestRMSE)));
