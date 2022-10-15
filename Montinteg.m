function [s1] = Montinteg(a,b,n,f)
ymax = max(f(linspace(a,b,10000)));
xstar = (b-a).*rand(1,n) + a;
ystar = ymax*rand(1,n);
m = 0;
for i = 1:length(xstar)
    if 0 <= ystar(i) && ystar(i) <= f(xstar(i))
        m = m+1;
    end       
end
      
s1 = (m/n)*ymax*(b-a);
   


