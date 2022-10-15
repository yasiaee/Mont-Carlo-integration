clc;
clear;
close all;

P = load("P.dat");
G = load("G.dat");
A = load("A.dat");

% [x,landa,s] = eqnsolver(A,G,P,10000);
% x(17)

omega = [10000:10000:200000];

for i = 1:length(omega)

[x,landa,s(i)] = eqnsolver(A,G,P,omega(i));

end

figure(1)
plot(omega,s)
xlabel("omega")
ylabel("iterations")
title("omega ieterations plot")
