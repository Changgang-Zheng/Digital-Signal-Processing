%% problem 1
clear
clc

% use the defination
n=0:31;
x=sin(pi*n/4);
y_defination=zeros(1,128);
for k=1:128
    y=0;
    for n=1:32
        y=y+x(n)*exp(-1j*2*pi*(k-1)*(n-1)/128);
    end 
    y_defination(k)=y;
end
k=1:128;

fig1 = figure;
subplot(2,1,1)
plot(k,y_defination,'LineWidth',1.5,'color',[1,0.5,0.5])
xlabel('n'); 
ylabel('Magnitude (by property)')
grid minor

% use the DFT function

n1=0:31;
x2=sin(pi*n1/4);
y_DFT=fft(x2,128);
subplot(2,1,2)
plot(k,y_DFT,'LineWidth',1.5,'color',[1,0.5,0.5])
xlabel('n'); 
ylabel('Magnitude (by DFT function)')
grid minor
saveas(fig1,['p1.pdf'],'pdf')

%% problem 2
clear
clc

num=[0.15 0 -0.15];
den=[1 -0.5 0.7];
[h,w]=freqz(num,den);
fig2 = figure;
subplot(2,1,1);
plot(w/pi,abs(h),'LineWidth',1.5,'color',[1,0.5,0.5]);
xlabel('\omega/\pi'); 
ylabel('Magnitude of the function')
grid minor

n1=0:31;
x2=sin(pi*n1/4);
y2=fft(x2,128);
subplot(2,1,2)
plot(w/pi,phase(h),'LineWidth',1.5,'color',[1,0.5,0.5])
xlabel('\omega/\pi'); 
ylabel('Phase of the function')
grid minor
saveas(fig2,['p2.pdf'],'pdf')

%% problem 3
clear
clc

n=0:10;
g=cos(0.2*pi*n);
h=3.^n;
y=conv(g,h);
n1=0:length(y)-1;
fig3 = stem(n1,y,'.','LineWidth',1.5,'color',[1,0.5,0.5]);
xlabel('n'); 
ylabel('linear convolution of two length-N sequences')
grid minor
saveas(fig3,['p3.pdf'],'pdf')
%% problem 4
clear
clc

% num = input('Numerator coefficients = ');
% den = input('Denominator coefficients = ');
k = 1000;
num = [1.35 4.95 8.55 4.95 1.8];
den = [0.9 -1.8 1.65 -0.75 0.15];

% Compute the frequency response
w = 0:pi/(k-1):pi;
h = freqz(num, den, w);
% Plot the frequency response
fig4 = figure;
subplot(2,2,1)
plot(w/pi,real(h),'LineWidth',1.5,'color',[1,0.5,0.5])
title('Real part')
xlabel('\omega/\pi'); 
ylabel('Amplitude')
grid minor

subplot(2,2,2)
plot(w/pi,imag(h),'LineWidth',1.5,'color',[1,0.5,0.5])
title('Imaginary part')
xlabel('\omega/\pi'); 
ylabel('Amplitude')
grid minor

subplot(2,2,3)
plot(w/pi,abs(h),'LineWidth',1.5,'color',[1,0.5,0.5])
title('Magnitude Spectrum')
xlabel('\omega/\pi'); 
ylabel('Magnitude')
grid minor

subplot(2,2,4)
plot(w/pi,angle(h),'LineWidth',1.5,'color',[1,0.5,0.5])  %unwrap(angle(h))
title('Phase Spectrum')
xlabel('\omega/\pi'); 
ylabel('Phase, radians')
grid minor
saveas(fig4,['p4.pdf'],'pdf')

fig4unwarp = figure;
plot(w/pi,unwrap(angle(h)),'LineWidth',1.5,'color',[1,0.5,0.5])  
title('Unwarped Phase Spectrum')
xlabel('\omega/\pi'); 
ylabel('Phase after unwarp, radians')
grid minor
saveas(fig4unwarp,['p4unwarp.pdf'],'pdf')




%% =========== problem 4 part two ===========

clear
clc

% num = input('Numerator coefficients = ');
% den = input('Denominator coefficients = ');
k = 1000;
num = [1.35 4.95 8.55 4.95 1.8];
den = [0.9 -1.8 1.65 -0.75 0.15];

% Compute the frequency response
w = 0:pi/(k-1):10*pi;
h = freqz(num, den, w);
% Plot the frequency response
fig4_2 = figure;
subplot(2,2,1)
plot(w/pi,real(h),'LineWidth',1.5,'color',[1,0.5,0.5])
title('Real part')
xlabel('\omega/\pi'); 
ylabel('Amplitude')
grid minor

subplot(2,2,2)
plot(w/pi,imag(h),'LineWidth',1.5,'color',[1,0.5,0.5])
title('Imaginary part')
xlabel('\omega/\pi'); 
ylabel('Amplitude')
grid minor

subplot(2,2,3)
plot(w/pi,abs(h),'LineWidth',1.5,'color',[1,0.5,0.5])
title('Magnitude Spectrum')
xlabel('\omega/\pi'); 
ylabel('Magnitude')
grid minor

subplot(2,2,4)
plot(w/pi,angle(h),'LineWidth',1.5,'color',[1,0.5,0.5])  %unwrap(angle(h))
title('Phase Spectrum')
xlabel('\omega/\pi'); 
ylabel('Phase, radians')
grid minor
saveas(fig4_2,['p4_2.pdf'],'pdf')


%% problem 5
clear
clc

syms t;
x=sin(0.1*pi*t)+2*cos(0.3*pi*5*t)+3*sin(0.5*pi*t);
ft=20000;
n=1:64;
y=subs(x,t,n/ft);

fig5 = figure;

subplot(2,1,1)
[h,w]=freqz(double(y),1);
plot(w/pi,abs(h),'LineWidth',1.5,'color',[1,0.5,0.5]);
title('Magnitude spectrum of the sampled samples')
xlabel('\omega/\pi'); 
ylabel('Magnitude')
grid minor

subplot(2,1,2)
plot(w/pi,angle(h),'LineWidth',1.5,'color',[1,0.5,0.5]);
title('Phase spectrum of the sampled samples')
xlabel('\omega/\pi'); 
ylabel('Phase')
grid minor
saveas(fig5,['p5.pdf'],'pdf')
