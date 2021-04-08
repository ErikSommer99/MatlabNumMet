function derivs = Harmfun(t,f_array,k,m)
% Define function that calculates derivatives entering the
% harmonic oscillator equation. It is assumed that the second order
% equation has been rewritten as a set of two first order equations.

%   derivs: output argument
%   Harmonicfun: name of function
%   t,f_array,k,m: time, array containing position x (f_array(1)) and
%   velocity v (f_array(2)), spring constant, mass

% define column vector derivs
derivs = zeros(2,1);

% dx/dt = v
derivs(1) = f_array(2);

% dv/dt = -k/m*x
derivs(2) = -(k/m)*f_array(1);

end

