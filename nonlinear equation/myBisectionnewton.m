function [y,x] = myBisectionnewton(f,a,b)

j=0;
% Solves it by method of bisection.
if f(a)*f(b)>0 
    disp('Choose another guess')
else
    p = (a + b)/2;
    err = abs(f(p));
    while err > 0.1
   if f(a)*f(p)<0 
       b = p;
   else
       a = p;          
   end
    p = (a + b)/2; 
   err = abs(f(p));
   j = j + 1;
    end
x = p;

err = abs(f(p));

i = 1;
while err>1e-6
    prime = (f(x+0.0001) - f(x))/0.0001;
    x = x - f(x)/prime;
    err = abs(f(x));
    i = i+1;
end 
y = f(x);

    
end

m = i + j;
fprintf('%i\n', m);