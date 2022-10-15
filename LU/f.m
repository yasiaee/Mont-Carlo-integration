function [x,landa,s] = f(A,G,P,omega)

[n,m] = size(G);

x = zeros(n,1);
landa = zeros(m,1);

s = 0;
tolerance = 10^(-8);
rhs = (A + omega * G * G');
error =1;

while error> tolerance
    y = G' * x;
    landa = landa + omega * y;
    lhs = P - G * landa; 
    x = linsolve(rhs,lhs);
   
    s = s + 1;
    error = norm(G'*x);
end
