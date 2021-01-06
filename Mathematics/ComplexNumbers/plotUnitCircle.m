% Geometric interpretation of complex numbers
% Gives n, a and b in equations z ^ 2 = a + ib
% Plot the solutions on the unit circle

n = 4;
a = -16;
b = 0;
% Converts right side to polar form
r = sqrt(a^2+b^2);
theta = angle(a+i*b);
rRot = nthroot(r,n);
% Calculates the remaining of the n solutions
for nn=0:(n-1)
    z = rRot*exp(i*(theta+nn*2*pi)/n)
    zVektor(nn+1)=z;      % Creates vector with values
end
% Plots the solutions
figure(1)
% Circle with the absolute value of the solutions
x=rRot*[-1:0.01:1];
y=sqrt(rRot^2-x.^2);
plot(x,y,'k--')
hold on
plot(x,-y,'k--')

plot(real(zVektor),imag(zVektor),'rx','linewidth',2)
hold off
axis equal   
grid on      