clear 

a = 0;
b = 2.7;


%{
syms x

y(x) = x^2+3-3*sin(x^3);
xcrit = solve(diff(y, x),x);
xcrit(xcrit < a | xcrit > b) = [];
xcrit = unique([xcrit; a; b]);
ycrit = subs(y,x,xcrit);
[maxy, maxidx] = max(ycrit);
fprintf('maximum is %g at %g\n', maxy, xcrit(maxidx));
C = double(maxy);
%}

C = max(f(linspace(a,b,10000)));


for n = [10,100,1000,10000]
    xstar = (b-a).*rand(1,n) + a;

    ystar = C*rand(1,n);


    m = 0;

    for i = 1:length(xstar)
        if 0 <= ystar(i) && ystar(i) <= f(xstar(i))
            m = m+1;
        
        end 
    end

    fprintf('the number of points: %g\n', m);

    s1 = m/length(xstar)*C*(b-a);
    fprintf('Integral approximation: %g\n', s1);
    s2 = integral(@f,a,b);
    e = mae(s1-s2);
    
    fprintf('Integral : %g\n', s2);

    fprintf('error : %g\n', e);

end


%figure
%plot(e,[10,100,1000,10000])