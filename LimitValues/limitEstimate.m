% Scripts that estimate a limit.
% The expression we should take the boundary of, f, and the value x shall
% go to, a, is hardcoded at the beginning of the script.
% The script plots f (a + h) for h-values closer and closer
% to 0. It plots the estimate for both negative and positive
% values of h.

% The value x should go towards
a=pi/3;
% Functional expression
f=@(x) (cos(x)-0.5)/(x-pi/3);

h=1;
% Loop where h is halved for each iteration
for n=1:15
  x=a+h;                            % Updating x
  Hvector(n)=h;                     % Create vector with h-values
  LimitVectorPlus(n)=f(x);        % When x goes towards a from above
  x=a-h;                            % Updating x
  LimitVectorMinus(n)=f(x);        % When x goes towards a from below
  h=h/2;                            % Halves h
end

% Plot estimates
semilogx(Hvector,LimitVectorPlus,'bx-')
hold on
semilogx(Hvector,LimitVectorMinus,'rx-')
hold off
grid on
% Text box with explanation and text on axes
xlabel('h')
ylabel('f(a\pm h)')
legend('x \rightarrow a^+','x \rightarrow a^-')