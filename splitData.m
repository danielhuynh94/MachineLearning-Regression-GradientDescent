function [trainFeatures, trainLabels, testFeatures, testLabels] = splitData(data, trainProportion)
    % Calculate the number of training rows
    numberOfTrainData = ceil(size(data,1)*trainProportion);

    % Extract training and testing data
    trainData = data(1:numberOfTrainData,:);
    testData = data(numberOfTrainData+1:end,:);

    % Split the randomized data into 4 groups
    trainFeatures = trainData(:,1:end-1);
    trainLabels = trainData(:,end);
    testFeatures = testData(:,1:end-1);
    testLabels = testData(:,end);
end