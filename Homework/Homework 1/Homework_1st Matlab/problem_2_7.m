t = 0:0.001:0.85;
g1 = cos(6*pi*t); g2 = cos(14*pi*t); g3 = cos(26*pi*t);
figure;
plot(t/0.85,g1,'-', t/0.85, g2, '--', t/0.85, g3,':'); 
xlabel('time'); 
ylabel('Amplitude'); 
hold
n = 0:1:8; 
gs = cos(0.6*pi*n); 
plot(n/8.5,gs,'o'); 
grid on;
hold off