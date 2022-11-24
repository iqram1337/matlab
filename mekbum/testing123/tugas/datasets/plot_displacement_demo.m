%Simple GNU Octave Code for plot and mapping the vector displacement
%Created by Wahyu Triyoso, for teaching EqMechanics
load displacement_grid_demo.dat;
model = displacement_grid_demo;
load grid_demo;
x = model(:,1); y = model(:,2);
u = model(:,3); v = model(:,4);
n1=afdim(:,1); n2=afdim(:,2);
U=reshape(u,n1,n2);
V=reshape(v,n1,n2);
X=reshape(x,n1,n2);
Y=reshape(y,n1,n2);
%
lon0=98; lon1=108; lat0=-8.5; lat1=-3; %tugas_kuliah_mekbum
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
hold on;
ttl = title('Map Gradient U/y');
set(ttl,'FontName','Helvetica','FontSize',18,'FontWeight','bold');
colorbar
%
