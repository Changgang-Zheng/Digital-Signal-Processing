clear
clc
for N=[4 6 8 10]    
    %% Program M5.1 (a) 
    % N = input('The value of N = '); 
    k = -N:N;
    y = ones(1,2*N+1);
    w = 0:2*pi/255:2*pi;
    Y = freqz(y, 1, w);
    Ydft = fft(y);
    n = 0:1:2*N; 
    sequence_a = figure;
    plot(w/pi,abs(Y),'LineWidth',1.5)
    hold on
    plot(n*2/(2*N+1),abs(Ydft),'o','LineWidth',1.5); 
    xlabel('\omega/\pi');
    ylabel(['Amplitude N=',num2str(N)]);
    grid minor
    set(sequence_a, 'PaperPosition', [0.05 0.05 7 7]);
    set(sequence_a, 'PaperSize', [7.05 7.05]); %Keep the same paper size
    saveas(sequence_a,['sequence_a',num2str(N),'.pdf'],'pdf')
    %% Program M5.1 (b) 
    % N = input('The value of N = '); 
    k = 0:N;
    y = ones(1,N+1);
    w = 0:2*pi/255:2*pi;
    Y = freqz(y, 1, w);
    Ydft = fft(y);
    sequence_b = figure;
    n = 0:N; 
    plot(w/pi,abs(Y),n*2/(N+1),abs(Ydft),'o','LineWidth',1.5); 
    xlabel('\omega/\pi');
    ylabel(['Amplitude N=',num2str(N)]);
    grid minor
    set(sequence_b, 'PaperPosition', [0.05 0.05 7 7]);
    set(sequence_b, 'PaperSize', [7.05 7.05]); %Keep the same paper size
    saveas(sequence_b,['sequence_b',num2str(N),'.pdf'],'pdf')
    %% Program M5.1 (c) 
    % N = input('The value of N = '); 
    k = -N:N;
    y = ones(1,2*N+1);
    y = y - abs(k)/N;
    w = 0:2*pi/255:2*pi;
    Y = freqz(y, 1, w);
    Ydft = fft(y);
    sequence_c = figure;
    n = 0:1:2*N; 
    plot(w/pi,abs(Y),n*2/(2*N+1),abs(Ydft),'o','LineWidth',1.5); 
    xlabel('\omega/\pi');
    ylabel(['Amplitude N=',num2str(N)]);
    grid minor
    set(sequence_c, 'PaperPosition', [0.05 0.05 7 7]);
    set(sequence_c, 'PaperSize', [7.05 7.05]); %Keep the same paper size
    saveas(sequence_c,['sequence_c',num2str(N),'.pdf'],'pdf')
    %% Program M5.1 (d) 
    % N = input('The value of N = '); 
    k = -N:N;
    y = N + ones(1,2*N+1) - abs(k); 
    w = 0:2*pi/255:2*pi;
    Y = freqz(y, 1, w);
    Ydft = fft(y);
    sequence_d = figure;
    n = 0:1:2*N; 
    plot(w/pi,abs(Y),n*2/(2*N+1),abs(Ydft),'o','LineWidth',1.5); 
    xlabel('\omega/\pi');
    ylabel(['Amplitude N=',num2str(N)]);
    grid minor
    set(sequence_d, 'PaperPosition', [0.05 0.05 7 7]);
    set(sequence_d, 'PaperSize', [7.05 7.05]); %Keep the same paper size
    saveas(sequence_d,['sequence_d',num2str(N),'.pdf'],'pdf')
    %% Program M5.1 (e) 
    % N = input('The value of N = '); 
    k = -N:N;
    y = cos(pi*k/(2*N)); 
    w = 0:2*pi/255:2*pi; 
    Y = freqz(y, 1, w); 
    Ydft = fft(y);
    n = 0:1:2*N; 
    sequence_e = figure;
    plot(w/pi,abs(Y),n*2/(2*N+1),abs(Ydft),'o','LineWidth',1.5); 
    xlabel('\omega/\pi');
    ylabel(['Amplitude N=',num2str(N)]);
    grid minor
    set(sequence_e, 'PaperPosition', [0.05 0.05 7 7]);
    set(sequence_e, 'PaperSize', [7.05 7.05]); %Keep the same paper size
    saveas(sequence_e,['sequence_e',num2str(N),'.pdf'],'pdf')
end