%Program 6_4
clc
clear
format short
L = 30;

%% Problem a
num1 = [-17.5 -2];
den1 = [5 0.5 -1];
[y, t] = impz(num1,den1,L);
disp('Question a');
disp('coefficient of the power serious expension');
disp(y')
 

%% Problem b
num1 = [15 8.4 2.64 2.88];
den1 = [5 2 1.8 0.72];
[y, t] = impz(num1,den1,L);
disp('Question b');
disp('coefficient of the power serious expension');
disp(y')
 

%% Problem c
num1 = [256 228 64 9];
den1 = [48 48 24 12 3];
[y, t] = impz(num1,den1,L);
disp('Question c');
disp('coefficient of the power serious expension');
disp(y')
 

%% Problem d
num1 = [-54 -48 -12.8 -3.2];
den1 = [18 15 5.4 0.8];
[y, t] = impz(num1,den1,L);
disp('Question d');
disp('coefficient of the power serious expension');
disp(y')
 