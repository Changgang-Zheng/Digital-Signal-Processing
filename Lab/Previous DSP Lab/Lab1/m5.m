Fs = 20000;
L = 64;
N = (1:L)/Fs;
x = sin(0.1*pi*N)+2*cos(0.3*pi*N)+3*sin(0.5*pi*N);

[H,W] = freqz(x,1);

subplot(211);
plot(W,abs(H));
xlabel('Frequency');
ylabel('|X(k)|');
title('Frequency domain - Magnitude response')

subplot(212);
plot(W,angle(H));
xlabel('Frequency');
ylabel('Phase');
title('Frequency domain - Phase response')
