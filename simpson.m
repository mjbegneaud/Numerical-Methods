function [I] = simpson(func, a, b, n)
% Performs a numerical integration of the user defined 
% function "func" using Simpson's 1/3 Rule using n strips
% a and b define the range on which the function is integrated
    
    h = (b-a)/n;
    
    odd_terms = 0;
    for i=a+h:2*h:b-h
        odd_terms = odd_terms + 4*func(i);
    end
    
    even_terms = 0;
    for j=a+2*h:2*h:b-2*h
        even_terms = even_terms + 2*func(j);
    end
    
    I = (h/3)*(func(a) + odd_terms + even_terms + func(b));
end      
