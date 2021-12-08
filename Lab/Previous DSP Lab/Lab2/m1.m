L=input('input the L=');
r=[10/4 -8/2];
p=[-1/4 -1/2];
k=-2;
[B,A]=residuez(r,p,k);
[h,t]=impz(B,A,L);
stem(t,h);