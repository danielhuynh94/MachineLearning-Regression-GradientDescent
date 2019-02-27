function randomizedData = randomizeData(data, seed)
    rng(seed);
    % Randomize the data
    idx = randperm(size(data,1));
    randomizedData = (data(idx,:));
end