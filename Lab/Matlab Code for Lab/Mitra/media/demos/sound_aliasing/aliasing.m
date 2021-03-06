%
% Example of sound aliasing
%
clear all;

fc = 1.8e3;               % tone freq
Fs = 1e3*8;               % sample freq
Ts = 1/Fs;                % sample time
timelen = 3;              % sample file length

n = 0:ceil(timelen/Ts)-1;
x = 0.9*cos(2*pi*fc*n*Ts);

disp(['tone freq = ',num2str(fc),', sampling frequency = ',num2str(Fs)]);
wavplay(x,Fs);

%
% downsampling
%
d2=3/4;
disp('press any key to continue');
pause
disp(['tone freq = ',num2str(fc),', sampling frequency = ',num2str(Fs*d2)]);
x_d2 = 0.9*cos(2*pi*fc*n*Ts/d2);
wavplay(x_d2(1:floor(length(x_d2)*d2)),Fs*d2);

d3=1/3;
disp('press any key to continue');
pause
disp(['tone freq = ',num2str(fc),', sampling frequency = ',num2str(Fs*d3)]);
x_d3 = 0.9*cos(2*pi*fc*n*Ts/d3);
wavplay(x_d3(1:floor(length(x_d3)*d3)),Fs*d3);

%
% write wav files
%
%wavwrite(x,Fs,16,'output01.wav');
%wavwrite(x_d2(1:floor(length(x_d2)*d2)),Fs*d2,16,'output02.wav');
%wavwrite(x_d3(1:floor(length(x_d3)*d3)),Fs*d3,16,'output03.wav');

%
% show plot
%
Xw = fft(x,length(x));
L = 0:length(Xw)-1;
figure(1);
subplot(2,1,1);
plot(Fs*L/length(Xw)/1e3, 20*log10(abs(Xw))); grid;
xlabel('Frequency, KHz'); ylabel('Gain, dB');
title(['Tone Freq = ',num2str(fc),', Sampling Freq = ',num2str(Fs)]);
subplot(2,1,2);
stem(1:30,x(1:30));
xlabel('n'); ylabel('Magnitude');

Xw_d2 = fft(x_d2,length(x_d2));
L_d2 = 0:length(Xw_d2)-1;
figure(2);
subplot(2,1,1);
plot((Fs*d2)*L_d2/length(Xw_d2)/1e3, 20*log10(abs(Xw_d2))); grid;
xlabel('Frequency, KHz'); ylabel('Gain, dB');
title(['Tone Freq = ',num2str(fc),', Sampling Freq = ',num2str(Fs*d2)]);
subplot(2,1,2);
stem(1:30,x_d2(1:30));
xlabel('n'); ylabel('Magnitude');

Xw_d3 = fft(x_d3,length(x_d3));
L_d3 = 0:length(Xw_d3)-1;
figure(3);
subplot(2,1,1);
plot((Fs*d3)*L_d3/length(Xw_d3)/1e3, 20*log10(abs(Xw_d3))); grid;
xlabel('Frequency, KHz'); ylabel('Gain, dB');
title(['Tone Freq = ',num2str(fc),', Sampling Freq = ',num2str(Fs*d3)]);
subplot(2,1,2);
stem(1:30,x_d3(1:30));
xlabel('n'); ylabel('Magnitude');
