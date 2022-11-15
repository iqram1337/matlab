clear
clc

% fungsi dengan ouput dan input
[xling, yling] = lingkaran(5);
[xling2, yling2] = lingkaran(4);
[xling3, yling3] = lingkaran(3);
[xling4, yling4] = lingkaran(2);

plot(xling,yling,xling2,yling2,xling3,yling3,xling4,yling4)

function [x, y] = lingkaran(r)

    theta = linspace(0,2*pi,100)
    x = r*cos(theta)
    y = r*sin(theta)
end