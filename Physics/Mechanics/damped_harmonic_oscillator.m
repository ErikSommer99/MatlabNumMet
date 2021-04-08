% Script that solves motion equation with damping

clear; clc;
% spring constant
k = 350;
% mass of block
m = 2.0;
% damping constant (km/s)
b = 110; % b = 2.8;
% initial position
x_0 = 0.070;
% initial velocity
v_0 = 0.0; % v_0 = 0.0;
% array of initial conditions
InitCond = [x_0 v_0];
% time interval
t_int = [0 2];

% Runge-Kutta solver
[T,F] = ode45(@(t,f_array)Harmfun_damped(t,f_array,k,m,b),...
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

lh = legend('Num.','An.');
set(lh,'Interpreter','latex');

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