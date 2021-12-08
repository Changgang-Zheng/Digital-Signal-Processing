N = 0:10;
g = cos(0.2*pi*N);
h = 3.^N;
cv = conv(g,h);

stem(0:length(cv)-1,cv);
xlabel('Time');
ylabel('Amplitude');
title('Time domain response');
