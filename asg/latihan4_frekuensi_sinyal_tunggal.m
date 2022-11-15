% Pengamatan Frekuensi Pada Sinyal Tunggal

clear
clc

Fs=100;
t=(1:100)/Fs;
f=5;
s=sin(2*pi*f*t);

subplot(2,1,1)
plot(t,s)
xlabel('time (s)')

S=fft(s,512);
w=(0:255)/256*(Fs/2);

subplot(2,1,2)
plot(w,abs(S(1:256)))
xlabel('frequency')