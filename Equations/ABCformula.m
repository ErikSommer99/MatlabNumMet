% Script that solves a quadratic equation.
% The script reads the coefficients a, b and c
% in the equation a x ^ 2 + b x + c = 0 from screen,
% calculates the solutions and writes them to the screen.
% Any complex solutions will not be
% written to screen.

a=input('input a: ');
b=input('input b: ');
c=input('input c: ');

if b^2-4*a*c<0    
  disp('No real solutions')
elseif b^2-4*a*c==0    
  x=-b/(2*a)
else                   
  x1=(-b-sqrt(b^2-4*a*c))/(2*a)
  x2=(-b+sqrt(b^2-4*a*c))/(2*a)
end