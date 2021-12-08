
% Author: Changgang Zheng
% UESTC ID: 2016200302027
% UoG ID: 2289258z
clear;
clc;

fs=100; % sampling frequency；
N=1024;% sampling points number；
n=[0:N-1]; %order sequence; 
t=n/fs; % time sequence;
x=0.7*exp(1i*5*pi*t+t.*t); % a complex sequence tested.
X=fft(x,N)*2/N;% fast frourier transform
X=fftshift(X); 
f=[-N/2:N/2-1]*fs/N; % frequency sequence;

% property 1
x_inverse=fliplr(x); % x[-n]
X_inverse=fftshift(fft(x_inverse,N))*2/N;
figure(1);
subplot(2,2,1);plot(f,real(X_inverse),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of FT of left part series')
subplot(2,2,2);plot(f,real(fliplr(X)),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of right part series')
subplot(2,2,3);plot(f,imag(X_inverse),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of FT of left part series')
subplot(2,2,4);plot(f,imag(fliplr(X)),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of right part series')

% property 2
x_inverse_conj=conj(x_inverse); % x*[-n]
X_inverse_conj=fftshift(fft(x_inverse_conj,N))*2/N;
figure(2);
subplot(2,2,1);plot(f,real(X_inverse_conj),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of FT of left part series')
subplot(2,2,2);plot(f,real(conj(X)),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of right part series')
subplot(2,2,3);plot(f,imag(X_inverse_conj),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of FT of left part series')
subplot(2,2,4);plot(f,imag(conj(X)),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of right part series')

% property 3
x_real=real(x); %x_real[n]
X_real=fftshift(fft(x_real,N))*2/N;
X_cs=0.5*(X+conj(fliplr(X)));
figure(3);
subplot(2,2,1);plot(f,abs(X_real),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('ABS of real FT of left part series')
subplot(2,2,2);plot(f,abs(X_cs),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('ABS of real right part series')
subplot(2,2,3);plot(f,angle(X_real),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Angle of real FT of left part series')
subplot(2,2,4);plot(f,angle(X_cs),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Angle of real right part series')

% property 4
x_imag=1i*imag(x); %i*x_image[n]
X_imag=fftshift(fft(x_imag,N))*2/N;
X_ca=0.5*(X-conj(fliplr(X)));
figure(4);
subplot(2,2,1);plot(f,abs(X_imag),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('ABS of real FT of left part series')
subplot(2,2,2);plot(f,abs(X_ca),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('ABS of real right part series')
subplot(2,2,3);plot(f,unwrap(angle(X_imag)),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Angle of real FT of left part series')
subplot(2,2,4);plot(f,unwrap(angle(X_ca)),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Angle of real right part series')

% property 5 
x_cs=0.5*(x+conj(fliplr(x))); %x_cs[n]
X_cs=fftshift(fft(x_cs,N))*2/N;
figure(5);
subplot(1,2,1);plot(f,real(X_cs),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of FT of left part series')
subplot(1,2,2);plot(f,real(X),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of right part series')

% property 6 
x_ca=0.5*(x-conj(fliplr(x))); %x_ca[n]
X_ca=fftshift(fft(x_ca,N))*2/N;
figure(6);
subplot(1,2,1);plot(f,imag(X_ca),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of FT of left part series')
subplot(1,2,2);plot(f,imag(X),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of right part series')



