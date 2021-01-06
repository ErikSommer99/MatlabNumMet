% Script that solves an equation by Newton's method. 
% Input is the start value x0, the function to be zero
% and the derivative of the function.

% Initial value
x0=1;
% Function that should be zero:
f=@(x) cos(x)-x;
% The derivative of the function
fd=@(x) -sin(x)-1;

% Initiates x
x=x0;

% Iterate (5 times)
for n=1:5
  x=x-f(x)/fd(x);      
  disp([n x])        
  pause           
end