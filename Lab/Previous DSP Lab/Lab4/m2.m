%{
Omegap=4;
Omegas=6;
Omegat=18;
wp=2*pi*Omegap/Omegat;
ws=2*pi*Omegas/Omegat;
alphap=0.2;
alphas=42;
NUM_Hamming=1;
NUM_Hann=2;
NUM_Blackman=3;
c=[3.32,3.11,5.56]*pi;
wc=(ws+wp)/2;
delt_w=ws-wp;
% freq_labels={'用海明窗设计的FIR频率响应','用汉宁窗设计的FIR频率响应','用布莱克曼窗设计的FIR频率响应'};
% ht_labels={'海明窗FIR冲激响应','汉宁窗FIR冲激响应','布莱克曼窗FIR响应'};
freq_labels={'FIR frequency resbonse for Hamming design','FIR frequency resbonse for Hann design','FIR frequency resbonse for Kaiser design'};
ht_labels={'FIR frequency resbonse for Hamming window','FIR frequency resbonse for Hann window','FIR frequency resbonse for Kaiser window'};
for filter_kind=NUM_Hamming:NUM_Blackman
    M=ceil(c(filter_kind)/delt_w);
    N=2*M+1;
    switch filter_kind
        case NUM_Hamming
            win=hamming(N);
            %disp(['海明窗生成的冲激响应系数：','  (阶数N=',num2str(N),')']);
            disp(['Impulse response coefficients for Hamming window:','  (order N=',num2str(N),')']);
            NUM = figure;
        case NUM_Hann
            win=hann(N);          
            %disp(['汉宁窗生成的冲激响应系数：','  (阶数N=',num2str(N),')']);
            disp(['Impulse response coefficients for Hann window:','  (order N=',num2str(N),')']);
            NUM = figure;
        case NUM_Blackman
            win=blackman(N);           
            %disp(['布莱克曼窗生成的冲激响应系数：','(阶数N=',num2str(N),')']);
            disp(['Impulse response coefficients for Kaiser window:','  (order N=',num2str(N),')']);
            NUM = figure;
        otherwise
            disp('error');
    end
    n=-M:M;
    hd=sin(wc*n)./(pi*n);
    hd(n==0)=wc*cos(wc*0)/pi;
    ht=hd.*win';
    display(['',num2str(ht)]);
    subplot(1,2,1);
    plot(n,ht,'.-','LineWidth',1.5,'color',[1,0.5,0.5]);
    title(ht_labels(filter_kind));
    xlabel('n','FontSize',12);
    ylabel('ht','fontsize',12);
    grid minor
    [h,w]=freqz(ht,1,512);
    W=w/pi;
    H=20*log10(abs(h));
    subplot(1,2,2);
    hold on
    title(freq_labels(filter_kind));
    plot(W,H,'LineWidth',1.5,'color',[1, 0.5,0.5]);
    xlabel(['\pi (\omega/\omega','s)']);
    % ylabel('增益(dB)');
    ylabel('gain(dB)');
    grid minor  
    dotp=round(mean(find(w>wp-0.1&w<wp+0.1)));
    dots=round(mean(find(w>ws-0.1&w<ws+0.1)));
    plot(W(dotp),H(dotp),'.r','MarkerSize',15);
    plot(W(dots),H(dots),'.r','MarkerSize',15);
    text(W(dotp),H(dotp),['[','',num2str(round(W(dotp)*1000)/1000),',',num2str(round(H(dotp)*1000)/1000),'dB]'],'FontSize',10);
    text(W(dots),H(dots),['[','',num2str(round(W(dots)*100)/100),',',num2str(round(H(dots)*100)/100),'dB]'],'fontsize',10);
    hold off
    set(NUM, 'PaperPosition', [0.05 0.05 7 7]);
    set(NUM, 'PaperSize', [7.05 7.05]); %Keep the same paper size
    saveas(NUM,['problem2_',num2str(filter_kind),'.pdf'],'pdf')
end
%}

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

