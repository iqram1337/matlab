clear
clc

% matriks
A = [1 2; 3 4]
B = [5 6; 7 8]

% perkalian
C = A*B

% kuadrat matriks
D = A^2;

% perkalian korespondensi satu satu
E = A.*B;


% A*X=C, lalu kita ingin tau matrix X?
% menggunakan matriks left division
X = A\C

% Y*B=C, lalu kita ingin tau matrix X?
% menggunakan matriks right division
Y = C/B