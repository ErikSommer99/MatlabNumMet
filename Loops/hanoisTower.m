% Script that calculates, recursive, how
% many moves one must make of the rings in
% Hanoi tower for a given number of rings.

% Rings
N=input('How many rings? ');

% Calculates the number of moves
i=1;
for k=2:N
  i=2*i+1;
end

i