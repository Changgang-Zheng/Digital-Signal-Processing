N = input('Length of sequence = '); n = 0:N-1;
x = exp(-0.8*n);
y = rand(1,N)-0.5+x;
n1 = length(x)-1;
r = conv(y,fliplr(y));
k = (-n1):n1;
stem(k,r,'.');
xlabel('Lag_index'); ylabel('Amplitude');
grid on;