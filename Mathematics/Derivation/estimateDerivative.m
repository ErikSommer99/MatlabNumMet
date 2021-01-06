% Scripts that estimate the derivative of
% a function based on
% definition of the derivative. Input
% is the argument a and the function expression f.

a=0;
f=@(x) sqrt(x)/(1+x^2);

h=1;
for n=1:10
  fd=(f(a+h)-f(a))/h;       
  disp([h fd])              
  h=h/2;                    
  pause
end