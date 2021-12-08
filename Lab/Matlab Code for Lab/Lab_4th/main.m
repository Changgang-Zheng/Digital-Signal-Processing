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


clear;
clc;

wp1=0.65*pi;
wp2=0.75*pi;
ws1=0.6*pi;
ws2=0.8*pi;
ap=0.2;
as=42;
dw1=wp1-ws1;
dw2=ws2-wp2;
dw=min(dw1,dw2);
wc1=mean([ws1 wp1]);
wc2=mean([ws2 wp2]);

%% Hamming

N=2*ceil((3.32*pi)/dw);
b=fir1(N,[wc1/pi wc2/pi]);
[H,w]=freqz(b,1,512);

hamm_re = figure;
stem(b,'.','LineWidth',1.5,'color',[1,0.5,0.5]);
title('Impulse Response Coefficients');
grid minor;
set(hamm_re, 'PaperPosition', [0.05 0.05 7 7]);
set(hamm_re, 'PaperSize', [7.05 7.05]);
saveas(hamm_re,['p2_hamm_re.pdf'],'pdf')

hamm_de = figure;
plot(w/pi, 20*log10(abs(H)),'LineWidth',1.5,'color',[1,0.5,0.5]);
xlabel(['\pi (\omega/\omega','s)']);
ylabel('gain(dB)');
title('Bandpass filter designed using Hamming window');
grid minor;
set(hamm_de, 'PaperPosition', [0.05 0.05 7 7]);
set(hamm_de, 'PaperSize', [7.05 7.05]);
saveas(hamm_de,['p2_hamm_de.pdf'],'pdf')


clear;
clc;

wp1=0.65*pi;
wp2=0.75*pi;
ws1=0.6*pi;
ws2=0.8*pi;
ap=0.2;
as=42;
dw1=wp1-ws1;
dw2=ws2-wp2;
dw=min(dw1,dw2);
wc1=mean([ws1 wp1]);
wc2=mean([ws2 wp2]);

%% Hann
N=2*ceil((3.11*pi)/dw);
b=fir1(N,[wc1/pi wc2/pi],hanning(N+1));
[H,w]=freqz(b,1,512);

hann_re = figure;
stem(b,'.','LineWidth',1.5,'color',[1,0.5,0.5]);
title('Impulse Response Coefficients');
grid minor;
set(hann_re, 'PaperPosition', [0.05 0.05 7 7]);
set(hann_re, 'PaperSize', [7.05 7.05]);
saveas(hann_re,['p2_hann_re.pdf'],'pdf')

hann_de = figure;
plot(w/pi, 20*log10(abs(H)),'LineWidth',1.5,'color',[1,0.5,0.5]);
title('Bandpass filter designed using Hann window');
xlabel(['\pi (\omega/\omega','s)']);
ylabel('gain(dB)');
grid minor;
set(hann_de , 'PaperPosition', [0.05 0.05 7 7]);
set(hann_de , 'PaperSize', [7.05 7.05]);
saveas(hann_de ,['p2_hann_de.pdf'],'pdf')


clear;
clc;

wp1=0.65*pi;
wp2=0.75*pi;
ws1=0.6*pi;
ws2=0.8*pi;
ap=0.2;
as=42;
dw1=wp1-ws1;
dw2=ws2-wp2;
dw=min(dw1,dw2);
wc1=mean([ws1 wp1]);
wc2=mean([ws2 wp2]);


%% Kaiser
ds=10^(-as/20);
dp=10^(-ap/20);
[N,Wn,beta,type]=kaiserord([wc1/pi wc2/pi],[1 0],[dp ds]);
b=fir1(2*N,[wc1/pi wc2/pi],kaiser(2*N+1,beta));
[H,w]=freqz(b,1,512);

Kaiser_re = figure;
stem(b,'.','LineWidth',1.5,'color',[1,0.5,0.5]);
title('Impulse Response Coefficients');
grid minor;
set(Kaiser_re, 'PaperPosition', [0.05 0.05 7 7]);
set(Kaiser_re, 'PaperSize', [7.05 7.05]);
saveas(Kaiser_re,['p2_Kaiser_re.pdf'],'pdf')

Kaiser_de = figure;
plot(w/pi, 20*log10(abs(H)),'LineWidth',1.5,'color',[1,0.5,0.5]);
xlabel(['\pi (\omega/\omega','s)']);
ylabel('gain(dB)');
title('Bandpass filter designed using Kaiser window');
grid minor;
set(Kaiser_de, 'PaperPosition', [0.05 0.05 7 7]);
set(Kaiser_de, 'PaperSize', [7.05 7.05]);
saveas(Kaiser_de,['p2_Kaiser_de.pdf'],'pdf')
