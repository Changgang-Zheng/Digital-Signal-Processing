%% p_a
num = [3 -2.4 15.36 3.84 9];
den = [5 -8.5 17.6 4.7 -6];
% num = input('Type in the numerator coefficients = '); 
% den = input('Type in the denominator coefficients = '); 
K = num(1)/den(1);
Numfactors = factorize(num);
Denfactors = factorize(den);
p1 = figure;
disp('Numerator factors');
disp(Numfactors); 
disp('Denominator factors');
disp(Denfactors); 
disp('Gain constant');
disp(K);
zplane(num,den)
grid on;
set(p1, 'PaperPosition', [0.05 0.05 7 7]);
set(p1, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p1,['6_1a.pdf'],'pdf')

%% p_b

num = [2 0.2 6.4 4.6 2.4];
den = [5 1 6.6 0.42 24];
% num = input('Type in the numerator coefficients = '); 
% den = input('Type in the denominator coefficients = '); 
K = num(1)/den(1);
Numfactors = factorize(num);
Denfactors = factorize(den);
p1b = figure;
disp('Numerator factors');
disp(Numfactors); 
disp('Denominator factors');
disp(Denfactors); 
disp('Gain constant');
disp(K);
zplane(num,den)
grid on;
set(p1b, 'PaperPosition', [0.05 0.05 7 7]);
set(p1b, 'PaperSize', [7.05 7.05]); %Keep the same paper size
saveas(p1b,['6_1b.pdf'],'pdf')