% Solution of wave equation using Leap-frog method.

% Boundary condition: sinusoidal pulse on left endpoint

clear all; close all; clc;


% Constants entering the wave equation
v   = 1; % Wave speed
L   = 10; % Length of elastic string

%----------------------------Numerics--------------------------------------

% Grid spacing
dx  = L/2000;

% Number of spatial grid points (an integer)
Nx  = floor(L/dx); 

% Time step
dt  = dx/v; % Max time step which fulfills the stability requirement

% Factor entering leap frog algorithm
alpha = v*dt/dx;

% Allocation of arrays

x_arr   = zeros(Nx+1,1); % Spatial grid along x-axis
x_arr   = [0:Nx]'*dx; % x_arr(1) = 0, x_arr(Nx+1) = L

y0_arr   = zeros(Nx+1,1); % Displacement along y-axis at previous time step
y1_arr   = zeros(Nx+1,1); % Displacement at present time step
y2_arr   = zeros(Nx+1,1); % Displacement at next time step

u0_arr   = zeros(Nx+1,1); % Velocity along y-axis at previous time step

%--------------------------------------------------------------------------

% Right boundary conditions (time dependent left boundary conditions specified below)

y0_arr(end)   = 0; % Fixed right endpoint
y1_arr(end)   = 0;
y2_arr(end)   = 0;

% Initial conditions

y0_arr(1:end)   = 0; % Displacement
u0_arr(1:end)   = 0; % Velocity


% Advance time one step forward based on initial conditions for displacement
% and velocity at t=0. This plays the role of a second initial condition
% used for the time loop below at t = 0 + dt.
y1_arr(2:end-1)   = 0.5*alpha^2*y0_arr(1:end-2)+(1-alpha^2)...
    *y0_arr(2:end-1)+0.5*alpha^2*y0_arr(3:end)+dt*u0_arr(2:end-1);

time = 0 + dt; 


% Start time dependent sinusoidal pulse on left endpoint
 fac = 10;
amp = 1.0;

%y1_arr(1) = amp*sin(fac*(time/(L/v))*pi);                
y1_arr(1) = amp*sin(time*pi);
y2_arr(1) = y1_arr(1);

% Time loop

counter = 0;

while time < 50
    counter = counter+1;
    
    % Calculate displacement at next time step
    y2_arr(2:end-1)   = alpha^2*y1_arr(1:end-2)+2*(1-alpha^2)*y1_arr(2:end-1)...
                    +alpha^2*y1_arr(3:end)-y0_arr(2:end-1);
                
    % Update displacement at previous time step
                y0_arr = y1_arr;
                
    time = time + dt;
                
    % Update time dependent pulse on left endpoint                      
                if time <= 0.300*L/v
                    y1_arr(1) = amp*sin(fac*(time/(L/v))*pi);
                end
                
                % Update displacements at present and next time step
                y2_arr(1) = y1_arr(1);
                y1_arr = y2_arr;
    
    % Plot wave. If plotting delays execution speed, increase counter.                
             if counter == 1 %5
                 figure(1),
                 plot(x_arr,y2_arr,'k','LineWidth',2)
                 hold on
                 I = y2_arr > 0.9999 & y2_arr < 1.0001;
                 plot(x_arr(I),y2_arr(I),'or','MarkerSize',6,'MarkerFaceColor','r')
                 hold on
                 plot(x_arr(1000),y2_arr(1000),'og','MarkerSize',6,'MarkerFaceColor','g')
                 axis([x_arr(1) x_arr(end) -3*amp 3*amp])
                 drawnow
                 hold off
                 counter = 0;
             end
end