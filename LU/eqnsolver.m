function [x,landa,s] = eqnsolver(A,G,P,omega)
syms y x landa s
[n,m] = size(G);

x = zeros(n,1);
landa = zeros(m,1);
y = zeros(m,1);
s = 0;
tolerance = 10^(-8);
coeff = (A + omega * G * G');
[l,u,p] = lu(coeff);
error =1;

while error> tolerance
    y = G' * x;
    landa = landa + omega * y;
    B = P - G * landa; 
    x = u\((l\(p*B)));
    s = s + 1;
    error = norm(G'*x);
end
