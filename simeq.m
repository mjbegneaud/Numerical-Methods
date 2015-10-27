% Authors:
%  Matthew Begneaud
%  Changler Lagarde
% 10/23/15


function simeq(A, b, n)
% Solves a system of simultaneous system of linear equations
[L, U] = decomp(A,n);
solve(A,b,L,U,n)
end

function [L, U] =  decomp(A, n)
% Decomposes a matrix into an upper and lower triangular matrix

    if det(A) == 0
        fprintf('A is a singular matrix (determinant = 0');
        return
    end
    
     L = zeros(n);
     U = zeros(n);

    for j = 1: n
        for i = 1:n
            
            sum = 0;
            p = j-1;
            
            for k = 1:p
                sum = sum+(L(i,k)*U(k,j));
            end
            
            if i == j
                U(i,j) = 1;
            end
            
            if i >= j
                
                L(i,j) = A(i,j) - sum; 
                
            else
                
                U(i,j) = (1/L(i,i))*(A(i,j)-sum);
                
            end
        end
    end
end



function [x] = solve(A,b,L,U,n)
% Solves a system of equations using LU Factorization (Crout's Method
% specifically)
% y = L\b;
% x = U\y;
y = zeros(n,1);

% Forward elimination step
y(1) = b(1) / L(1,1);
for i = 2:n
    sum = 0;
    for j = 1:(i-1)
        sum = sum + L(i,j) * y(j);
    end
    y(i) = (b(i) - sum)/L(i,i);
end

% Back substitution step
x(n) = y(n);
for i = (n-1):-1:1
    sum = 0;
    for j = (i+1):n
        sum = sum + U(i,j) * x(j);
    end
    x(i) = y(i) - sum;
end


end
