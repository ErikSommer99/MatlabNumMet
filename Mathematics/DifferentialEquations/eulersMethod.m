% Scripts that estimate the solution to a starting value problem
% of first order using Euler's midpoint method.
% Input is F (x, y), where y '= F (x, y), the initial requirement y (x_0) = y_0,
% xF, the last x value and the N number of points.
% All parameters are hardcoded except N, which is read
% in from the command window.

% Differential equation
F=@(x,y) y*(1-y)-0.2*y;

% Starting requirements
x0=0; 
y0=1;

xF=1;

N=input('Give the number in steps: ');
h=(xF-x0)/N;                   


x=x0; y=y0;
xVector=x0:h:xF;
yVector(1)=y;

for n=1:N
  xHatt=x+h/2;
  yHatt=y+F(x,y)*h/2;
  y=y+F(xHatt,yHatt)*h;             
  x=x+h;                            
  yVector(n+1)=y;
end

plot(xVector, yVector)