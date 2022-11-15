clear
clc

% pendeteksi bilangan ganjil atau genap
a = input('masukkan angka = ');

ganjil = mod(a,2);

if ganjil
    fprintf('angka %d adalah ganjil\n', a);
else
    fprintf('angka %d adalah genap\n', a);
end

% contoh lain
umur = input('berapa umur anda: ');

if umur < 17
    disp('anda masih di bawah umur!!!');
elseif umur < 50
    disp('umur anda sudah cukup');
else
    disp('anda sudah terlalu berumur');
end