x = [6.29 8.11 -7.46 8.26 2.64 -8.04 -4.43 0.93 -9.15 9.29];
XF = fft(x);
k =0:9;
YF = exp(-i*2*pi*k/5).*XF;
output = [XF(1) XF(6) sum(XF) sum(YF)]; 
disp(output) 
disp(sum(abs(XF).*abs(XF)))