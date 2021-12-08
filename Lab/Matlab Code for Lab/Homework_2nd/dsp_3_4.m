fs=100;N=1024; % sampling frequency; sampling points number
n=[0:N-1];t=n/fs; %order sequence; time sequence;
x=0.5*sin(30*pi*t)+1.5*cos(50*pi*t); % a real sequence tested.
% the test sequence could be modified here.
X=fft(x,N)/N;% fast frourier transform
X=fftshift(X); 
Y=fliplr(X); %X(e^-jw)
Y_conj=conj(Y);
f=[-N/2:N/2-1]*fs/N; % frequency sequence;
figure(1);
subplot(2,2,1);plot(f,abs(X));
subplot(2,2,2);plot(f,abs(Y_conj));
subplot(2,2,3);plot(f,angle(X));
subplot(2,2,4);plot(f,angle(Y_conj));
figure(2);
subplot(2,2,1);plot(f,real(X));
subplot(2,2,2);plot(f,real(Y));
subplot(2,2,3);plot(f,imag(X));
subplot(2,2,4);plot(f,imag(Y));
figure(3);
subplot(2,2,1);plot(f,abs(X));
subplot(2,2,2);plot(f,abs(Y));
subplot(2,2,3);plot(f,angle(X));
subplot(2,2,4);plot(f,angle(Y));
