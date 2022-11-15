clear
clc

% import data file
data = importdata("data_vector.dat");

% deklarasi variabel data
x = data(:, 1);
y = data(:, 2);
u = data(:, 3);
v = data(:, 4);

% reshape variabel
X = reshape(x, 2, 2);
Y = reshape(y, 2, 2);
U = reshape(u, 2, 2);
V = reshape(v, 2, 2);

% plotting
quiver(X, Y, U, V);
axis([99.5 100.5 -8.5 -7.5]);

% menghitung gradien
[DxU, DyU] = gradient(U);

[DxV, DyV] = gradient(V);