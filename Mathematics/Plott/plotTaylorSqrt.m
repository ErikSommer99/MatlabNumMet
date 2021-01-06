% Script plotting the function f (x) = sqrt (x)
% together with Taylor polynomial of degree
% n = 3 around x = 1;

x=0:1e-2:4;

figure(1)
plot(x,sqrt(x),'k-','linewidth',2)  
grid on
hold on
yline(1);                              
plot(x,1+1/2*(x-1),'r-')                
plot(x,1+1/2*(x-1)-1/8*(x-1).^2,'b-')   
plot(x,1+1/2*(x-1)-1/8*(x-1).^2+1/16*(x-1).^3,'m-')
hold off
legend('f(x)','p_0','p_1(x)','p_2(x)','p_3(x)')