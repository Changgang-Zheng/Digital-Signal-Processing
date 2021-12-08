a = [1 -0.5 0.7];
b = [0.15 0 -0.15];
p = 64;
[h,w] = freqz(b,a,p);

subplot(211);
plot(w,abs(h));
xlabel('Frequency');
ylabel('Amplitude');
title('Frequency domain - Magnitude response')
subplot(212);
plot(w,angle(h));
xlabel('Frequency');
ylabel('Amplitude');
title('Frequency domain - Phase response')