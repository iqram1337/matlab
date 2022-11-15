clear
clc

for i=1:20

    if i == 10
        disp('angka 10 ditemukan')
        %break; % keluar dari looping
        continue % balik ke awal looping
    end
    pause(0.5); % menunda program berjalan per detik
    disp(i);
    disp('ulang loop');

end
disp('akhir dari looping');