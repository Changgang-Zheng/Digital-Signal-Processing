%% Problem 1
num=[4 15.6 6 2.4 -6.4];
den=[3 2.4 6.3 -11.4 6];
[sos,G]=tf2sos(num,den);
[z,p,k]=tf2zp(num,den);
p1 = figure;
zplane(z,p);
grid on
set(p1, 'PaperPosition', [0.05 0.05 9 7]);
set(p1, 'PaperSize', [9.05 7.05]);
saveas(p1,['p1.pdf'],'pdf')
%% Problem 2
% z=input('input the zeros=');
% p=input('input the ploes=');
% g=input('input the gain constant=');
z=[1.2 -1j*0.5+2.3 1j*0.2-0.4 -1j*0.2-0.4 1j*0.5+2.3];
p=[0.5 1j*0.2-0.75 1j*0.7+0.6 -1j*0.7+0.6 -1j*0.2-0.75];
g=2.1;
[num,den]=zp2tf(z',p',g);
w = 0:pi/(255):pi;
h=freqz(num,den,w);
p2 = figure;
subplot(2,1,1)
plot(w/pi,abs(h),'LineWidth',2,'color',[1,0.5,0.5]);
title('Magnitude Spectrum')
xlabel('\omega/\pi'); 
ylabel('Magnitude')
grid minor
subplot(2,1,2)
plot(w/pi,angle(h),'LineWidth',2,'color',[1,0.5,0.5]);
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')
grid minor
set(p2, 'PaperPosition', [0.05 0.05 9 7]);
set(p2, 'PaperSize', [9.05 7.05]);
saveas(p2,['p2.pdf'],'pdf')

%% Problem 3
F = [2000 2500];
A = [1 0];
DEV = [0.005 0.005];
Fs = 10000;
[n,wn,beta,typ]=kaiserord(F,A,DEV,Fs); 
b=fir1(n,wn,kaiser(n+1,beta),'noscale');
[h,omega]=freqz(b,1,256);
p3=figure;
subplot(2,1,1)
plot(omega/pi,20*log10(abs(h)),'LineWidth',2,'color',[1,0.5,0.5]); 
xlabel('\omega/\pi'); 
ylabel('Gain, dB'); 
grid minor
subplot(2,1,2)
plot(omega/pi,angle(h),'LineWidth',2,'color',[1,0.5,0.5]);
grid minor
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')
set(p3, 'PaperPosition', [0.05 0.05 9 7]);
set(p3, 'PaperSize', [9.05 7.05]);
saveas(p3,['p3.pdf'],'pdf')
