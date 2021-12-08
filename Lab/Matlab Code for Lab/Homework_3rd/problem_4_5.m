h = [-4.8788 9.5631 -4.8788];
[H,w] = freqz(h,1,512);
plot(w/pi,abs(H),'LineWidth',1,'color',[1,0.5,0.5]); 
grid minor
xlabel('\omega/\pi'); 
ylabel('Magnitude');
