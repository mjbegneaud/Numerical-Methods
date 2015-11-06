function [a1, a0, r2] = linreg(x,y)
% Finds a linear trend line given a set of independent and dependent data.
    
    % Parameters
    n=length(x);
    xavg = mean(x);
    yavg = mean(y);
    
    
%     % Sums using for loops
%     sumxy=0;
%     for i=1:1:n
%        sumxy = sumxy + x(i)*y(i); 
%     end
%     
%     sumx=0;
%     for j=1:1:n
%         sumx = sumx + x(i);
%     end
%     
%     sumy=0;
%     for k=1:1:n
%         sumy = sumy + y(i);
%     end
%         
%     sumx2=0;
%     for l=1:1:n
%         sumx2 = sumx2 + (x(i))^2;
%     end
    
    % Alternative sum method using MATLAB built in function
    sumx=sum(x);
    sumy=sum(y);
    sumx2=sum(x.*x);
    sumxy=sum(x.*y);
    
    
    % Linear constants
    a1 = (n*sumxy-(sumx*sumy))/(n*sumx2-(sumx)^2);
    a0 = yavg - a1*xavg;
        
    
     % Standard Deviation and r^2 value
    St = sum((y-mean(y)).^2);
   
    Sr=0;
    for i=1:1:n
        Sr = Sr + (y(i)-a0-a1*x(i))^2;
    end
    
    r2 = (St - Sr)/(St);

    
    % Plotting
    xp = linspace(min(x),max(x),20)
    yp = a0 + a1*xp 
    plot(x,y,'o' , xp,yp)
    xlabel = ('Velocity')
    ylabel = ('Drag Force')
    
    
end

