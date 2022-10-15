clc;
clear;
close all;

a = 0;
b = 2.7;
n = [10:10:90 , 100:100:900, 1000:1000:10000];

exact_solution = integral(@f,a,b);

for i=1:length(n)
    monte_out(i) = Montinteg(a,b,n(i),@f);
    trapz_out(i) = my_trapezoidal(a,b,n(i),@f);
    Mont_err(i) = (monte_out(i) - exact_solution )/exact_solution*100;
    trapz_err(i) = (trapz_out(i) - exact_solution )/exact_solution*100;
end

figure(1)
plot(n,Mont_err)
xlabel("Point numbers")
ylabel("Error %")
title("Mont Carlo")
figure(2)
semilogy(n,trapz_err)
xlabel("Point numbers")
ylabel("log Error %")
title("Trapezoidal")
