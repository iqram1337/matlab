clc
clear

% importing data
load("datasets/displacement_grid_demo.dat");
model1 = displacement_grid_demo;

% declare variable
x = model1(:,1);
y = model1(:,2);
u = model1(:,3);
v = model1(:,4);

% reshape variable
n1=56; n2=101;

X = reshape(x,n1,n2);
Y = reshape(y,n1,n2);
U = reshape(u,n1,n2);
V = reshape(v,n1,n2);

% menghitung gradien
[DxU, DyU] = gradient(U);
[DxV, DyV] = gradient(V);

% menentukan batas axis latitude-longitude
lon0 = 98; 
lon1 = 108;
lat0 = -8.4; 
lat1 = -3;

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
figure(4)
pcolor(X, Y, DxV);
    
hold on;
plot(x, y, '-k');
axis([lon0 lon1 lat0 lat1]);

title('Map Gradient V/x');
colorbar
hold off;

%% plot ke-5
figure(5)
pcolor(X, Y, DyV);
    
hold on;
plot(x, y, '-k');
axis([lon0 lon1 lat0 lat1]);

title('Map Gradient V/y');
colorbar
hold off;

%% menghitung gradien
[DxU, DyU] = gradient(U);
[DxV, DyV] = gradient(V);

% menghitung strain
strain = [];
Exx = DxU;
Eyy = DxU;
Exy = 0.5*(DyU+DxV);

for i = 1:size(U,1)
    for j = 1:size(V,1)
    strain = [Exx(i,j), Exy(i,j); Eyy(i,j), Exy(i,j)];
    eigen = eig(strain);
    end
end

e1 = eigen(1);
e2 = eigen(2);

%% merotasi strain
e11 = strain(1,1);
e12 = strain(1,2);
e21 = strain(2,1);
e22 = strain(2,2);

sudut = [1:180];
e11_new = zeros(length(sudut),1);
e12_new = zeros(length(sudut),1);
e21_new = zeros(length(sudut),1);
e22_new = zeros(length(sudut),1);

for i = 1:length(sudut)
    e11_new(i) = ((e11 + e12)/2) + ((e11 - e12)/2) * cos(2*sudut(i)*pi/180) + e12/2*(sin(2*sudut(i)*pi)/180);
    e22_new(i) = ((e11 + e12)/2) - ((e11 - e12)/2) * cos(2*sudut(i)*pi/180) - e12/2*(sin(2*sudut(i)*pi)/180);
    e12_new(i) = ((-(e11 - e12)/2) * sin(2*sudut(i)*pi/180)) + e12/2 * cos(2*sudut(i)*pi/180);
end

%% plot strain transormed
% figure(6)
% 
% plot(sudut, e11_new, sudut, e22_new, sudut, e12_new);
% title("Strain After Rotation");
% 
% xlabel('\theta (degree)');
% ylabel('Strain');
% grid on;
% legend('e11 New', 'e22 New', 'e12 New');

%% testing
figure(6)

pcolor(X, Y, Exy);
hold on
plot(x, y, 'k-');
axis([lon0 lon1 lat0 lat1]);
colorbar;













