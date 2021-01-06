% Scripts that estimate an integral
% with a Riemann sum.

a=1; b=3;

f = @(x) sin(sqrt(x));

n = input('How many subintervals? ');

dx = (b-a)/n;

R = 0;
x = a+dx/2;

for i=1:n
  R = R + f(x)*dx;
  x = x + dx;
end

R