% Scripts plotting Taylor polynomial, up to
% a specific order, for the function
% f (x) = its x around x = 0.
% The maximum order of the function is input

Nmax=19;

funk=@(x) sin(x);

x=-3*pi:1e-2:3*pi;

P=0*x;
an=1;

figure(1)
plot(x,funk(x),'k-','linewidth',2)
axis([min(x) max(x) -1.2 1.2])
grid on
pause
for n=1:2:Nmax
  an=(-1)^round((n-1)/2)/factorial(n);
  P=P+an*x.^n;
  plot(x,funk(x),'k-','linewidth',2)
  grid on
  hold on
  plot(x,P,'r--','linewidth',2)
  hold off
  axis([min(x) max(x) -1.2 1.2])
  title(['n=',num2str(n)])
  pause
end
hold off