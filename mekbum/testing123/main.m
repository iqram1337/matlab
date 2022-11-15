%%%%KELOMPOK 1 Mekanika Kerak Bumi Kelas-03
%%%%KELOMPOK 1 Mekanika Kerak Bumi Kelas-03
%%%%KELOMPOK 1 Mekanika Kerak Bumi Kelas-03


load displacement_data1.dat;
model = displacement_data1;
load grid_1;
x = model(:,1); y = model(:,2);
u = model(:,3); v = model(:,4);
n1=afdim(:,1); n2=afdim(:,2);
U=reshape(u,n1,n2);
V=reshape(v,n1,n2);
X=reshape(x,n1,n2);
Y=reshape(y,n1,n2);
%
lon0=97; lon1=110; lat0=-10; lat1=-1; %tugas_kuliah_mekbum
figure(1);
%
load m_coasts;
x=ncst(:,1); y=ncst(:,2);
pl=plot(x,y,'k-');
set(pl,'LineWidth',1.5,'Color','k');
%lon0=90; lon1=95; lat0=5; lat1=14;
axis ([lon0 lon1 lat0 lat1]);
hold on;
ttl = title('Map Vector Displacement');
set(ttl,'FontName','Helvetica','FontSize',18,'FontWeight','bold');
h=quiver(X,Y,U,V,'k');
%
[dxu,dyu]=gradient(U);
[dxv,dyv]=gradient(V);
figure(2);
pcolor(X,Y,dxu); hold on;
x=ncst(:,1); y=ncst(:,2);
pl=plot(x,y,'k-');
set(pl,'LineWidth',1.5,'Color','k');
axis ([lon0 lon1 lat0 lat1]);
grid on;
hold on;
ttl = title('Map Gradient U/x');
set(ttl,'FontName','Helvetica','FontSize',18,'FontWeight','bold');
colorbar
%
figure(3);
pcolor(X,Y,dyu); hold on;
x=ncst(:,1); y=ncst(:,2);
pl=plot(x,y,'k-');
set(pl,'LineWidth',1.5,'Color','k');
axis ([lon0 lon1 lat0 lat1]);
grid on;
hold on;
ttl = title('Map Gradient U/y');
set(ttl,'FontName','Helvetica','FontSize',18,'FontWeight','bold');
colorbar
%
figure(4);
pcolor(X,Y,dxv); hold on;
x=ncst(:,1); y=ncst(:,2);
pl=plot(x,y,'k-');
set(pl,'LineWidth',1.5,'Color','k');
axis ([lon0 lon1 lat0 lat1]);
grid on;
hold on;
ttl = title('Map Gradient V/x');
set(ttl,'FontName','Helvetica','FontSize',18,'FontWeight','bold');
colorbar
%
figure(5);
pcolor(X,Y,dyv); hold on;
x=ncst(:,1); y=ncst(:,2);
pl=plot(x,y,'k-');
set(pl,'LineWidth',1.5,'Color','k');
axis ([lon0 lon1 lat0 lat1]);
grid on;
hold on;
ttl = title('Map Gradient V/y');
set(ttl,'FontName','Helvetica','FontSize',18,'FontWeight','bold');
colorbar
%%Perhitungan  Strain dan Princile Strain
e=zeros(size(U,2),size(V,2));
exx=zeros(size(U,2),size(V,2));
eyy=zeros(size(U,2),size(V,2));
for i= 1:size(U,2)
  for j= 1:size(V,2)
    strain=[dxu(i,j),(dyu(i,j)+dxv(i,j))/2;(dyu(i,j)+dxv(i,j))/2,dyv(i,j)];
    eigen=eig(strain);
    eigen=eig(strain,'matrix');
    exx(i,j)=e(1,1);
    eyy(i,j)=e(2,2);
  endfor
endfor

