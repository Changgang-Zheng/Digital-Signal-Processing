num=[1.8 0.34 -1.32 -0.86];
den=[1 0.3 0.5 -0.72];
n=0:30;
x=cos(0.2*pi*n);
y=filter(num,den,x);
subplot(2,1,1)
stem(n,y);
title('输出信号');
subplot(2,1,2)
[h,T]=impz(num,den,31);
stem(T,h);
title('系统响应');
