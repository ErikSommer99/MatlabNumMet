% Script that finds eigenvalues and eigenvectors of a matrix

M=[-4 6 6; -2 5 5; 2 -3 -3];

% Eigenvalues
eig(M)

lambda = -4;

det(M-lambda*eye(3)) % Proof if equals 0

% Eigenvectors
[P D] = eig(M)

x=P(:,1);
lambda = D(1,1);
M*x-lambda*x



