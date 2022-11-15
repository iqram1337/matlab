% Pada contoh 1, panjang x[n] dibatasi 3 kali perioda. Sekarang, mari kita pilih
% nilai N yang besar (untuk melakukan transformasi dengan banyak titik), dan variasikan
% jumlah perulangan dari perioda fundamentalnya.

clear
clc
n = [0:29];
x1 = cos(2*pi*n/10); % 3 periods
x2 = [x1 x1]; % 6 periods
x3 = [x1 x1 x1]; % 9 periods
N = 2048;
X1 = abs(fft(x1,N));
X2 = abs(fft(x2,N));
X3 = abs(fft(x3,N));
F = [0:N-1]/N;

subplot(3,1,1)
plot(F,X1),title('3 periods'),axis([0 1 0 50])
subplot(3,1,2)
plot(F,X2),title('6 periods'),axis([0 1 0 50])
subplot(3,1,3)
plot(F,X3),title('9 periods'),axis([0 1 0 50])