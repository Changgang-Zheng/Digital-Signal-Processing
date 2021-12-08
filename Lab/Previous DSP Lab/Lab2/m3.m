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
stem(n,y);
