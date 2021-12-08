
% Author: Changgang Zheng
% UESTC ID: 2016200302027
% UoG ID: 2289258z
clear;
clc;

fs=100; % sampling frequency；
N=1024;% sampling points number；
n=[0:N-1]; %order sequence; 
t=n/fs; % time sequence;
x=5.5*sin(20*pi*t)+3.5*cos(10*pi*t); % a complex sequence tested.
X=fft(x,N)/N;% fast frourier transform
X=fftshift(X); 
Y=fliplr(X); %X(e^-jw)
Y_conj=conj(Y);
f=[-N/2:N/2-1]*fs/N; % frequency sequence;

% figure 1
figure(1);
subplot(2,2,1);plot(f,abs(X),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of left part series')
subplot(2,2,2);plot(f,abs(Y_conj),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of right part series')
subplot(2,2,3);plot(f,angle(X),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of left part series')
subplot(2,2,4);plot(f,angle(Y_conj),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of right part series')

% figure 2
figure(2);
subplot(2,2,1);plot(f,real(X),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of left part series')
subplot(2,2,2);plot(f,real(Y),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Real part of right part series')
subplot(2,2,3);plot(f,imag(X),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of left part series')
subplot(2,2,4);plot(f,imag(Y),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Imagine part of right part series')

% figure 3
x_real=real(x); %x_real[n]
X_real=fftshift(fft(x_real,N))*2/N;
X_cs=0.5*(X+conj(fliplr(X)));
figure(3);
subplot(2,2,1);plot(f,abs(X),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('ABS of left part series')
subplot(2,2,2);plot(f,abs(Y),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('ABS of right part series')
subplot(2,2,3);plot(f,angle(X),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Angle of left part series')
subplot(2,2,4);plot(f,angle(Y),'LineWidth',1,'color',[1,0.5,0.5]);
grid minor;xlabel('frequency');ylabel('Angle of right part series')

