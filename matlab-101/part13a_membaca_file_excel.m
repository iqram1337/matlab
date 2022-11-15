clear
clc

filename = 'data.xls';
sheet = 'Sheet1';
range = 'A1:B20';

[num, txt, raw] = xlsread(filename, sheet, range);

t = num(:,1);
y = num(:,2);

plot(t,y)

xlabel(txt(1))
ylabel(txt(2))