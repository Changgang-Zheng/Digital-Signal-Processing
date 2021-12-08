r=0.1;theta=pi/9; % r and theta could be modified here
syms omega;
G=1/(1-2*r*cos(theta)*exp(-1i*omega)+r^2*exp(-2i*omega));
figure(1);
ezplot(real(G));title('real part');xlabel('omega');ylabel('magnitude');
figure(2);
ezplot(imag(G));title('image part');xlabel('omega');ylabel('magnitude');
figure(3);
ezplot(abs(G)); title('absolute value');xlabel('omega');ylabel('magnitude');
figure(4);
ezplot(angle(G)); title('angle');xlabel('omega');ylabel('magnitude');
