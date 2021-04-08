function derivs = Harmfun_damped(t,f_array,k,m,b)
% Define function that calculates derivatives entering the
% damped harmonic oscillator equation. It is assumed that the second order
% equation has been rewritten as a set of two first order equations.

%   derivs: output argument
%   Harmonicfun: name of function
%   t,f_array,k,m,b: time, array containing position x (f_array(1)) and
%   velocity v (f_array(2)), spring constant, mass

% define column vector derivs
derivs = zeros(2,1);

% dx/dt = v
derivs(1) = f_array(2);

% dv/dt = (-k/m*x)-(b/m)*dx/dt
derivs(2) = -(k/m)*f_array(1)-(b/m)*f_array(2);

end