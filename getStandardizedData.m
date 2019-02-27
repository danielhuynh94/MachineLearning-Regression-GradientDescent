function [standardizedX, meanX, sdX] = getStandardizedData(X)
    meanX = mean(X);
    sdX = std(X);
    standardizedX = (X - meanX) ./ sdX;
end