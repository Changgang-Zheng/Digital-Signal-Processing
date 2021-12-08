b=[1.35 4.95 8.55 4.95 1.8];
a=[0.9 -1.8 1.65 -0.75 0.15];
[X,w]=freqz(b,a);

subplot(2,2,1);
plot(w/pi,real(X));
xlabel('\omega/\pi');
ylabel('real{X(e^(jw))}');
title('real part of the DTFT');

subplot(2,2,2);
plot(w/pi,imag(X));
xlabel('\omega/\pi');
ylabel('imag{X(e^(jw))}');
title('imaginary part of the DTFT');

subplot(2,2,3);
plot(w/pi,abs(X));
xlabel('\omega/\pi');
ylabel('|X(e^(jw))|');
title('magnitude response');

subplot(2,2,4);
plot(w/pi,angle(X));
xlabel('\omega/\pi');
ylabel('phase(X(e^(jw)))');
title('phase response');

figure;
plot(w/pi,unwrap(angle(X)));
xlabel('\omega/\pi');
ylabel('unwraped phase(X(e^(jw)))');
title('phase response with the jump removed');