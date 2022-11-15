clear
clc

e = [1 3 4];
f = [6 7 8];

% skalar
a = 7;

% vector
b = [ 1 2 3 4 5 ];
c = [ 1;2;3;4;5 ];

% matrix
d = [1 2; 3 4];

% transpose
bt = b';
ct = c';
dt = d';

% penjumlahan vector
sum = b' + c;

% perkalian vector dot
mul1 = dot(e, f);

% perkalian vector cross
mul2 = cross(e, f);

% penggabungan dua buah vector (concatenate)
g = [b e];
h = [b; c'];
i = [b; e 4 4];