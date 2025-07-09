
img = imread('me.png');  %

gray_img = rgb2gray(img);
signal = reshape(gray_img, 1, []); 

signal = signal / max(signal); 

fft_signal = fft(signal);
magnitude_spectrum = abs(fft_signal);
plot(magnitude_spectrum);
