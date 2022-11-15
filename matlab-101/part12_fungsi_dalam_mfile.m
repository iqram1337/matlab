clear
clc

jarijari = 5;
x0 = 0;
y0 = 0;

[hasilx1, hasily1] = fungsi_lingkaran(jarijari,x0,y0);
[hasilx2, hasily2] = fungsi_lingkaran(1,2,0);
[hasilx3, hasily3] = fungsi_lingkaran(1,-2,0);

plot(hasilx1, hasily1)

hold on
plot(hasilx2, hasily2)
plot(hasilx3, hasily3)
hold off
