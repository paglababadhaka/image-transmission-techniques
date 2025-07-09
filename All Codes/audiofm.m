
[audio, Fs] = audioread('audio.ogg');

audio = audio / max(abs(audio));
Fc = 1000;  
dev = 50;   
t = (0:length(audio)-1) / Fs;

modulated_signal = fmmod(audio, Fc, Fs, dev);

snr = 60; 
noisy_signal = awgn(modulated_signal, snr, 'measured');

demodulated_signal = fmdemod(noisy_signal, Fc, Fs, dev);

figure;
subplot(3,1,1); plot(t, audio); title('Original Audio Signal');
subplot(3,1,2); plot(t, modulated_signal); title('Modulated Signal');
subplot(3,1,3); plot(t, demodulated_signal); title('Demodulated Audio Signal');


% sound(audio, Fs);
pause(2);  
sound(demodulated_signal, Fs);
