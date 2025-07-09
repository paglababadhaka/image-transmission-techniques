clc;clear all;close all;

% Parameters
fs = 10000;          % Sampling frequency
Fc = 1000;           % Carrier frequency
Fm = 100;            % Message signal frequency
Amplitude = 2;      % Message signal amplitude

% Time vector
t = 0:0.001/Fm:3/Fm;

message = Amplitude * sin(2*pi*Fm*t);
carrier = Amplitude * sin(2*pi*Fc*t);

subplot(311)
plot(t,message);
hold on;
plot(t,carrier);

fm_signal= fmmod(message, Fc, fs, 100);

subplot(312)
plot(t,fm_signal);

rec = fmdemod(fm_signal, Fc, fs, 100);
subplot(313);
plot(t,rec);