%% Test Your Smart Helmet Model on a New File
clearvars -except trainedModel; % Keep the model, clear everything else
clc;

% 1. Load a NEW audio file (one not in your training folders)
[file, path] = uigetfile('*.mp4', 'Select a test audio file');
if isequal(file,0), return; end % Exit if user cancels
[audio, Fs] = audioread(fullfile(path, file));

% 2. Pre-process (Mono and 1-second limit)
audio = audio(:,1); 
if length(audio) > Fs, audio = audio(1:Fs); end

% 3. EXTRACT THE 5 FEATURES (Must match your training script exactly)
% A. Spectral Power Density
[pxx, f] = pwelch(audio, rectwin(length(audio)), 0, length(audio), Fs);
bandIdx = (f >= 300 & f <= 3000);
relevantPxx = pxx(bandIdx);
relevantFreqs = f(bandIdx);

% B. Calculate the 5 values
Energy = 10*log10(mean(relevantPxx)); 
[~, maxIdx] = max(relevantPxx);
PeakFreq = relevantFreqs(maxIdx);
Centroid = sum(relevantFreqs .* relevantPxx) / sum(relevantPxx);
Flux = mean(diff(abs(fft(audio))).^2); 
rolloffIdx = find(cumsum(relevantPxx) >= 0.85 * sum(relevantPxx), 1);
Rolloff = relevantFreqs(rolloffIdx);

% 4. Create a table for the model
testTable = table(Energy, PeakFreq, Centroid, Flux, Rolloff, ...
    'VariableNames', {'Energy', 'PeakFreq', 'Centroid', 'Flux', 'Rolloff'});

% --- UPDATED PREDICTION DISPLAY ---
[prediction, rawScores] = trainedModel.predictFcn(testTable);

% Convert Raw Scores to Probabilities using Sigmoid/Softmax logic
% This handles those large 500%+ numbers
expScores = exp(rawScores); 
prob = expScores ./ sum(expScores); 

fprintf('\n--- TEST RESULTS (NORMALIZED) ---\n');
fprintf('File: %s\n', file);
fprintf('Prediction: **%s**\n', string(prediction));
fprintf('Confidence: Horn (%.1f%%) | Noise (%.1f%%)\n', prob(1)*100, prob(2)*100);
