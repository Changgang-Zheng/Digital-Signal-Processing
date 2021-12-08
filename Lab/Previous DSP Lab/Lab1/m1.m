clear;
cnt = 32;
N = 128;
x = sin(pi*(0:cnt-1)/4);

[t,X] = dft(x,N);

figure;
plot(0:cnt-1,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time domain - Input sequence')

figure;
plot((0:N-1)*cnt/N,real(fft(x,N)),'b')
xlabel('Frequency');
ylabel('|X(k)|');
title('Freq domain - Magnitude')

hold on;
plot((0:N-1)*cnt/N,real(X),'r')
xlabel('Frequency');
ylabel('|X(k)|');

legend("(MATLAB)","(Definition)")