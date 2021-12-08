clear
clc
format long
alpha = input('Alpha = ');
y0 = alpha; 
y = zeros(1,61);
L = length(y) - 1;
y(1) = alpha - y0*y0 + y0; 
n = 2;
while (abs(y(n-1) - y0) > 0.001 || n<=100)&&n<=100
    y2 = alpha - y(n-1)*y(n-1) + y(n-1);
    y0 = y(n-1); 
    y(n) = y2; 
    n = n+1;
end
disp('Square root of alpha is');
disp(y(n-1)); 
m = 0:n-2;
err = y(1:n-1) - sqrt(alpha);

figure
fig1 = plot(m,y(1:n-1),'.','LineWidth',1,'color',[1,0.5,0.5]);
axis([0 n-2 -1.5 1.5]);
xlabel('Time index n'); 
ylabel('y'); 
title(['result of y when \alpha = ',num2str(alpha)]);
grid minor
saveas(fig1,['y_for_a_is_',num2str(alpha),'.pdf'],'pdf')

figure
fig2=stem(m,err,'.','LineWidth',1,'color',[1,0.5,0.5]);
axis([0 n-2 -1 1]);
xlabel('Time index n'); 
ylabel('Error'); 
title(['\alpha = ',num2str(alpha)]);
grid minor
saveas(fig2,['error_for_a_is_',num2str(alpha),'.pdf'],'pdf')


% % H3_Q2
% %y[n] = x[n] - (y[n-1])^2+y[n-1] %y[-1] = 1, x[n]=αu[n]
% y = [];
% error = [];
% y(1) = 1;
% alpha = 1.2;
% for i = 1:100
%     y(i+1) = alpha*1-(y(i))^2+y(i);
% end
% stable = sqrt(alpha);
% for j = 1:101
%     error(j) = stable-y(j);
% end
% n = -1:1:99;
% stem(n,error);
% axis([0,100,-0.05,0.05]);
% xlabel('Time index n');
% ylabel('Error');
% title(['Error function \alpha=',num2str(alpha)]);