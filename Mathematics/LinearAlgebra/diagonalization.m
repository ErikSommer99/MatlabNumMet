% Script that diagonalizes a given matrix
A=[1 1; 4 1];

[P,D] = eig(A); % % D = eigenvalues, P = eigenvectors

if unique(eig(A))
    P
    D
    PDinvP = P * D * inv(P)
else
    print('Eigenvalues are not unique. The matrix is not diagonalizable')
end