%Program 6_3
% Partial-Fraction Expansion of Rational z-Transform
%
num1 = [7];
den1 = [1 0.3 -0.1];
[r1,p1,k1] = residuez(num1,den1);
disp('Residues');
disp(r1')
disp('Poles');
disp(p1')
disp('Constants');
disp(k1)
 
num2 = [0 3 1.8 1.28];
den2 = [1 0.3 -0.24 -0.08];
[r2,p2,k2] = residuez(num2,den2);
disp('Residues');
disp(r2')
disp('Poles');
disp(p2')
disp('Constants');
disp(k2)
