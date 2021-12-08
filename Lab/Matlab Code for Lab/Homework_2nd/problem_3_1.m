% % Program 3_1
% % Discrete-Time Fourier Transform Computation
% %
% % Read in the desired number of frequency samples
% k = input('Number of frequency points = ');
% % Read in the numerator and denominator coefficients
% num = input('Numerator coefficients = ');
% den = input('Denominator coefficients = ');
% % Compute the frequency response
% w = 0:pi/(k-1):pi;
% h = freqz(num, den, w);
% % Plot the frequency response
% subplot(2,2,1)
% plot(w/pi,real(h));grid
% title('Real part')
% xlabel('\omega/\pi'); ylabel('Amplitude')
% grid minor
% subplot(2,2,2)
% plot(w/pi,imag(h));grid
% title('Imaginary part')
% xlabel('\omega/\pi'); ylabel('Amplitude')
% grid minor
% subplot(2,2,3)
% plot(w/pi,abs(h));grid
% title('Magnitude Spectrum')
% xlabel('\omega/\pi'); ylabel('Magnitude')
% grid minor
% subplot(2,2,4)
% plot(w/pi,angle(h));grid
% title('Phase Spectrum')
% xlabel('\omega/\pi'); ylabel('Phase, radians')
% grid minor


% Author: Changgang Zheng
% UESTC ID: 2016200302027
% UoG ID: 2289258z

clear
clc
r = 0.9;
seita = 0.75;
syms w
range = [0:0.01:3.14];
G= 1/(1-2*r*(cos(seita)*exp(-1j*w))+r^2*exp(-2*1j*w));
G=subs(G,w,range);

figure;
subplot(2,2,1);
R=plot(range,real(G),'LineWidth',1,'color',[1,0.5,0.5]);
xlabel('w/pi')
ylabel('Real part of G(f)')
grid minor

subplot(2,2,2);
IM=plot(range,imag(G),'LineWidth',1,'color',[1,0.5,0.5]);
xlabel('w/pi')
ylabel('Imaginary part of G(f)')
grid minor

subplot(2,2,3);
IM=plot(range,abs(G),'LineWidth',1,'color',[1,0.5,0.5]);
xlabel('w/pi')
ylabel('Magnitude spectrum of G(f)')
grid minor

subplot(2,2,4);
IM=plot(range,angle(G),'LineWidth',1,'color',[1,0.5,0.5]);
xlabel('w/pi')
ylabel('Phase specturm part of G(f)')
grid minor

%saveas(IM,'/Users/changgang/Desktop/problem_3_5.pdf')