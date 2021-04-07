clear; clc;

% spring constant
k = 0.5;
% mass of block
m = 2.0;

% initial position
x_0 = 0.0;
% initial velocity
v_0 = 1.5; % v_0 = 0.0;

% array of initial conditions
InitCond = [x_0 v_0];

% time interval
t_int = [0 50];

%options = odeset('RelTol',1e-3,'AbsTol',1e-7);

% Runge-Kutta solver of order 4/5. @ is a pointer to a function.
% @(t,f_array) Harmonicfun(t,f_array,k,m) points to the function
% Harmonicfun and explicitly specifies t and f_array as the first two
% input arguments (corresponding to the last two arguments t_int and
% InitCond of ode45). k and m are treated as constant parameters. T and F
% are the time points and corresponding solution array produced,
% respectively.
[T,F] = ode45(@(t,f_array)Harmfun(t,f_array,k,m),...
    t_int,InitCond);

% Energy of block-spring system
E_p = 0.5*k*F(:,1).^2; % Potential energy
E_k = 0.5*m*F(:,2).^2; % Kinetic energy
E = E_p + E_k; % Total energy



hFig = figure(1);
 set(gcf,'PaperPositionMode','auto')
 set(hFig, 'Position', [900 200 900 700])

subplot(2,2,1), plot(T,F(:,1),'-k','LineWidth',2.5),
xlabel('$t$ (s)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$x$ (m)','FontSize',18,'Interpreter','latex')

subplot(2,2,2), plot(T,F(:,2),'-k','LineWidth',2.5),
xlabel('$t$ (s)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$v$ (m/s)','FontSize',18,'Interpreter','latex')

subplot(2,2,3), plot(T,E_p,'-b','LineWidth',2),
xlabel('$t$ (s)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('Energy (J)','FontSize',18,'Interpreter','latex')
hold on

subplot(2,2,3), plot(T,E_k,'-r','LineWidth',2),
hold on
subplot(2,2,3), plot(T,E,'-k','LineWidth',2),

lh = legend('$E_p$','$E_k$','$E$');
set(lh,'Interpreter','latex');

