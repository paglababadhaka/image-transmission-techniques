img = imread('me.png');
img = rgb2gray(img); 
img = double(img) / 255;

fs = 10000; 
Ts = 1/fs; 

fc = 1000;
 
modulated_signal = ssbmod(img, fc, fs);

SNR_dB = 10; 
noisy_signal = awgn(modulated_signal, SNR_dB, 'measured');

demodulated_signal = ssbdemod(noisy_signal, fc, fs, beta);
figure;
subplot(1,3,1); imshow(img); title('Original Image');
subplot(1,3,2); plot(real(noisy_signal)); title('Noisy Modulated Signal');
subplot(1,3,3); imshow(demodulated_signal); title('Demodulated Image');
