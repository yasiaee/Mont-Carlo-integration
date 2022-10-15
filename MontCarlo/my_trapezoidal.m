function [s1] = my_trapezoidal(a,b,n,f)

deltax = (b-a)/n;

x = [a:deltax:b];

s1 = deltax * ( 0.5 * f(x(1)) + sum(f(x(2:n))) + 0.5 * f(x(n+1)) );