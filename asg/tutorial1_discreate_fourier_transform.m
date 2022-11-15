clear
clc


x = [1 2 3 4 0 0 0 0 0 0];
for k1 = 1:length(x)
    X(k1) = 0 ;
    k = k1-1;
    for n1 = 1:length(x);
        n = n1-1;
        X(k1) = X(k1)+x(n1) * exp((-j*2*pi*k*n)/length(x));
    end
end
x
X
