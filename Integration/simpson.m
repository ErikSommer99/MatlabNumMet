% Script that estimates an integral by Simpson's method

% Limits
a=1; b=3;

% The function to be integrated
f = @(x) sin(sqrt(x));

% Counter
n = input('How many subintervals? ');

% The width of each column
dx = (b-a)/n;

% Initiates x and the sum S
S = dx/3*(f(a)+f(b));

% Summarizes odd number contributions
for i=1:2:(n-1)
  x = a + i*dx;  
  S = S + 4*f(x)*dx/3;
end

% Summarizes the even contributions
for i=2:2:(n-2)
  x = a + i*dx;  
  S = S + 2*f(x)*dx/3;
end

% Write the answer to the screen:
S