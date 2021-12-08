n=0:50;
x=sin(5*pi*n/16);
stem(n,x);
x_2=sin(5*pi*n/16).^2;
y=sum(x_2);
y1=double(y);
disp(y1);