function derivs = Harmonicfuncirc(t,f_array,C,L,R,epsilon_m,omega_drive)
% Define function that calculates derivatives entering the
% harmonic oscillator equation. It is assumed that the second order
% equation has been rewritten as a set of two first order equations.

%   derivs: output argument
%   Harmonicfuncirc: name of function
%   t,f_array,k,m: time, array containing charge Q (f_array(1)) and
%   current I (f_array(2)), spring constant, mass

omega_0 = 1/sqrt(L*C);
alpha = R/(2*L);

% define column vector derivs
derivs = zeros(2,1);

% dQ/dt = -I
derivs(1) = -f_array(2);

% dI/dt = - 2*alpha*I + omega_0^2*Q - (epsilon_m/L)*sin(omega*t) 
derivs(2) = -2*alpha*f_array(2) + omega_0^2*f_array(1) + (epsilon_m/L)*sin(omega_drive*t);
%-(k/m)*f_array(1)-(b/m)*f_array(2)+F_m*cos(omega_drive*t);





end

