clc
clear

% importing data
load displacement_data1.dat;
model1 = displacement_data1;

% declare variable
x = model1(:,1);
y = model1(:,2);
u = model1(:,3);
v = model1(:,4);

n1=21; n2=21;

U = reshape(u,n1,n2);
V = reshape(v,n1,n2);
X = reshape(x,n1,n2);
Y = reshape(y,n1,n2);

% plotting map
lon0 = 98; 
lon1 = 110;
lat0 = -10; 
lat1 = -2;

%% plot ke-1
figure(1);
load m_coasts

x = ncst(:, 1);
y = ncst(:, 2);

plot(x, y,'k-');
axis([lon0 lon1 lat0 lat1]);

hold on;
title('Map Vector Displacement');
quiver(X, Y, U, V, 'k');
hold off;

% menghitung gradien
[DxU, DyU] = gradient(U);
[DxV, DyV] = gradient(V);


%% plot ke-2
figure(2)
pcolor(X, Y, DxU);
    
hold on;
plot(x, y, '-k');
axis([lon0 lon1 lat0 lat1]);

title('Map Gradient U/x');
colorbar
hold off;


%% plot ke-3
figure(3)
pcolor(X, Y, DyU);
    
hold on;
plot(x, y, '-k');
axis([lon0 lon1 lat0 lat1]);

title('Map Gradient U/y');
colorbar
hold off;


%% plot ke-4







