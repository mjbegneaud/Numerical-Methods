function [A, B, C, xp, yp] = polyfit(m,x,y)
% Finds a polynomial trend line given a set of independent
% and dependent data. x and y are data points, m is 
% the order of the desired polynomial.
    
    % Parameters        
    A = zeros(m+1);
    B = zeros(m+1,1);

    % Calculate sums, fill vectors A, B, and C
    for i=1:1:m+1        
        sum_xy = sum((x.^(i-1)).*y);
       
        for j=1:i
            k=i+j-2;
            sum_x = sum(x.^k);
            A(i,j) = sum_x;
            A(j,i) = sum_x;
        end
              
        B(i) = sum_xy;    
    end

    C=A\B;
   
    
% %%%%%%%% Plotting %%%%%%% 
    % Set up plot points
    xp = linspace(min(x),max(x),20);
    yp = zeros(length(xp),1);
    L = length(xp);
    for i=1:1:m+1
        for j=1:1:L
            yp(j) = sum(C(i)*xp(j)^(i-1));
        end
    end
    plot(x,y,'o' , xp,yp)
    
end

