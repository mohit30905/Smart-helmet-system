clc;
clear all;

%% Step 1: Setup Folders
datasetPath = 'E:\matlab\projects\Eureka'; % Change this

%% Step 2: Read labels from CSV
% Assuming the CSV is in the same folder
opts = detectImportOptions(fullfile(datasetPath, 'hornbase.csv'));
labelsTable = readtable(fullfile(datasetPath, 'hornbase.csv'), opts);

%% Step 3: Move Files into Folders
for i = 1:1080
    fileName = labelsTable.file{i};
    label = labelsTable.classNumber(i);

    source = fullfile(datasetPath,'dataset' ,fileName);

    if label == 1
        destination = fullfile(datasetPath, 'Horn', fileName);
    else
        destination = fullfile(datasetPath, 'noise', fileName);
    end

    % Move the file if it exists
    if exist(source, 'file')
        movefile(source, destination);
    end
end

disp('Files have been sorted into /Horn and /No_Horn folders.');

