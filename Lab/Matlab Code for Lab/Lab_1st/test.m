clear
clc

%% problem 1
n=0:31;
x=sin(pi*n/4);
y1=zeros(1,128);
for k=1:128
    y=0;
    for n=1:32
        y=y+x(n)*exp(-j*2*pi*(k-1)*(n-1)/128);
    end 
    y1(k)=y;
end
k=1:128;

figure
subplot(2,1,1)
plot(k,y1)

n1=0:31;
x2=sin(pi*n1/4);
y2=fft(x2,128);
subplot(2,1,2)
plot(k,y2)


%% problem 2

num=[0.15 0 -0.15];
den=[1 -0.5 0.7];
[h,w]=freqz(num,den);
figure
plot(w/pi,abs(h));
%从图看似乎是bandpass


%% problem 3

n=0:10;
g=cos(0.2*pi*n);
h=3.^n;
y=conv(g,h);
n1=0:length(y)-1;
stem(n1,y);

%% problem 4

k=1024;
num = input('Numerator coefficients = ');
den = input('Denominator coefficients = ');
% Compute the frequency response
w = 0:pi/(k-1):pi;
h = freqz(num, den, w);
% Plot the frequency response
figure
subplot(2,2,1)
plot(w./pi,real(h));grid
title('Real part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(2,2,2)
plot(w./pi,imag(h));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(2,2,3)
plot(w./pi,abs(h));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
subplot(2,2,4)
plot(w./pi,angle(h));grid  %unwrap(angle(h))
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')



%% problem 5
syms t;
x=sin(0.1*pi*t)+2*cos(0.3*pi*5*t)+3*sin(0.5*pi*t);
ft=20000;
n=1:64;
y=subs(x,t,n/ft);
subplot(2,1,1)
[h,w]=freqz(double(y),[1]);
plot(w/pi,abs(h));
title('Magnitude spectrum of the sampled samples')
xlabel('\omega/\pi'); ylabel('Magnitude')
subplot(2,1,2)
plot(w/pi,angle(h));
title('Phase spectrum of the sampled samples')
xlabel('\omega/\pi'); ylabel('Phase')




