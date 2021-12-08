N = 8; % sequence length 
gamma = 0.5;
k = 0:N-1;
x = exp(-gamma*k);
X = fft(x);
range = k;
%% Property 1
X1 = fft(conj(x));
G1 = conj([X(1) X(N:-1:2)]); 

% Verify X1 = G1

p1_1=figure;
stem(range,real(X1),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(X1),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
grid minor
legend('real','imag')
set(p1_1, 'PaperPosition', [0.05 0.05 7 7]);
set(p1_1, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p1_1,['p1_1.pdf'],'pdf')

p1_2=figure;
stem(range,real(G1),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(G1),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p1_2, 'PaperPosition', [0.05 0.05 7 7]);
set(p1_2, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p1_2,['p1_2.pdf'],'pdf')
%% Property 2
x2 = conj([x(1) x(N:-1:2)]); 
X2 = fft(x2);
% Verify X2 = conj(X)
p2_1=figure;
stem(range,real(X2),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(X2),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p2_1, 'PaperPosition', [0.05 0.05 7 7]);
set(p2_1, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p2_1,['p2_1.pdf'],'pdf')

p2_2=figure;
stem(range,real(conj(X)),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(conj(X)),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p2_2, 'PaperPosition', [0.05 0.05 7 7]);
set(p2_2, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p2_2,['p2_2.pdf'],'pdf')
%% Property 3
x3 = real(x);
X3 = fft(x3);
G3 = 0.5*(X+conj([X(1) X(N:-1:2)])); 

% Verify X3 = G3
p3_1=figure;
stem(range,real(X3),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(X3),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p3_1, 'PaperPosition', [0.05 0.05 7 7]);
set(p3_1, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p3_1,['p3_1.pdf'],'pdf')

p3_2=figure;
stem(range,real(G3),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(G3),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p3_2, 'PaperPosition', [0.05 0.05 7 7]);
set(p3_2, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p3_2,['p3_2.pdf'],'pdf')
%% Property 4
x4 = j*imag(x);
X4 = fft(x4);
G4 = 0.5*(X-conj([X(1) X(N:-1:2)])); 
% Verify X4 = G4
p4_1=figure;
stem(range,real(X4),'.','LineWidth',2,'color',[1,0.5,0.5]);
hold on;
stem(range,imag(X4),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p4_1, 'PaperPosition', [0.05 0.05 7 7]);
set(p4_1, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p4_1,['p4_1.pdf'],'pdf')

p4_2=figure;
stem(range,real(G4),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(G4),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p4_2, 'PaperPosition', [0.05 0.05 7 7]);
set(p4_2, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p4_2,['p4_2.pdf'],'pdf')
%% Property 5
x5 = 0.5*(x+conj([x(1) x(N:-1:2)])); 
X5 = fft(x5);
% Verify X5 = real(X)
p5_1=figure;
stem(range,real(X5),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(X5),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p5_1, 'PaperPosition', [0.05 0.05 7 7]);
set(p5_1, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p5_1,['p5_1.pdf'],'pdf')

p5_2=figure;
stem(range,real(real(X)),'.','LineWidth',2,'color',[1,0.5,0.5]);
hold on;
stem(range,imag(real(X)),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p5_2, 'PaperPosition', [0.05 0.05 7 7]);
set(p5_2, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p5_2,['p5_2.pdf'],'pdf')
%% Property 6
x6 = 0.5*(x-conj([x(1) x(N:-1:2)])); 
X6 = fft(x6);
% Verify X6 = j*imag(X)
p6_1=figure;
stem(range,real(X6),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(X6),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p6_1, 'PaperPosition', [0.05 0.05 7 7]);
set(p6_1, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p6_1,['p6_1.pdf'],'pdf')
p6_2=figure;
stem(range,real(1j*imag(X)),'.','LineWidth',2,'color',[1,0.5,0.5]); 
hold on;
stem(range,imag(1j*imag(X)),'.','LineWidth',1.5,'color',[0.5,0.5,1]); 
legend('real','imag')
grid minor
set(p6_2, 'PaperPosition', [0.05 0.05 7 7]);
set(p6_2, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p6_2,['p6_2.pdf'],'pdf')


