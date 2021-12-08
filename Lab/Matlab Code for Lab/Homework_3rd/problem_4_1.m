% Program 4_1
% Signal Smoothing by a Moving-Average Filter %
R = 50;
d = rand(R,1)-0.5;
m = 0:1:R-1;
s = 2*m.*(0.9.^m);
x =s+d';
figure;
plot(m,d,'r-','LineWidth',1.5,'color',[1,0.5,0.5]) 
hold on
plot(m,s,'LineWidth',1.5) 
hold on
plot(m,x,'g:','LineWidth',2) 
xlabel('Time index n'); 
ylabel('Amplitude') 
legend('d[n]','s[n]','x[n]');
grid minor


figure;
M = input('Number of input samples = ');
b = ones(M,1)/M;
y = filter(b,1,x);
plot(m,y,'LineWidth',1.5) 
hold on
plot(m,s,'LineWidth',1.5,'color',[1,0.5,0.5]) 
hold on
legend('s[n]','y[n]');
xlabel ('Time index n');ylabel('Amplitude')
grid minor