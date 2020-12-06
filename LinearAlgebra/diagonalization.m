% Script that diagonalizes a given matrix
A=[1 1; 4 1];

[P,D] = eig(A); % % D = eigenvalues, P = eigenvectors

P
D

PDinvP = P * D * inv(P)