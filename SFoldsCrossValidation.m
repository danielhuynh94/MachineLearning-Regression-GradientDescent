clear all;

% Get the data
data = getSimpleData("x06Simple.csv");

% S = 3; numberOfSeeds = 20
[meanRMSEs, stdRMSEs] = mySFoldsCrossValidation(data, 3, 20);
disp("S = 3 over the 20 different seed values:")
disp(strcat("Average: ", num2str(meanRMSEs)));
disp(strcat("Standard Deviation: ", num2str(stdRMSEs)));

% S = 5; numberOfSeeds = 20
[meanRMSEs, stdRMSEs] = mySFoldsCrossValidation(data, 5, 20);
disp("S = 5 over the 20 different seed values:")
disp(strcat("Average: ", num2str(meanRMSEs)));
disp(strcat("Standard Deviation: ", num2str(stdRMSEs)));

% S = 20; numberOfSeeds = 20
[meanRMSEs, stdRMSEs] = mySFoldsCrossValidation(data, 20, 20);
disp("S = 20 over the 20 different seed values:")
disp(strcat("Average: ", num2str(meanRMSEs)));
disp(strcat("Standard Deviation: ", num2str(stdRMSEs)));

% S = N; numberOfSeeds = 20
[meanRMSEs, stdRMSEs] = mySFoldsCrossValidation(data, size(data,1), 20);
disp("S = 44 over the 20 different seed values:")
disp(strcat("Average: ", num2str(meanRMSEs)));
disp(strcat("Standard Deviation: ", num2str(stdRMSEs)));