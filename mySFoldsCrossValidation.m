function [meanRMSEs, stdRMSEs] = mySFoldsCrossValidation(data, S, numberOfSeeds)

    RMSEs = zeros(numberOfSeeds, 1);

    for seed = 0:(numberOfSeeds-1)
        
        % Randomize the data
        randomizedData = randomizeData(data, seed);

        % Create S folds
        SFolds = cell(1, S);

        foldIndex = 1;
        for i = 1:size(randomizedData,1)
            if foldIndex > S
                foldIndex = 1;
            end
            SFolds{foldIndex} = [SFolds{foldIndex};randomizedData(i,:)];
            foldIndex = foldIndex + 1;
        end
        
        squaredErrors = [];
        for i = 1:S
            % Select fold i as testing data
            testData = SFolds{i};

            % Select the remaining (S-1) folds as your training data
            trainData = [];
            for j = 1:S
                if i == j
                    continue
                end
                trainData = [trainData; SFolds{j}];
            end

            % Split the data
            trainFeatures = trainData(:,1:end-1);
            trainLabels = trainData(:,end);    
            testFeatures = testData(:,1:end-1);
            testLabels = testData(:,end);

            [coefficients, testRMSE, predictedTestLabels] = myClosedFormLinearRegression(trainFeatures, trainLabels, testFeatures, testLabels);

            squaredErrors = [squaredErrors; ((testLabels - predictedTestLabels) .^ 2)];
        end

        RMSEs(seed+1) = sqrt(sum(squaredErrors)/size(squaredErrors,1));

    end

    meanRMSEs = mean(RMSEs);
    stdRMSEs = std(RMSEs);
end