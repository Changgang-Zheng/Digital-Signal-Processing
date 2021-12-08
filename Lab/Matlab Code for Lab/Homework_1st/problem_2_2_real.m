syms n
the_function = -2.7*exp((-0.4+1j*pi/6)*n);%Generate the sequence
x = subs(the_function,n,(0:82));
figure;
stem((0:82),real(x),'.');%Plot the real part
grid on
xlabel('Time index n');ylabel('Amplitude');
title('Real part');


figure;
stem((0:82),imag(x),'.');%Plot the imaginary part
grid on
xlabel('Time index n');ylabel('Amplitude');
title('Imaginary part');

%Program_2_3

% 
% Type in real exponent = -1/12
% Type in imaginary exponent = pi/6
% Type in the gain constant = 1
% Type in length of sequence = 41
% PRESS RETURN for imaginary part
% 
% Type in real exponent = log(1.2)
% Type in imaginary exponent = 0
% Type in the gain constant = 0.2
% Type in length of sequence = 31
% PRESS RETURN for imaginary part
% 
% Type in real exponent = log(0.9)
% Type in imaginary exponent = 0
% Type in the gain constant = 20
% Type in length of sequence = 31
% PRESS RETURN for imaginary part
% 
% Type in real exponent = -0.4
% Type in imaginary exponent = pi/6
% Type in the gain constant = -2.7
% Type in length of sequence = 8
% PRESS RETURN for imaginary part