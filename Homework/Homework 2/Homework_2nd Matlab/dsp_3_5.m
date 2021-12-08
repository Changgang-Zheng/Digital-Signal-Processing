fs=100;N=1024; % sampling frequency; sampling points number
n=[0:N-1];t=n/fs; %order sequence; time sequence;
x=0.5*exp(i*2*pi*t); % a complex sequence tested.
X=fft(x,N)*2/N;% fast frourier transform
X=fftshift(X); 
f=[-N/2:N/2-1]*fs/N; % frequency sequence;

% question 1
x_inverse=fliplr(x); % x[-n]
X_inverse=fftshift(fft(x_inverse,N))*2/N;
figure(1);
subplot(2,2,1);plot(f,real(X_inverse));
subplot(2,2,2);plot(f,real(fliplr(X)))
subplot(2,2,3);plot(f,imag(X_inverse));
subplot(2,2,4);plot(f,imag(fliplr(X)));

% question 2
x_inverse_conj=conj(x_inverse); % x*[-n]
X_inverse_conj=fftshift(fft(x_inverse_conj,N))*2/N;
figure(2);
subplot(2,2,1);plot(f,real(X_inverse_conj));
subplot(2,2,2);plot(f,real(conj(X)));
subplot(2,2,3);plot(f,imag(X_inverse_conj));
subplot(2,2,4);plot(f,imag(conj(X)));

% question 3
x_real=real(x); %x_real[n]
X_real=fftshift(fft(x_real,N))*2/N;
X_cs=0.5*(X+conj(fliplr(X)));
figure(3);
subplot(2,2,1);plot(f,abs(X_real));
subplot(2,2,2);plot(f,abs(X_cs))
subplot(2,2,3);plot(f,angle(X_real));
subplot(2,2,4);plot(f,angle(X_cs));

% question 4
x_imag=i*imag(x); %i*x_image[n]
X_imag=fftshift(fft(x_imag,N))*2/N;
X_ca=0.5*(X-conj(fliplr(X)));
figure(4);
subplot(2,2,1);plot(f,abs(X_imag));
subplot(2,2,2);plot(f,abs(X_ca))
subplot(2,2,3);plot(f,unwrap(angle(X_imag)));
subplot(2,2,4);plot(f,unwrap(angle(X_ca)));

%question 5 
x_cs=0.5*(x+conj(fliplr(x))); %x_cs[n]
X_cs=fftshift(fft(x_cs,N))*2/N;
figure(5);
subplot(1,2,1);plot(f,real(X_cs));
subplot(1,2,2);plot(f,real(X));

%question 6 
x_ca=0.5*(x-conj(fliplr(x))); %x_ca[n]
X_ca=fftshift(fft(x_ca,N))*2/N;
figure(6);
subplot(1,2,1);plot(f,imag(X_ca));
subplot(1,2,2);plot(f,imag(X));


