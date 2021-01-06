% Solution of heat conduction equation

% Boundary conditions: fixed temperatures

clear; clc;

% Constant entering the heat conduction equation
kappa   = 1.1*10^(-4); % Thermal diffusivity
% Width or length of system
L = 0.6;

%----------------------------Numerics--------------------------------------

% Grid spacing
dx  = L/20;

% Number of spatial grid points (an integer)
Nx  = floor(L/dx); 

% Time step
dt  = 0.9*(dx^2/(2*kappa)); % Time step
%dt = 4.2;

% Factor entering algorithm
alpha = kappa*dt/dx^2;

% Allocate and assign values to arrays

x_arr   = [0:Nx]'*dx; % Spatial grid along x-axis.
                      % x_arr(1) = 0, x_arr(Nx+1) = L
T_arr = zeros(Nx+1,1); % Temperature distribution                      

%--------------------------------------------------------------------------
                      
% Initial condition
T_arr(2:Nx) = 0.0;

% Boundary conditions

T_arr(1) = 10.0; % Left boundary
T_arr(Nx+1) = 10.0; % Right boundary



% Time loop

time = 0;

scrsz = get(0,'ScreenSize');
figure('Position',[0.01*scrsz(3) 0.05*scrsz(4) 0.98*scrsz(3) 0.85*scrsz(4)])

plot(x_arr,T_arr,'-'),
xlabel('$x$ (m)','FontSize',18,'VerticalAlignment','Top','Interpreter','latex'),
ylabel('$T$ (K)','FontSize',18,'Interpreter','latex')

counter = 0;

while time < 1000
    counter = counter+1;
    
    % Calculate temperature at next time step
    T_arr(2:end-1) = alpha*(T_arr(3:end) + T_arr(1:end-2))...
                     + (1-2*alpha)*T_arr(2:end-1);
                
    time = time + dt;
                
    % Plot temperature. If plotting delays execution speed, increase counter.                
             if counter == 1 %5
                 plot(x_arr,T_arr,'-'),
                 axis([x_arr(1) x_arr(end) 0 max(T_arr)]),
                 xlabel('$x$ (m)','FontSize',18,'VerticalAlignment'...
                     ,'Top','Interpreter','latex'),
                ylabel('$T$ (K)','FontSize',18,'Interpreter','latex')
                 %axis('equal')
                 drawnow
                 counter = 0;
             end
end