% Calculate the path, which means the position as a function of time, of a moving car
% with a given speed v = 2 * b * t (corresponds to the differential equation
% dx / dt = 2bt). The car starts in the position x = 0 at time t = 0.

% Calculates 3 numerical solutions with time step length resp. 1, 0.1 and 0.01 and
% plots all 3 in the interval 0 <t <3 together with analytical solution


clear

% Parameters describing the speed
b = 1;

% Start time and end time
t_start = 0; % = t_0
t_slutt = 3; % = t_N

% Starting position
x_start = 0; % = x_0




% **********
% dt = 1
% **********

% Size / length of time step
dt = 1;

% Total number of time steps
N = (t_slutt-t_start)/dt;

% Create vector / table that will contain (the discrete) times
t = [];

% Create vector / table that will contain the (discrete) positions of the car
x = [];

% Starting conditions
t(1) = t_start; % I Matlab må alle vektorer starte med indeks 1 (n=0 -> n=1)
x(1) = x_start;

% Time loop (Pedagogical version)

for n=1:N

    % Calculate the speed (derivative) at the current time
    v(n) = 2*b*t(n);

    % Update the time vector for the next time
    t(n+1) = t(n) + dt;
    
    % Calculate the position at the next time by Euler's method
    x(n+1) = x(n) + v(n)*dt;
    
end

% FINISHED. Draws the graph
figure(1),
plot(t,x,'k','LineWidth',2),
xlabel('$t$ (s)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$x$ (m)','FontSize',18,'Interpreter','latex')

% Hold on to the same figure (for the next plot)
hold on


% **********
% dt = 0.1
% **********

% Repeats the calculation above, now with dt = 0.1 and more efficient coding
dt = 0.1;
N = (t_slutt-t_start)/dt;
t_ny = t_start:dt:t_slutt;
x_ny(1) = x_start;
v_ny = 2*b*t_ny;

% Time loop (more efficient than above)
for n=1:N
    % Calculate position at the next time by Euler's method and add
    % this position to as a new element in the vector x_ny
    x_ny = [x_ny, x_ny(n)+v_ny(n)*dt];
end

% FINISHED. Draws the graph
plot(t_ny,x_ny,'k','LineWidth',2)
hold on


% **********
% dt = 0.01
% **********

% Repeats the calculation above, now with dt = 0.01
dt = 0.01;
N = (t_slutt-t_start)/dt;
t_nny = t_start:dt:t_slutt;
x_nny(1) = x_start;
v_nny = 2*b*t_nny;

for n=1:N
    x_nny = [x_nny, x_nny(n)+v_nny(n)*dt];
end

plot(t_nny,x_nny,'k','LineWidth',2)
hold on


% Analytical solution

t_a = t_start:0.1:t_slutt;
x_a = b*t_a.^2;

plot(t_a,x_a,'or','LineWidth',2)