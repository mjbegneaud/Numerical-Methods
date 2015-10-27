function root = newton(x, stop, func)
%solves for the root of any user-defined function using 
%the Newton-Raphson method

max_iteration = 25;
i=0;
h = 1*exp(-8); 
% this is the optimal step size for double precision

     while (i <= max_iteration && abs(func(x)) > stop)
         i =i+1;
         x = x - func(x)/deriv(x,h,func);
     end
root = x;
end

function dx = deriv(x,h,func)
    dx = (func(x+h)-func(x))./h;
    
end
