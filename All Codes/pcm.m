
[y, Fs] = audioread('audio.ogg'); 
y = y / max(abs(y));

encodedSignal = y(:);  

repetitionFactor = 2;
encodedSignalRepeated = repelem(encodedSignal, repetitionFactor);

SNR_dB = 10; 

receivedSignal = awgn(encodedSignalRepeated, SNR_dB, 'measured');

decodedSignalRepeated = reshape(receivedSignal, repetitionFactor, []);
decodedSignal = mode(decodedSignalRepeated);
decodedAudio = reshape(decodedSignal, size(y));

% sound(y, Fs);
pause(1); 
sound(decodedAudio, Fs);