figure(6);
pcolor(X,Y,exx); hold on;
x=ncst(:,1); y=ncst(:,2);
pl=plot(x,y,'k-');
set(pl,'LineWidth',1.5,'Color','k');
axis ([lon0 lon1 lat0 lat1]);
hold on;
ttl = title('Prinsip strain exx');
set(ttl,'FontName','Helvetica','FontSize',18,'FontWeight','bold');
%h=quiver(X,Y,U,V,'k');
colorbar
figure(7);
pcolor(X,Y,eyy); hold on;
x=ncst(:,1); y=ncst(:,2);
pl=plot(x,y,'k-');
set(pl,'LineWidth',1.5,'Color','k');
axis ([lon0 lon1 lat0 lat1]);
hold on;
ttl = title('Prinsip strain eyy');
set(ttl,'FontName','Helvetica','FontSize',18,'FontWeight','bold');
%h=quiver(X,Y,U,V,'k');
colorbar
e11=strain(1,1);
e22=strain(2,2);
e12=strain(1,2);
e21=strain(2,1);
strain_rotate = [e11 e12; e21 e22];
n =181;
dsudut = 1;
e11_new = zeros(n,1); %n baris, 1 kolom
e22_new = zeros(n,1);
e12_new = zeros(n,1);

% Strain setelah dirotasi
for i = 1:n
    sudut(i) = (i-1)*dsudut;
    e11_new = 0.5*(e11 + e22) + 0.5*(e11 - e22)*(cos((2*sudut)*pi/180)) + e12*(sin((2*sudut)*pi/180));
    e22_new = 0.5*(e11 + e22) - 0.5*(e11 - e22)*(cos((2*sudut)*pi/180)) - e12*(sin((2*sudut)*pi/180));
    e12_new = -0.5*(e11 - e22)*(sin((2*sudut)*pi/180)) + e12*(cos((2*sudut)*pi/180));
end

figure(8)
plot(sudut, e11_new,'.',sudut, e22_new, '.',sudut, e12_new, '.')
xlabel('\theta (degree)')
xlim([0 180]) %boundaries for the x-axis
ylabel('Strain')
%ylim([-0.065 0.04]) %boundaries for the y-axis
title('Strain after rotation di titik akhir','fontsize',12, 'color', 'r')
legend('e11 New', 'e22 New', 'e12=e21 New')
grid on
grid minor
hold on
theta = rad2deg(atan((e12)/(e11-e22))/2);
disp (theta);
%seismic moment
_max = zeros(size(U,2),size(V,2));
for i = 1:21;
  for j = 1:21;
    if abs(exx(i,j)) > abs(eyy(i,j)); % |e1|>|e2| bakal print |e1|
      e_max(i,j) = abs(exx(i,j));
     else
      e_max(i,j) = abs(eyy(i,j));
    endif
  endfor
endfor

H = 20*((10^5)); %cm
A = (10^6)*(10^6); %cm

%Momen Seismik
H = 20*((10^5)); %cm
A = (10^6)*(10^6); %cm
%rigidity
rigidity = 3.4*((10)^11); %dyne/cm2
%Momen Seismik
Mo = 2*rigidity*H*A*(e)

%Deefinsi Mo mattriks
Mo=zeros(21);
jumlah=0;
for i= 1:size(U,2)
  for j= 1:size(V,2)
    Mo(i,j)=2*rigidity*A*H*e_max(i,j);
    jumlah= jumlah + Mo(i,j);
  endfor
endfor
rata=jumlah/441;
figure(9);
pcolor(X,Y,Mo); hold on;
x=ncst(:,1); y=ncst(:,2);
pl=plot(x,y,'k-');
set(pl,'LineWidth',1.5,'Color','k');
axis ([lon0 lon1 lat0 lat1]);
hold on;
ttl = title('Moment SEISMIC');
set(ttl,'FontName','Helvetica','FontSize',18,'FontWeight','bold');
%h=quiver(X,Y,U,V,'k');
colorbar
%magnitude moment
Mw=(2/3)*log10(rata2)-10.73

