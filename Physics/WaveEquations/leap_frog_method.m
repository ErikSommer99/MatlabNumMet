% Solution of wave equation using Leap-frog method.

% Boundary condition: sinusoidal pulse on left endpoint

clear; clc;


% Constants entering the wave equation
v   = 1.0; % Wave speed
L   = 10.0; % Length of elastic string

%----------------------------Numerics--------------------------------------

% Grid spacing
dx  = L/100;

% Number of spatial grid points (an integer)
Nx  = floor(L/dx); 

% Time step
dt  = 0.1*dx/v; % Time step (small to smooth out large gradient at boundary)

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

% Right boundary conditions (time dependent left boundary conditions
% specified below)

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

y_m = 1.0; % Amplitude
n = 4.0; % Number of half wavelengths divided by length of string.
         % Integral n gives resonance. n not integral means freqency of
         % driving force is different from resonant frequencies of string.

%time = 0;         
         
y1_arr(1) = y_m*sin((pi*n*v/L)*time);                
y2_arr(1) = y1_arr(1);

%time = time + dt;

% Time loop

counter = 0;
scrsz = get(0,'ScreenSize');
figure('Position',[0.01*scrsz(3) 0.05*scrsz(4) 0.98*scrsz(3) 0.85*scrsz(4)])

while time < 150
    counter = counter+1;
    
    % Calculate displacement at next time step
    y2_arr(2:end-1)   = alpha^2*y1_arr(1:end-2)+2*(1-alpha^2)*y1_arr(2:end-1)...
                    +alpha^2*y1_arr(3:end)-y0_arr(2:end-1);
                
    % Update displacement at previous time step
                y0_arr = y1_arr;
                
    time = time + dt;
                
    % Update time dependent pulse on left endpoint                      
                
    y1_arr(1) = y_m*sin((pi*n*v/L)*time);
                
    % Update displacements at present and next time step
    y2_arr(1) = y1_arr(1);
    y1_arr = y2_arr;
    
    % Plot wave. If plotting delays execution speed, increase counter.                
             if counter == 2 %5
                 plot(x_arr,y2_arr,'o')
                 axis([x_arr(1) x_arr(end) -3*y_m 3*y_m])
                 %axis('equal')
                 drawnow
                 counter = 0;
             end
end