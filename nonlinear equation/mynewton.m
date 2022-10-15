function [y,x] = mynewton(f,x)

err = abs(f(x));

i = 1;
while err>1e-6
    prime = (f(x+0.0001) - f(x))/0.0001;
    x = x - f(x)/prime;
    err = abs(f(x));
    i = i+1;
end 
y = f(x);
disp(i);
    
end