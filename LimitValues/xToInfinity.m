% Scripts that estimate the limit value of a function
% where the argument x goes to infinity.
% The expression we are going find the limit value of, f,
% is hardcoded at the beginning of the script.
% The script plots f (x) for ever higher x-values.

f=@(x) (x^2-8*x+15)/(2*x^2-50);

x=1;

for n=1:20
  Xvector(n)=x;                 
  LimitVector(n)=f(x);         
  x=x*2;                        
end

semilogx(Xvector,LimitVector,'bx-')
grid on                         

xlabel('x')
ylabel('f(x)')
title('x \rightarrow \infty')