% This code solves numerically the harmonic oscillator equation for an
% electric circuit containing a capacitor, solenoid, and resistance under
% the influence of an applied emf. The time evolution of charge on the
% capacitor and the current in the circuit is computed.

clear
clc

format long;

% Capacitance
C = 4.50*10^(-12); 
% Self-inductance
L = 1.00*10^(-6); 

omega_0 = 1.0/sqrt(L*C);

% Resistance
R = 100.00; % Compare without and with resistance 

alpha = R/(2.0*L);

% Maximum value of applied emf (voltage)
epsilon_m = [0.0 5.00*10^(-1)]; 
% Angular frequency of applied emf
omega_drive = 0.3*(2.0*pi*alpha); % Set Tc close to Td

% Angular frequency of damped oscillation without applied emf
omega_h = sqrt(omega_0^2-alpha^2); 
% Period of damped oscillation without applied emf
T_h = (2.0*pi)/omega_h;

% Characteristic time of driven oscillation
Tc = (2.0*pi)/omega_drive
% Characteristic time of damping
Td = 1.0/alpha


% Initial charge
Q_0 = 1.00*10^(-12);
% Initial current
I_0 = 0.0;

% Array of initial conditions
InitCond = [Q_0 I_0];

% Time interval
t_int = [0 5.0*Tc]; %t_int = [0 3*Td];

% Set AbsTol small because Q is numerically small
options = odeset('RelTol',1e-4,'AbsTol',1e-18);

% Runge-Kutta solver of order 4/5. @ is a pointer to a function.
% @(t,f_array) Harmonicfun(t,f_array,C,L) points to the function
% Harmonicfun and explicitly specifies t and f_array as the first two
% input arguments (corresponding to the last two arguments t_int and
% InitCond of ode45). C and L are treated as constant parameters. T and F
% are the time points and corresponding solution array produced,
% respectively.

% Without emf
[T1,F1] = ode45(@(t,f_array)Harmonicfuncirc(t,f_array,C,L,R,epsilon_m(1),omega_drive),...
    t_int,InitCond,options);

% With emf
[T2,F2] = ode45(@(t,f_array)Harmonicfuncirc(t,f_array,C,L,R,epsilon_m(2),omega_drive),...
    t_int,InitCond,options);



% Plot charge on capacitor

figure(3),
set(gcf,'units','normalized','position',[0.03 0.1 0.8 0.7])

plot(T1,F1(:,1),'-b','LineWidth',2.0), % Without emf
xlabel('$t$ (s)','FontSize',14,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$Q$ (C)','FontSize',14,'Interpreter','latex')

hold on

figure(3),

plot(T2,F2(:,1),'--r','LineWidth',2.0) % With emf

hold on


% Plot current in circuit
figure(4),
set(gcf,'units','normalized','position',[0.1 0.15 0.8 0.7])

plot(T1,F1(:,2),'-b','LineWidth',2.0), % Without emf
xlabel('$t$ (s)','FontSize',14,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$I$ (A)','FontSize',14,'Interpreter','latex')

hold on

figure(4),

plot(T2,F2(:,2),'--r','LineWidth',2.0) % With emf

hold on


% ----------------Analytical solution (for alpha<omega_0)-----------------

% Constants entering the expression for analytical solution

phi = atan((omega_drive^2-omega_0^2)/(2*alpha*omega_drive));

Q_m = epsilon_m(2)/(L*sqrt(4*alpha^2*omega_drive^2+(omega_drive^2-omega_0^2)^2));

% Resonance frequency for charge
omega_RQ = sqrt(omega_0^2-2*alpha^2);
% Resonance frequency for current
omega_RC = omega_0;

omega_h = sqrt(omega_0^2-alpha^2); 

% Initial conditions

phi_h = atan((alpha-(I_0+Q_m*omega_drive*sin(phi))/(Q_0-Q_m*cos(phi)))/omega_h);

Q_mh = sign(Q_0-Q_m*cos(phi))*sqrt((Q_0-Q_m*cos(phi))^2+(1/omega_h)^2*(alpha*(Q_0-Q_m*cos(phi))...
    -(I_0+Q_m*omega_drive*sin(phi)))^2);

% Solution for charge

step = 0.01*min([Tc,T_h]); % Step size in time

tvec = [t_int(1):step:t_int(2)];

Q = Q_mh*exp(-alpha*tvec).*cos(omega_h*tvec-phi_h) + Q_m*cos(omega_drive*tvec-phi);

% Plot analytical solution for charge

figure(3),

%plot(tvec,Q,'.r','LineWidth',10)

hold on

% Solution for current

I = Q_mh*exp(-alpha*tvec).*(alpha*cos(omega_h*tvec-phi_h) + omega_h*sin(omega_h*tvec-phi_h))...
    + Q_m*omega_drive*sin(omega_drive*tvec-phi);

I_m = Q_m*omega_drive;

% Plot analytical solution for current

figure(4)

%plot(tvec,I,'.r','LineWidth',2.5)