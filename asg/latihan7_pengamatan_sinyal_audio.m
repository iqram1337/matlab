% Pengamatan Frekuensi Pada Sinyal Audio

clear
clc

[y,Fs] = audioread('Recording.m4a');

ys = y(:,1)
%Fs=16000;%nilai default Fs=16000
sound(ys,Fs)

figure(1)
plot(ys)
figure(2)
YS=fft(ys);
YS1 = YS(1:(round(length(YS)/2)));
N=length(YS1)
f=((0:(N)-1)/N)*(Fs/2);

%plot((abs(Y(1:3400))))
figure(2)
plot(f,abs(YS1))