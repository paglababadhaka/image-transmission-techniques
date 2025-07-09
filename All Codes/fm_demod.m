
fc = 100; 
beta = 5;   
fm = 5;      
Kv = 100;
Kf = 1;      
tau = 0.1;   

t = 0:0.001:pi;  
msg = sin(2*pi*fm*t);
fm_signal = sin(2*pi*fc*t + beta*msg);

vco_out = zeros(size(t));
vco_input = 0;
error_filtered = 0; 


for i = 2:length(t)
    error = fm_signal(i) * vco_out(i-1);
    error_filtered = error_filtered + Kf * error * 0.001; 

    vco_input = vco_input + error_filtered * 0.001;
    vco_out(i) = sin(2*pi*fc*t(i) + Kv*vco_input);
end

demodulated_signal = diff(unwrap(angle(vco_out)));
demodulated_signal = demodulated_signal / (2*pi*Kv);
demodulated_signal = [0 demodulated_signal]; 

figure;
subplot(311)
plot(t, msg);
title('Message Signal');

subplot(312)
plot(t, fm_signal);
title('FM Signal');

subplot(313)
plot(t, demodulated_signal);
title('Demodulated Signal');
legend('FM Signal', 'VCO Output', 'Demodulated Signal');
xlabel('Time (s)');
