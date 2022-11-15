clc
clear

load displacement_data1.dat;
%model1 = displacement_data1;
model1 = xlsread('latlon_data.xlsx');

x = model1(:,1);
y = model1(:,2);
u = model1(:,3);
v = model1(:,4);

n1=10; n2=10;

U=reshape(u,n1,[]);
V=reshape(v,n1,[]);
X=reshape(x,n1,[]);
Y=reshape(y,n1,[]);



lon0=98; lon1=110;
lat0=-10; lat1=-2;

load m_coasts

x=ncst(:,1);
y=ncst(:,2);

pl=plot(x,y,'k-');
set(pl,'LineWidth',1.5,'Color','k');
axis ([lon0 lon1 lat0 lat1]);

hold on
h=quiver(X,Y,U,V);


