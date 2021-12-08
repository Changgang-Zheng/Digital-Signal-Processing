%{
T = 1;
omega = [0.3 0.45 0.65 0.75]*pi;
Omega_prewarped = (2/T)*tan(omega/2);

Omega_0 = sqrt(Omega_prewarped(2)*Omega_prewarped(3));
Omega_prewarped(1) = Omega_0^2/Omega_prewarped(4);

BW = Omega_prewarped(3)-Omega_prewarped(2);

Omega_p = 1;
Omega_s = (Omega_0^2-Omega_prewarped(1)^2)/(Omega_prewarped(1)*BW);

[N,Wn] = buttord(Omega_p,Omega_s,1,40,'s');
[B,A] = butter(N,Wn,'s');

LPFpoles = roots(A);
BPFpoles = zeros(1,2*N);
index = 1;
for i=1:N
    tmp = roots([1 -LPFpoles(i)*BW/Omega_p +Omega_0^2]);
    BPFpoles(index) = tmp(1);
    BPFpoles(index+1) = tmp(2);
    index = index+2;
end
A_BPF = poly(BPFpoles);
B_BPF = [B(end)*BW^N zeros(1,N)];

[num,den] = bilinear(B_BPF,A_BPF,T);

[h,w] = freqz(num, den, 100);
w=w/pi;
H=20*log10(abs(h));
mag = figure;
plot(w,abs(h),'LineWidth',1.5,'color',[1,0.5,0.5])
xlabel(['\pi (\omega/\omega','s)']);
ylabel('magnitude');
grid minor;
set(mag, 'PaperPosition', [0.05 0.05 7 7]);
set(mag, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(mag,['p1_mag.pdf'],'pdf')
    
pha = figure;
plot(w,angle(h),'LineWidth',1.5,'color',[1,0.5,0.5])
xlabel(['\pi (\omega/\omega','s)']);
ylabel('angle');
grid minor;
set(pha, 'PaperPosition', [0.05 0.05 7 7]);
set(pha, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(pha,['p1_pha.pdf'],'pdf')

gain = figure;
plot(w,H,'LineWidth',1.5,'color',[1,0.5,0.5])
xlabel(['\pi (\omega/\omega','s)']);
ylabel('angle');
grid minor;
set(gain, 'PaperPosition', [0.05 0.05 7 7]);
set(gain, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(gain,['p1_gain.pdf'],'pdf')
%}

clear;
clc;

Wp = [0.45 0.65];
Ws = [0.3 0.75];
Rp = 1;
Rs = 40;
 
[N,Wn] = buttord(Wp, Ws, Rp, Rs);
[b,a] = butter(N,Wn);
[h,omega] = freqz(b,a,256);
gain = 20*log10(abs(h));

p1 = figure;
subplot 211
plot(omega/pi,gain,'LineWidth',1.5,'color',[1,0.5,0.5]);
title('gain');
grid minor;

subplot 212
plot(omega/pi,imag(h),'LineWidth',1.5,'color',[1,0.5,0.5]);
title('phase');
grid minor;
set(p1, 'PaperPosition', [0.05 0.05 7 7]);
set(p1, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p1,['p1.pdf'],'pdf')

