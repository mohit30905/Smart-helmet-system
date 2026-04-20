%% Master Feature Extraction (Combining All Signature Features)
clear; clc;
datasetPath = 'E:\matlab\projects\Eureka'; 
classes = {'horn', 'noise'};
featureTable = table();

for c = 1:length(classes)
    currentClass = classes{c};
    fileList = dir(fullfile(datasetPath, currentClass, '*.wav'));
    fprintf('Processing %s: building 5-dimensional feature map...\n', currentClass);
    
    for i = 1:length(fileList)
        [audio, Fs] = audioread(fullfile(datasetPath, currentClass, fileList(i).name));
        audio = audio(:,1); 
        if length(audio) > Fs, audio = audio(1:Fs); end
        
        % 1. Power Spectral Density
        [pxx, f] = pwelch(audio, rectwin(length(audio)), 0, length(audio), Fs);
        bandIdx = (f >= 300 & f <= 3000); % Your specified horn band [cite: 14]
        relevantPxx = pxx(bandIdx);
        relevantFreqs = f(bandIdx);
        
        % --- FEATURE 1: Energy (Loudness in band) [cite: 22] ---
        Energy = 10*log10(mean(relevantPxx)); 
        
        % --- FEATURE 2: PeakFreq (The "Pitch")  ---
        [~, maxIdx] = max(relevantPxx);
        PeakFreq = relevantFreqs(maxIdx);
        
        % --- FEATURE 3: Centroid (Brightness/Center of Gravity) ---
        Centroid = sum(relevantFreqs .* relevantPxx) / sum(relevantPxx);
        
        % --- FEATURE 4: Flux (Suddenness of sound) ---
        specDiff = diff(abs(fft(audio)));
        Flux = mean(specDiff.^2); 
        
        % --- FEATURE 5: Rolloff (Spectral shape) ---
        cumulativeEnergy = cumsum(relevantPxx);
        rolloffIdx = find(cumulativeEnergy >= 0.85 * sum(relevantPxx), 1);
        Rolloff = relevantFreqs(rolloffIdx);

        % 2. Build the Final Table
        newRow = table(Energy, PeakFreq, Centroid, Flux, Rolloff, string(currentClass), ...
            'VariableNames', {'Energy', 'PeakFreq', 'Centroid', 'Flux', 'Rolloff', 'Label'});
        featureTable = [featureTable; newRow];
    end
end

featureTable.Label = categorical(featureTable.Label);
save('AdvancedHornFeatures.mat', 'featureTable');
disp('Done! You now have a 5-feature dataset ready for retraining.');