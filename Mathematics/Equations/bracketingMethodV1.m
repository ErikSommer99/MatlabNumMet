% Script that solves the equation x - sin (x) - 1;
% by the bracketing method. Start interval
% is set to [a, b] = [1, 3].
% The implementation performs 17 halves.

a=1; b=3;
fa=a-sin(a)-1;
fb=b-sin(b)-1;

for n=1:16
  c=(b+a)/2;
  fc=c-sin(c)-1;
  if fa*fc<0
    b=c;
  else
    a=c;
  end
end

x=(b+a)/2