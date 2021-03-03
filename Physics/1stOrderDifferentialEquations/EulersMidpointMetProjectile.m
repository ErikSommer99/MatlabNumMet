% Calculate the speed and position of a projectile in the gravitational field with
% air resistance by Euler's midpoint method. The projectile has a mass
% m = 2.5 kg and starting speed v_0 = 150 m / s with an angle of 40 degrees above
% horizontal direction. The air resistance force is F_D = -bv, which b = 0.30.

clear

m = 2.5; % Mass
b = 0.3; % Air resistance coefficient
g = 9.81;

% Start time and end time
t_start = 0; % = t_0
t_slutt = 25; % = t_N

% Starting position and starting speed
x_start = 0; % x_0
y_start = 0; % y_0
vx_start = 150*cosd(40); % = v_0x
vy_start = 150*sind(40); % = v_0y




% **********
% dt = 1
% **********

% Size / length of time step
dt = 1;

% Total number of time steps
N = (t_slutt-t_start)/dt;

% Starting conditions
t(1) = t_start; % In Matlab, all vectors must start with index 1 (n = 0 -> n = 1)
x(1) = x_start;
y(1) = y_start;
vx(1) = vx_start;
vy(1) = vy_start;

% Time loop

for n=1:N

    % Calculate half test step for the speed with Euler's method
    vx_pr(n) = vx(n) - (b/m)*vx(n)*dt/2;
    vy_pr(n) = vy(n) - ((b/m)*vy(n)+g)*dt/2;

    % Calculate full time step using Euler's midpoint method
    vx(n+1) = vx(n) - (b/m)*vx_pr(n)*dt;
    vy(n+1) = vy(n) - ((b/m)*vy_pr(n)+g)*dt;
    
    % Update the time vector for the next time
    t(n+1) = t(n) + dt;
    
    % Calculates the position coordinates using Euler's midpoint method
    x(n+1) = x(n) + vx_pr(n)*dt;
    y(n+1) = y(n) + vy_pr(n)*dt;
    
end

% Done. 

% Calculates exact solutions

% First with air resistance
vx_eks = vx_start*exp(-(b/m)*t);
vy_eks = vy_start*exp(-(b/m)*t) + (m*g/b)*(exp(-(b/m)*t) - 1);

x_eks = (m*vx_start/b)*(1 - exp(-b*t/m));
y_eks = (m^2*g/b^2 + m*vy_start/b)*(1-exp(-b*t/m)) - m*g*t/b;

% Without air resistance (constant acceleration, bev. Similar ok to use)
vx_ul = vx_start*ones(N+1,1); % v_x = v_0x
vy_ul = vy_start - g*t; % v_y = v_0y - g*t

x_ul = vx_start*t; % x = v_x*t
y_ul = vy_start*t - 0.5*g*t.^2; % y = v_0y*t - (1/2)*g*t^2

% Draws the graphs of the speed components: numerical solution and exact
% solutions both with and without air resistance to compare
figure(1);

subplot(2,2,1), plot(t,vx,'ok',t,vx_eks,'-r',t,vx_ul,'--b'),
xlabel('$t$ (s)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$v_x$ (m/s)','FontSize',18,'Interpreter','latex')

subplot(2,2,2), plot(t,vy,'ok',t,vy_eks,'-r',t,vy_ul,'--b'),
xlabel('$t$ (s)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$v_y$ (m/s)','FontSize',18,'Interpreter','latex')

% Draws the graphs of the position coordinates
subplot(2,2,3), plot(t,x,'ok',t,x_eks,'-r',t,x_ul,'--b'),
xlabel('$t$ (s)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$x$ (m)','FontSize',18,'Interpreter','latex')

subplot(2,2,4), plot(t,y,'ok',t,y_eks,'-r',t,y_ul,'--b'),
xlabel('$t$ (s)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$y$ (m)','FontSize',18,'Interpreter','latex')

% Draws the graphs of y as a function of x, with and without air resistance:
% shows us the shape of the path as it will actually look in the room
figure(2),
plot(x,y,'ok',x_eks,y_eks,'-r',x_ul,y_ul,'--b'),
xlabel('$x$ (m)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$y$ (m)','FontSize',18,'Interpreter','latex')
