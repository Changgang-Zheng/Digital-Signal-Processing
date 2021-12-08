%% Problem 1
% L=input('input the L=');
L=50;
r=[10/4 -8/2];
p=[-1/4 -1/2];
k=-2;
[B,A]=residuez(r,p,k);
[h t]=impz(B,A,L);
p1 = figure;
stem(t,h,'.','LineWidth',1.5,'color',[1,0.5,0.5]);
grid minor
set(p1, 'PaperPosition', [0.05 0.05 9 7]);
set(p1, 'PaperSize', [9.05 7.05]);
saveas(p1,['p1.pdf'],'pdf')

%% Problem 2

n=0:50;
x=sin(5*pi*n/16);
p2 = figure;
stem(n,x,'.','LineWidth',1.5,'color',[1,0.5,0.5]);                          
grid minor
set(p2, 'PaperPosition', [0.05 0.05 9 7]);
set(p2, 'PaperSize', [9.05 7.05]);
saveas(p2,['p2.pdf'],'pdf')

syms n;                              %x1=x’
x1=sin(5*pi*n/16).^2;                %y=x*x1
y1=zeros(1,50);
n1=1:50;
for i=1:50
    y=symsum(x1,n,0,i);
    y1(i)=double(y);
end
p22 = figure;
stem(n1,y1,'.','LineWidth',1.5,'color',[1,0.5,0.5]); 
xlabel('n');
ylabel('Energy');
grid minor
set(p22, 'PaperPosition', [0.05 0.05 9 7]);
set(p22, 'PaperSize', [9.05 7.05]);
saveas(p22,['p22.pdf'],'pdf')

%% Problem 3

x1=[7 4 -9 0 2 -5];
x2=[1 -1 2 0 10 5];
L=length(x1);
y=zeros(1,L);
x2tr = [x2(1) x2(L:-1:2)];
for k = 1:L
    sh = circshift(x2tr', k-1)';
    h = x1.*sh;
    y(k) = sum(h);
end
disp(y);
n=0:length(x1)-1;
p3 = figure;
stem(n,y,'.','LineWidth',1.5,'color',[1,0.5,0.5]);
grid minor
set(p3, 'PaperPosition', [0.05 0.05 9 7]);
set(p3, 'PaperSize', [9.05 7.05]);
saveas(p3,['p3.pdf'],'pdf')

%% Problem 4

num=[1.8 0.34 -1.32 -0.86];
den=[1 0.3 0.5 -0.72];
n=0:30;
x=cos(0.2*pi*n);
y=filter(num,den,x);
p4 = figure;
subplot(2,1,1)
stem(n,y,'.','LineWidth',1.5,'color',[1,0.5,0.5]);
title('Output Signal');
grid minor
subplot(2,1,2)
[h,T]=impz(num,den,31);
stem(T,h,'.','LineWidth',1.5,'color',[1,0.5,0.5]);
title('System response');
grid minor
set(p4, 'PaperPosition', [0.05 0.05 9 7]);
set(p4, 'PaperSize', [9.05 7.05]);
saveas(p4,['p4.pdf'],'pdf')