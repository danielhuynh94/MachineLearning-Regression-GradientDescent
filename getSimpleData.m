function data = getSimpleData(fileName)
    % Read the csv file
    dataTable = readtable(fileName);

    % Convert the table data to matrix
    data = table2array(dataTable(:,2:end));
end