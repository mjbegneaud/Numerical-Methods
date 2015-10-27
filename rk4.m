function [t, y] = rk4(func, yStart, tStart, tEnd, dt)
% Solves a differenctial equation using the Runge-Kutta 4th Order Method
% func is user defined function
% yStart and tStart are start values for y and t, tEnd is the end value for t
% dt is the differential step value

% Allocating memory space for vectors
n = floor(((tEnd+0.1)-tStart)/dt);
t = (tStart:dt:tEnd)';
y = yStart;
yvec = zeros(n,1);

for i=1:1:n
    
    k1 = dt*func(t(i), y);
    k2 = dt*func(t(i)+0.5*dt, y+0.5*k1);
    k3 = dt*func(t(i)+0.5*dt, y+0.5*k2);
    k4 = dt*func(t(i)+dt, y+k3);
    
    yvec(i,:) = y + (1/6)*(k1+2*k2+2*k3+k4);
    y = y + (1/6)*(k1+2*k2+2*k3+k4);
    
end
y = yvec


% %%%%%%%%% Plotting %%%%%%%%%%%%%
plot(t,y)
xlabel('y')
ylabel('t')
grid on

end
